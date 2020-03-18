import 'dart:ui';

/// [Exception] that indicate the network request error when use [CommonRequest].
class HttpError implements Exception {
  const HttpError(this.message, [this.cause]);

  /// The error message
  final String message;

  /// The original error that can be null.
  final Exception cause;

  @override
  bool operator ==(other) {
    if (other.runtimeType != runtimeType) return false;
    return other is HttpError &&
        other.message == message &&
        other.cause.runtimeType == cause.runtimeType &&
        other.cause.toString() == cause.toString();
  }

  @override
  int get hashCode => hashValues(
      message, cause.runtimeType, identityHashCode(cause.toString()));

  @override
  String toString() {
    return "[HttpError] message:$message, cause: $cause";
  }
}

/// [Exception] that indicate the request has been cancelled.
class CancelHttpException implements Exception {
  CancelHttpException({String path}) : _path = path;

  /// The path that indicate which request path has been cancelled.
  final String _path;

  @override
  bool operator ==(other) {
    if (other.runtimeType != runtimeType) return false;
    return other is CancelHttpException && other._path == _path;
  }

  @override
  int get hashCode => _path.hashCode;

  @override
  String toString() {
    return "[CancelHttpException] request: $_path has been cancelled";
  }
}

/// [Exception] that indicate the business logic error when use [CommonRequest].
///
/// The response format of our server is like below:
/// ```
/// {
///    "error": {
///      "code": "string",
///      "message": "string"
///    },
///    "result": {
///
///    },
///    "success": true
/// }
/// ```
///
/// The [BusinessLogicError] will be thrown if the `code` is not 200 in the
/// `error` block. So you can catch this error outside to handle your logic. e.g.,
/// ```dart
/// var request = YourRequest();
/// try {
///   var result = await request.request();
/// } on BusinessLogicError catch(e) {
///   if (e.code == "111") {
///     // handle error when code == "111"
///     ...
///   } else {
///     ...
///   }
/// }
/// ```
class BusinessLogicError implements Exception {
  const BusinessLogicError(this.code, this.message);

  final String code;
  final String message;

  @override
  bool operator ==(other) {
    if (other.runtimeType != runtimeType) return false;
    return other is BusinessLogicError &&
        other.code == code &&
        other.message == message;
  }

  @override
  int get hashCode => hashValues(code, message);

  @override
  String toString() {
    return "[BusinessLogicError] message:$message, code: $code";
  }
}
