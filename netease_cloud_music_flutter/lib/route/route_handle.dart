import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/model/user_play_list_model.dart';
import 'package:netease_cloud_music_flutter/page/home_page.dart';
import 'package:netease_cloud_music_flutter/page/login_page.dart';
import 'package:netease_cloud_music_flutter/page/play_list_page.dart';
import 'package:netease_cloud_music_flutter/page/search_page.dart';
import 'package:netease_cloud_music_flutter/page/splash_page.dart';
import 'package:netease_cloud_music_flutter/page/web_view_page.dart';
import 'package:netease_cloud_music_flutter/utils/fluro_convert_utils.dart';

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

var searchHandler = new Handler(
    handlerFunc: (
        BuildContext context, Map<String, List<String>> parameters) {
      return SearchPage();
    }
);

var webHandler = new Handler(
    handlerFunc: (
        BuildContext context, Map<String, List<String>> parameters) {
      return WebViewPage(url: parameters['url']?.first, title: parameters['title']?.first);
    }
);

var playListHandler = new Handler(
    handlerFunc: (
        BuildContext context, Map<String, List<String>> parameters) {
      String value = parameters['data']?.first;
      return PlayListPage(playlist: Playlist.fromJson(FluroConvertUtils.string2map(value)));
    }
);