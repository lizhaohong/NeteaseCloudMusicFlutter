import 'dart:async';

import 'package:async/async.dart';
import 'package:netease_cloud_music_flutter/common/network/common_request_exception.dart';
import 'package:netease_cloud_music_flutter/common/network/composite_cancellable.dart';
import 'package:netease_cloud_music_flutter/common/protocol/cancellable.dart';

/// [CancellableRequest] indicate that a http request can be cancelled.
abstract class CancellableRequest<T> implements Cancellable {
  /// This allow the [CancellableRequest] can be chained like the [Future.then]
  CancellableRequest<R> then<R>(FutureOr<R> Function(T) onValue,
      {FutureOr<R> Function(Object, StackTrace) onError}) {
    throw UnimplementedError("Pls implement this function");
  }

  /// Get response from the http request.
  Future<T> asFuture() {
    throw UnimplementedError("Pls implement this function");
  }

  /// Add this [CancellableRequest] to [CompositeCancellable], so this
  /// [CancellableRequest] can be cancelled by calling [CompositeCancellable.cancel].
  ///
  /// **NOTE:** If you chain the [CancellableRequest] by using [then] function,
  /// you should invoke the [addToCompositeCancellable] after the *last* [then],
  /// or the [CancellableRequest] will not be cancelled by calling
  /// [CompositeCancellable.cancel]. i.e.,
  /// DON't
  /// ```dart
  /// _commonRequest.post<HomeCategorySection>(
  ///     "/v1/reappserv/jrpass/home/category")
  ///     .addToCompositeCancellable(compositeCancellable)
  ///     .then(...);
  /// ```
  ///
  /// DO
  /// ```dart
  /// _commonRequest.post<HomeCategorySection>(
  ///     "/v1/reappserv/jrpass/home/category")
  ///     .then(...)
  ///     .addToCompositeCancellable(compositeCancellable);
  /// ```
  CancellableRequest<T> addToCompositeCancellable(
      CompositeCancellable compositeCancellable) {
    throw UnimplementedError("Pls implement this function");
  }
}

class CancellableRequestImpl<T> implements CancellableRequest<T> {
  // This will never be called outside.
  CancellableRequestImpl._()
      : _cancelableOperation = null,
        _path = null;

  /// Only use this constructor internally.
  CancellableRequestImpl._fromCancelableOperation(
      CancelableOperation<T> cancelableOperation,
      {String path})
      : _cancelableOperation = cancelableOperation,
        _path = path;

  CancellableRequestImpl.fromRequest(Future<T> actualRequest, {String path})
      : assert(actualRequest != null),
        _cancelableOperation = CancelableOperation.fromFuture(actualRequest),
        _path = path;

  /// [CancelableOperation] that handle the cancellation internally.
  final CancelableOperation<T> _cancelableOperation;

  /// The path indicate that which request path has been cancelled, can be null.
  final String _path;

  @override
  Future<T> asFuture() {
    // `_cancelableOperation.valueOrCancellation(null)` will return `null`,
    // when `cancel` has been called, and, because the request will never
    // return `null`, so we use `null` as a sign of cancellation. If the value
    // with `null` is returned, we will throw `CancelHttpException` to
    // break the `Future`.
    return _cancelableOperation.valueOrCancellation(null).then((value) {
      if (value == null) {
        throw CancelHttpException(path: _path);
      }

      return value;
    });
  }

  @override
  CancellableRequest<R> then<R>(FutureOr<R> Function(T) onValue,
      {FutureOr<R> Function(Object, StackTrace) onError}) {
    var cancellableOperation =
        _cancelableOperation.then(onValue, onError: onError);
    return CancellableRequestImpl._fromCancelableOperation(cancellableOperation,
        path: _path);
  }

  @override
  CancellableRequest<T> addToCompositeCancellable(
      CompositeCancellable compositeCancellable) {
    compositeCancellable += this;
    return this;
  }

  @override
  void cancel() {
    _cancelableOperation.cancel();
  }
}
