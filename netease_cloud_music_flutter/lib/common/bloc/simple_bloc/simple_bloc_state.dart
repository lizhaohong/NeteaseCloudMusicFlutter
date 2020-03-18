import 'package:netease_cloud_music_flutter/common/bloc/bloc.dart';

class SimpleBlocState<T> implements BlocState {
  SimpleBlocState._(this.value);

  factory SimpleBlocState.create(BlocAsync<T> value) =>
      SimpleBlocState._(value);

  final BlocAsync<T> value;

  @override
  bool operator ==(other) {
    if (other.runtimeType != runtimeType) return false;

    return other is SimpleBlocState && other.value == value;
  }

  @override
  int get hashCode => identityHashCode(value);

  @override
  String toString() {
    return 'SimpleBlocState{value: $value}';
  }

  SimpleBlocState<T> copy(BlocAsync<T> value) => SimpleBlocState._(value);

  static SimpleBlocState<T> initialValue<T>() {
    return SimpleBlocState._(const Uninitialized());
  }
}
