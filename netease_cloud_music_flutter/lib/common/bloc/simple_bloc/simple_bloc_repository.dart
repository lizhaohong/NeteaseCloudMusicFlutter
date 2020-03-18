import 'package:netease_cloud_music_flutter/common/bloc/base_bloc_repository.dart';
import 'package:netease_cloud_music_flutter/common/network/common_request.dart';
import 'package:netease_cloud_music_flutter/common/network/composite_cancellable.dart';
import 'package:flutter/widgets.dart';

/// Base abstract class for only single data type repository.
abstract class SimpleBlocRepository<T> implements BaseBlocRepository {
  Future<T> getData();
}

abstract class RemoteSimpleBlocRepository<T>
    implements SimpleBlocRepository<T> {
  RemoteSimpleBlocRepository(this.commonRequest,
      {CompositeCancellable compositeCancellable})
      : this.compositeCancellable =
            compositeCancellable ?? CompositeCancellable();

  @protected
  final CommonRequest commonRequest;

  @protected
  final CompositeCancellable compositeCancellable;

  @override
  void clear() {
    compositeCancellable.cancel();
  }
}
