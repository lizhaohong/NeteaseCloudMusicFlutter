import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/page/home_page.dart';
import 'package:netease_cloud_music_flutter/page/login_page.dart';
import 'package:netease_cloud_music_flutter/page/splash_page.dart';

var loginHandler = new Handler(
    handlerFunc: (
        BuildContext context, Map<String, List<String>> parameters){
      return LoginPage();
    }
);

var homeHandler = new Handler(
    handlerFunc: (
        BuildContext context, Map<String, List<String>> parameters){
      return HomePage();
    }
);

var splashHandler = new Handler(
    handlerFunc: (
        BuildContext context, Map<String, List<String>> parameters){
      return SplashPage();
    }
);