import 'dart:collection';

import 'package:netease_cloud_music_flutter/common/network/cancellable_request.dart';
import 'package:netease_cloud_music_flutter/common/network/common_request_exception.dart';
import 'package:netease_cloud_music_flutter/common/network/http.dart';
import 'package:netease_cloud_music_flutter/common/network/serialization.dart';
import 'package:dio/dio.dart';

import 'abstract_request.dart';
import 'enums.dart';

class CommonRequest extends AbstractRequest {
  CommonRequest(HTTP http, this._interceptorList, this._serialization)
      : super(http);

  final List<Interceptor> _interceptorList;
  final Serialization _serialization;
  Map<String, CancelToken> _cancelTokenMap = HashMap();

  @override
  Interceptors interceptors() {
    final interceptors = Interceptors();
    interceptors.addAll(_interceptorList);
    return interceptors;
  }

  void cancelRequest(dynamic cancelFor, [String reason]) {
    if (cancelFor != null) {
      var key = cancelFor.toString();
      _cancelTokenMap[cancelFor]?.cancel("Cancel $key: ${reason ?? ""}");
      _cancelTokenMap.remove(key);
    }
  }

  CancelToken handleCancelToken(String cancelFor) {
    CancelToken cancelToken;
    if (cancelFor != null) {
      var key = cancelFor.toString();
      if (_cancelTokenMap.containsKey(key)) {
        cancelToken = _cancelTokenMap[key];
        cancelToken.cancel();
      }
      cancelToken = CancelToken();
      _cancelTokenMap[key] = cancelToken;
    }
    return cancelToken;
  }

  CancellableRequest<T> get<T>(String path, [Object queryParameters]) {
    return CancellableRequestImpl.fromRequest(
        commonRequest<T>(RequestMethod.GET, path,
            queryParameters: queryParameters),
        path: path);
  }

  @Deprecated("Use `get` instead. Will be removed in the future")
  Future<T> commonGet<T>(String path, [Object queryParameters]) {
    return commonRequest(RequestMethod.GET, path,
        queryParameters: queryParameters);
  }

  CancellableRequest<T> post<T>(
    String path, {
    dynamic data,
    SerializerType requestSerializerType = SerializerType.Form,
    SerializerType responseSerializerType = SerializerType.JSON,
  }) {
    return CancellableRequestImpl.fromRequest(
        commonRequest(RequestMethod.POST, path,
            data: data,
            requestSerializerType: requestSerializerType,
            responseSerializerType: responseSerializerType),
        path: path);
  }

  @Deprecated("Use `post` instead. Will be removed in the future")
  Future<T> commonPost<T>(
    String path, {
    dynamic data,
    SerializerType requestSerializerType = SerializerType.Form,
    SerializerType responseSerializerType = SerializerType.JSON,
  }) {
    return commonRequest(RequestMethod.POST, path,
        data: data,
        requestSerializerType: requestSerializerType,
        responseSerializerType: responseSerializerType);
  }

  Future<T> commonRequest<T>(
    RequestMethod method,
    String path, {
    Object queryParameters,
    dynamic data,
    SerializerType requestSerializerType = SerializerType.Form,
    SerializerType responseSerializerType = SerializerType.JSON,
    dynamic cancelFor,
  }) {
    assert(method != null);
    assert(path != null);

    CancelToken cancelToken = handleCancelToken(cancelFor);

    return request(method, path, requestSerializerType, queryParameters, data,
            responseSerializerType, cancelToken,
            interceptors: interceptors())
        .then((r) {
      // TODO(littlegnal): Will replace this implementation to `deserialize<BaseResponse<T>>(jsonDecode(r.data))` when this issue be solved  https://github.com/google/built_value.dart/issues/368
      // The result should be deserialize by using `deserialize<BaseResponse<T>>(jsonDecode(r.data))`,
      // but the `built_value` lack of support for the generic type, so we decode the json
      // to the `Map<String, dynamic>` directly at this time.
      var m = r.data;
      var isSuccess = m["success"] as bool;
      if (!isSuccess) {
        var error = m["error"];
        throw BusinessLogicError(
            error["code"] as String, error["message"] as String);
      }

      var result = m["result"];
      return _serialization.deserialize<T>(result);
    }).catchError((e) {
      print("CommonRequest error: ${e.toString()}");
      throw HttpError(e.message, e);
    }, test: (e) => e is DioError);
  }
}
