import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/provider/play_list_provider_model.dart';
import 'package:netease_cloud_music_flutter/provider/play_song_provider_model.dart';
import 'package:netease_cloud_music_flutter/provider/user_provider_model.dart';
import 'package:netease_cloud_music_flutter/page/splash_page.dart';
import 'package:netease_cloud_music_flutter/route/routes.dart';
import 'package:netease_cloud_music_flutter/utils/log_util.dart';
import 'package:provider/provider.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  LogUtil.init();

  ///配置错误界面
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Center(
      child: Text("视图错误了"),
    );
  };

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserProviderModel>(
      create: (_) => UserProviderModel(),
    ),
    ChangeNotifierProvider<PlaySongProviderModel>(
      create: (_) => PlaySongProviderModel(),
    ),
    ChangeNotifierProvider<PlayListProviderModel>(
      create: (_) => PlayListProviderModel(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: Application.key,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: SplashPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}

