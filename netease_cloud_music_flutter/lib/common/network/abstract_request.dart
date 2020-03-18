import 'package:dio/dio.dart';

import 'enums.dart';
import 'http.dart';

abstract class AbstractRequest {
  AbstractRequest(this._http);

  final HTTP _http;

  CancelToken _cancelToken;

  Interceptors interceptors();

  void cancel() {
    _cancelToken.cancel("cancelled");
  }

  Future request(
      RequestMethod method,
      String path,
      SerializerType requestSerializerType,
      Object queryParameters,
      dynamic data,
      SerializerType responseSerializerType,
      CancelToken cancelToken,
      {Interceptors interceptors}) {
    if (interceptors == null) {
      interceptors = this.interceptors();
    }
    _cancelToken = cancelToken;
    return _http.request(
      method,
      path,
      requestSerializerType,
      queryParameters,
      data,
      responseSerializerType,
      cancelToken,
      interceptors,
    );
  }
}
