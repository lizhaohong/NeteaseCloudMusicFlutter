import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static Router router;
  static GlobalKey<NavigatorState> key = GlobalKey(debugLabel: 'navigate_key');
  static SharedPreferences sharedPreferences;
  static double screenWidth;
  static double screenHeight;
  static double statusBarHeight;
  static double bottomBarHeight;

  static initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}