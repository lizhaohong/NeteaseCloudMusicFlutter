import 'dart:async';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'enums.dart';

String methodName(RequestMethod method) {
  switch (method) {
    case RequestMethod.GET:
      return "GET";
    case RequestMethod.POST:
      return "POST";
    default:
      return "GET";
  }
}

class HTTP {
  var _dio;
  static final _instance = HTTP();
  HTTP() {
    _dio = Dio();
    if (kDebugMode) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
//        DebugProxyManager.find((findProxy) {
//          if (findProxy != null) {
//            client.findProxy = findProxy;
//          }
//        });
      };
    }
    _dio.interceptors.add(LogInterceptor(
        responseBody: kDebugMode,
        requestBody: kDebugMode,
        logPrint: (log) {
          debugPrint(log);
        }));
  }
  static HTTP get instance => _instance;
  Future<Response<T>> request<T>(
    RequestMethod method,
    String path,
    SerializerType requestSerializerType,
    Object queryParameters,
    dynamic data,
    SerializerType responseSerializerType,
    CancelToken cancelToken,
    Interceptors interceptors,
  ) async {
    Options options = new Options();
    options.method = methodName(method);
    options.responseType = ResponseType.json;
    if (method == RequestMethod.POST) {
      switch (requestSerializerType) {
        case SerializerType.Form:
          options.contentType = Headers.formUrlEncodedContentType;
          break;
        case SerializerType.JSON:
          options.contentType = Headers.jsonContentType;
          break;
        default:
      }
    }

    RequestOptions requestOptions =
        _dio.mergeOptions(options, path, data, queryParameters);
    requestOptions.cancelToken = cancelToken;

    // Convert the request/response interceptor to a functional callback in which
    // we can handle the return value of interceptor callback.

    _interceptorWrapper(interceptor, bool request) {
      return (data) async {
        bool type = request ? (data is RequestOptions) : (data is Response);
        if (_isErrorOrException(data) || type) {
          if (type) {
            if (!request) data.request = data.request ?? requestOptions;
            return interceptor(data).then((e) => e ?? data);
          } else {
            throw assureDioError(data, requestOptions);
          }
        } else {
          return assureResponse(data, requestOptions);
        }
      };
    }

    // Convert the error interceptor to a functional callback in which
    // we can handle the return value of interceptor callback.
    _errorInterceptorWrapper(errInterceptor) {
      return (err) async {
        if (err is! Response) {
          var _e = await errInterceptor(assureDioError(err, requestOptions));
          if (_e is! Response) {
            throw assureDioError(_e ?? err, requestOptions);
          }
          err = _e;
        }
        // err is a Response instance
        return err;
      };
    }

    Future<Response<T>> _dispatchRequest(RequestOptions options) {
      return _dio.request(options.path, options: options);
    }

    // Build a request flow in which the processors(interceptors)
    // execute in FIFO order.

    // Start the request flow
    Future future = Future.value(requestOptions);

    // Add request interceptors to request flow
    interceptors.forEach((Interceptor interceptor) {
      future = future.then(_interceptorWrapper(interceptor.onRequest, true));
    });

    // Add dispatching callback to request flow
    future = future.then(_interceptorWrapper(_dispatchRequest, true));

    // Add response interceptors to request flow
    interceptors.forEach((Interceptor interceptor) {
      future = future.then(_interceptorWrapper(interceptor.onResponse, false));
    });

    // // Add error handlers to request flow
    interceptors.forEach((Interceptor interceptor) {
      future = future.catchError(_errorInterceptorWrapper(interceptor.onError));
    });

    return future.then<Response<T>>((data) {
      return assureResponse<T>(data);
    }).catchError((err) {
      if (err == null || _isErrorOrException(err)) {
        throw assureDioError(err, requestOptions);
      }
      return assureResponse<T>(err, requestOptions);
    });
  }

  static Response<T> assureResponse<T>(response,
      [RequestOptions requestOptions]) {
    if (response is Response<T>) {
      response.request = response.request ?? requestOptions;
    } else if (response is! Response) {
      response = Response<T>(data: response, request: requestOptions);
    } else {
      T data = response.data;
      response = Response<T>(
        data: data,
        headers: response.headers,
        request: response.request,
        statusCode: response.statusCode,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusMessage: response.statusMessage,
      );
    }
    return response;
  }

  static bool _isErrorOrException(t) => t is Exception || t is Error;
  static DioError assureDioError(err, [RequestOptions requestOptions]) {
    DioError dioError;
    if (err is DioError) {
      dioError = err;
    } else if (_isErrorOrException(err)) {
      // 抛出非网络错误
      throw err;
    } else {
      dioError = DioError(error: err);
    }
    dioError.request = dioError.request ?? requestOptions;
    return dioError;
  }

  // interceptor
  static Future<Response<T>> resolve<T>(response) {
    if (response is! Future) {
      response = Future.value(response);
    }
    return response.then<Response<T>>((data) {
      return HTTP.assureResponse<T>(data);
    }, onError: (err) {
      // transform "error" to "success"
      return HTTP.assureResponse<T>(err);
    });
  }

  /// Assure the final future state is failed!
  static Future<Response<T>> reject<T>(err) {
    if (err is! Future) {
      err = Future.error(err);
    }
    return err.then<Response<T>>((v) {
      // transform "success" to "error"
      throw HTTP.assureDioError(v);
    }, onError: (e) {
      throw HTTP.assureDioError(e);
    });
  }
}
