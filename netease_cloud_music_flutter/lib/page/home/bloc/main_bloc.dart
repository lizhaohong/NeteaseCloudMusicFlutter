import 'package:netease_cloud_music_flutter/common/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc implements BaseBloc {
  final _textSubject = BehaviorSubject<String>();

  Stream<String> get textStream => _textSubject.stream;

  @override
  void dispose() {
    _textSubject.close();
  }

  void loadData() {
    Future.delayed(Duration(seconds: 2), () {
      _textSubject.sink.add("hello");
    });
  }
}
