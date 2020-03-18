import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:netease_cloud_music_flutter/common/network/common_request_exception.dart';
import 'package:rxdart/subjects.dart';

/// Abstract class that indicate the async state:
///
/// * [Uninitialized] : initial state, which is useful when you need handle the initial state
/// * [Loading] : loading state
/// * [Success] : success state
/// * [Fail] : fail state
///
/// The `call()` method has been overridden, so that you can invoke your [BlocAsync] instance like a function, e.g.,
///
/// ```dart
/// var success = Success(10);
/// var successValue = success(); // successValue = 10
/// ```
///
/// Ref: [https://dart.dev/guides/language/language-tour#callable-classes](https://dart.dev/guides/language/language-tour#callable-classes)
abstract class BlocAsync<T> {
  const BlocAsync();

  /// Returns the [Success] value or null.
  ///
  /// Can be invoked as an operator like: `yourProp()`
  call() => null;
}

class Uninitialized<T> extends BlocAsync<T> {
  const Uninitialized();

  @override
  bool operator ==(dynamic other) => other is Uninitialized<T>;

  @override
  int get hashCode => "Uninitialized".hashCode;
}

class Loading<T> extends BlocAsync<T> {
  const Loading();

  @override
  bool operator ==(dynamic other) => other is Loading;

  @override
  int get hashCode => "Loading".hashCode;
}

class Success<T> extends BlocAsync<T> {
  const Success(this._value);

  final T _value;

  @override
  call() => _value;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    return other is Success && _value == other._value;
  }

  @override
  int get hashCode => hashValues(runtimeType, identityHashCode(_value));

  @override
  String toString() {
    return 'Success{_value: $_value}';
  }
}

class Fail<T> extends BlocAsync<T> {
  const Fail(this.error);

  final Exception error;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    return other is Fail &&
        error.runtimeType == other.error.runtimeType &&
        error.toString() == other.error.toString();
  }

  @override
  int get hashCode =>
      hashValues(error.runtimeType, identityHashCode(error.toString()));

  @override
  String toString() {
    return 'Fail{error: $error}';
  }
}

extension FailEx<T> on Fail<T> {
  /// `true` if the [Fail.error] is [CancelHttpException], you can use this flag
  /// to handle you business logic if need.
  bool get isHttpRequestCancelled => this.error is CancelHttpException;
}

extension BehaviorSubjectBlocAsyncEx<T, V> on BehaviorSubject<T> {
  /// An extension function that handle the [BlocAsync] for the [BehaviorSubject] instance.
  ///
  /// We handle the [Loading] and [Fail] state for you, but you need to define the
  /// success [Function] to return the success value, and you also need to implement your
  /// reducer function to emit the new state. e.g.,
  ///
  /// ```dart
  ///
  ///   class State {
  ///     const State(this._isLoading, this._successValue, this._isFail);
  ///
  ///     final bool _isLoading;
  ///     final int _successValue;
  ///     final bool _isFail;
  ///   }
  ///
  ///   void handleExecute() {
  ///     var successValue = Future.value(10);
  ///
  ///      _subject.execute(() => successValue, (preState, blocAsync) {
  ///         if (blocAsync is Loading) return const State(true, 0, false);
  ///         if (blocAsync is Success) return const State(false, blocAsync(), false);
  ///         if (blocAsync is Fail) return const State(false, 0, true);
  ///
  ///         return const State(false, 0, false);
  ///      });
  ///   }
  ///
  /// ```
  Future<void> execute<V>(
      Future<V> Function(T Function() preState) successValue,
      T Function(T Function() preState, BlocAsync<V> blocAsync) reducer) async {
    if (this.isClosed) return;
    var preS = () => this.value;
    try {
      this.sink.add(reducer(preS, const Loading()));
      var sv = Success<V>(await successValue(preS));
      if (this.isClosed) return;
      this.sink.add(reducer(preS, sv));
    } catch (e) {
      Exception exception;
      // Although Error should be handle on the development phase, but sometimes
      // we didn't face the Error, which cause it crash in the release version,
      // so we wrap the Error inside the Exception, and report it to the Crashlytics
      // in the release version.
      if (e is Error) {
        // Force crash on debug mode
        assert(() {
          if (Platform.environment.containsKey('FLUTTER_TEST')) {
            return true;
          }

          return false;
        }(), "Pls correct the Error: $e");

        exception = WrappedErrorException(e);
        await forceReportCrash?.call(exception, null);
      } else {
        exception = e;
      }
      debugPrint(
          "[${this.toString()}] execute Exception: ${exception.toString()}");
      if (this.isClosed) return;
      this.sink.add(reducer(preS, Fail<V>(exception)));
    }
  }
}

// TODO(littlegnal): Move to standalone file when merged into car_rental branch
/// Force report the crash to Crashlytics. This is useful for that caught [Exception],
/// but we want to know what cause this [Exception] and for further fix.
Future<void> Function(dynamic error, StackTrace stackTrace, {bool forceCrash})
    forceReportCrash;

// TODO(littlegnal): Move to standalone file when merged into car_rental branch
class WrappedErrorException implements Exception {
  WrappedErrorException(this._error);
  final Error _error;

  @override
  bool operator ==(other) {
    if (other.runtimeType != runtimeType) return false;

    return other is WrappedErrorException &&
        other._error.toString() == _error.toString();
  }

  @override
  int get hashCode => hashValues(_error.runtimeType, _error.toString());

  @override
  String toString() {
    return "[WrappedErrorException] caused by: $_error ";
  }
}
