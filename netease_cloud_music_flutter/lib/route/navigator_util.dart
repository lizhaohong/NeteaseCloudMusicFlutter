import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/route/routes.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
        bool clearStack = false,
        Duration transitionDuration = const Duration(milliseconds: 250),
        RouteTransitionsBuilder transitionBuilder}) {
    FocusScope.of(context).requestFocus(FocusNode());

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
}