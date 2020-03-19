import 'package:netease_cloud_music_flutter/common/bloc/base_bloc.dart';
import 'package:netease_cloud_music_flutter/page/login/data/login_repository.dart';

class LoginBloc implements BaseBloc {
  LoginBloc(this._loginRepository);

  final LoginRepository _loginRepository;

  void userLogin(String phone, String password) {

  }

  @override
  void dispose() {

  }
}