import 'dart:io';
import 'dart:math';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/loading_widget.dart';
import 'package:netease_cloud_music_flutter/model/banners_model.dart';
import 'package:netease_cloud_music_flutter/model/hot_search_model.dart';
import 'package:netease_cloud_music_flutter/model/mv_model.dart';
import 'package:netease_cloud_music_flutter/model/new_album_model.dart';
import 'package:netease_cloud_music_flutter/model/recommend_song_model.dart';
import 'package:netease_cloud_music_flutter/model/user_model.dart';
import 'package:netease_cloud_music_flutter/route/navigator_util.dart';
import 'package:netease_cloud_music_flutter/route/routes.dart';
import 'package:netease_cloud_music_flutter/utils/common_util.dart';
import 'package:path_provider/path_provider.dart';

import 'custom_log_interceptor.dart';

class NetUtil {
  static Dio _dio;
//  static final String baseUrl = 'http://localhost';
  static final String baseUrl = 'http://192.168.101.10:3000';

  static void init() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cj = PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(baseUrl: '$baseUrl', followRedirects: false));
    _dio.interceptors.add(CookieManager(cj));
    _dio.interceptors.add(CustomLogInterceptor(responseBody: true, requestBody: true));
  }

  static Future<Response> _get(
      BuildContext context,
      String url, {
        Map<String, dynamic> params,
        bool isShowLoading = false,
      }) async {
    if(isShowLoading) {
      Loading.showLoading(context);
    }

    try {
      return await _dio.get(url, queryParameters: params);
    } on DioError catch(e) {
      if(e == null) {
        return Future.error(Response(data: -1));
      } else if(e.response != null) {
        print("DioError url = $url error = ${e.toString()}");

        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        print("DioError url = $url error = ${e.toString()}");

        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static void _reLogin() {
    Future.delayed(Duration(milliseconds: 200),(){
      NavigatorUtil.popAndPushName(Application.key.currentContext, Routes.login);

      CommonUtil.showToast('登录失效，请重新登录');
    });
  }

  static Future <Response> refreshLogin(BuildContext context) async {
   return await _get(context, "/login/refresh");
  }

  static Future <UserModel> login(BuildContext context, String userName, String password) async {
    var response = await _get(context, "/login/cellphone", params: {
      "phone" : userName,
      "password" : password
    });

    return UserModel.fromJson(response.data);
  }

  static Future <BannersModel> getBannerData(BuildContext context) async {
    var response = await _get(context, "/banner", params: {"type" : 0}, isShowLoading: false);
    return BannersModel.fromJson(response.data);
  }

  static Future <List<HotSearchModel>> getHotSearchData(BuildContext context) async {
    var response = await _get(context, "/search/hot/detail");
    var dataList = response.data['data'];

    if(dataList is List) {
      List<HotSearchModel> list = List();

      dataList.forEach((json) {
        list.add(HotSearchModel.fromJson(json));
      });
      return list;
    } else {
      return List();
    }
  }

  static Future <RecommendSongModel> getRecommendSongData(BuildContext context) async {
    var response = await _get(context, "/recommend/resource");

    return RecommendSongModel.fromJson(response.data);
  }

  /// MV 排行
  static Future<MVModel> getTopMvData(
      BuildContext context, {
        Map<String, dynamic> params = const {
          'offset': 1,
          'limit': 10,
        },
      }) async {
    var response = await _get(context, '/top/mv', params: params);
    return MVModel.fromJson(response.data);
  }

  static Future <NewAlbumModel> getNewAlbumData(BuildContext context) async {
    Map<String, dynamic> params = const {
      'offset': 1,
      'limit': 10,
    };

    var response = await _get(context, "/top/album", params: params);

    return NewAlbumModel.fromJson(response.data);
  }
}