import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/model/user_model.dart';
import 'package:netease_cloud_music_flutter/utils/common_util.dart';
import 'package:netease_cloud_music_flutter/utils/net_util.dart';
import 'dart:convert' as convert;

class UserProviderModel with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  void initUser() {
    if (Application.sharedPreferences.containsKey("user")) {
      String s = Application.sharedPreferences.getString("user");

      _user = UserModel.fromJson((convert.jsonDecode(s)));
    }
  }

  Future <UserModel> login(BuildContext context, String userName, String password) async {
    UserModel user = await NetUtil.login(context, userName, password);
    if (user.code > 299) {
      CommonUtil.showToast('登录失败，请检查账号密码');
      return null;
    }
    CommonUtil.showToast('登录成功');
    _saveUserInfo(user);
    return user;
  }

  /// 保存用户信息到 sp
  _saveUserInfo(UserModel user) {
    _user = user;
    Application.sharedPreferences.setString('user', convert.jsonEncode(user.toJson()));
  }
}