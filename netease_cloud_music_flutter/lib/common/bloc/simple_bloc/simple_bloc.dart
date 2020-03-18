import 'package:netease_cloud_music_flutter/common/bloc/base_bloc_mixin.dart';
import 'package:netease_cloud_music_flutter/common/bloc/simple_bloc/simple_bloc_repository.dart';
import 'package:netease_cloud_music_flutter/common/bloc/simple_bloc/simple_bloc_state.dart';

class SimpleBloc<T, R extends SimpleBlocRepository<T>>
    extends SingleStateBaseBloc<SimpleBlocState<T>> {
  SimpleBloc(this._simpleBlocRepository)
      : super(SimpleBlocState.initialValue());

  final R _simpleBlocRepository;

  Future<void> getData() {
    return execute<T>((_) => _simpleBlocRepository.getData(),
        (preState, blocAsync) {
      return preState().copy(blocAsync);
    });
  }
}
