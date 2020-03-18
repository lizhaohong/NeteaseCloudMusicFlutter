import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:netease_cloud_music_flutter/common/bloc/base_bloc.dart';
import 'package:netease_cloud_music_flutter/common/bloc/bloc_async.dart';
import 'package:netease_cloud_music_flutter/common/bloc/bloc_state.dart';
import 'package:netease_cloud_music_flutter/common/network/cancellable_request.dart';
import 'package:netease_cloud_music_flutter/common/network/composite_cancellable.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

/// An implementation of [BaseBloc] that only accept single value of [BlocState].
/// You can use the exposed [stream] directly as a parameter to the [StreamBuilder].
/// All data will be emit to the [stream] If the [execute] has been invoked. e.g.,
///
/// ```dart
/// class TestBlocState {
///   TestBlocState(this.value);
///
///   final BlocAsync<int> value;
/// }
///
/// class TestSingleStateBaseBloc extends SingleStateBaseBloc<TestBlocState> {
///   TestSingleStateBaseBloc(this._simpleBlocRepository, TestBlocState initialValue)
///       : super(initialValue);
///
///   final R _simpleBlocRepository;
///
///   Future<void> getData() {
///     return execute<int>((_) => _simpleBlocRepository.getData(),
///         (preState, blocAsync) {
///       return TestBlocState(blocAsync);
///     });
///   }
/// }
///
/// ```
abstract class SingleStateBaseBloc<S extends BlocState> implements BaseBloc {
  SingleStateBaseBloc(S initialValue)
      : assert(initialValue != null),
        this.subject = BehaviorSubject<S>.seeded(initialValue);

  @visibleForTesting
  @protected
  final BehaviorSubject<S> subject;

  Stream<S> get stream => subject.stream;

  Future<void> execute<T>(
      Future<T> Function(S Function() preState) successValue,
      S Function(S Function() preState, BlocAsync<T> blocAsync) reducer) async {
    return subject.execute<T>(successValue, reducer);
  }

  @override
  void dispose() {
    subject.close();
  }
}

mixin CancellableRequestSingleStateBaseBlocMixin<S extends BlocState>
    on SingleStateBaseBloc<S> {
  @visibleForTesting
  final CompositeCancellable compositeCancellable = CompositeCancellable();

  Future<void> executeRequest<T>(
      CancellableRequest<T> Function(S preState) successValue,
      S Function(S Function() preState, BlocAsync<T> blocAsync) reducer) async {
    return execute((preState) {
      return successValue(preState())
          .addToCompositeCancellable(compositeCancellable)
          .asFuture();
    }, reducer);
  }

  @override
  void dispose() {
    compositeCancellable.cancel();
    super.dispose();
  }
}
