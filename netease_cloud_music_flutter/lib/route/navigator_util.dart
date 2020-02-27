import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/model/user_play_list_model.dart';
import 'package:netease_cloud_music_flutter/route/routes.dart';
import 'package:netease_cloud_music_flutter/utils/fluro_convert_utils.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
        bool clearStack = false,
        Duration transitionDuration = const Duration(milliseconds: 250),
        RouteTransitionsBuilder transitionBuilder,
        Map<String, dynamic> params
      }) {
    FocusScope.of(context).requestFocus(FocusNode());

    if(params != null) {
      String query = "";
      int index = 0;

      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index ++;
      }

      path = path + query;
    }

    print("lizhb come here path = $path");

    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }

  static popAndPushName(BuildContext context,String path) {
    Navigator.popAndPushNamed(context, path);
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static popUntil(BuildContext context,RoutePredicate predicate) {
    Navigator.popUntil(context, predicate);
  }

  static goLoginPage(BuildContext context) {
    _navigateTo(context, Routes.login);
  }

  static goHomePage(BuildContext context) {
    _navigateTo(context, Routes.home);
  }

  static goSearchPage(BuildContext context) {
    _navigateTo(context, Routes.search);
  }

  static goWebViewPage(BuildContext context, {Map<String, dynamic> params}) {
    _navigateTo(context, Routes.web, params:params);
  }

  static goPlayListPage(BuildContext context, {Playlist playlist}) {
    _navigateTo(context, Routes.playList+"?data=${FluroConvertUtils.object2string(playlist)}");
  }
}