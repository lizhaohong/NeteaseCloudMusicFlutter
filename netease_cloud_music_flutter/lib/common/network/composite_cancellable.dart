import 'package:netease_cloud_music_flutter/common/protocol/cancellable.dart';
import 'package:flutter/foundation.dart';

/// [CompositeCancellable] help you composite multiple [Cancellable] and [cancel]
/// them at once.
/// ```dart
/// var compositeCancellable = CompositeCancellable();
/// var testCancellable1 = _TestCancellable();
/// var testCancellable2 = _TestCancellable();
///
/// compositeCancellable += testCancellable1;
/// compositeCancellable += testCancellable2;
///
/// compositeCancellable.cancel();
/// ```
class CompositeCancellable implements Cancellable {
  @visibleForTesting
  final List<Cancellable> cancellableList = [];

  void add(Cancellable cancellable) {
    cancellableList.add(cancellable);
  }

  /// This is a syntax sugar that allow you to [add] a [Cancellable] by using
  /// `+` or `+=`. i.e.,
  /// ```dart
  /// var compositeCancellable = CompositeCancellable();
  /// var testCancellable1 = _TestCancellable();
  /// compositeCancellable = compositeCancellable + testCancellable1;
  /// compositeCancellable.cancel();
  ///
  /// var compositeCancellable = CompositeCancellable();
  /// var testCancellable1 = _TestCancellable();
  /// compositeCancellable += testCancellable1;
  /// compositeCancellable.cancel();
  /// ```
  CompositeCancellable operator +(Cancellable cancellable) {
    add(cancellable);
    return this;
  }

  @override
  void cancel() {
    cancellableList.forEach((e) {
      e.cancel();
    });
    cancellableList.clear();
  }
}
