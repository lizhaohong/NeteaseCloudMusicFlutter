import 'package:netease_cloud_music_flutter/common/bloc/bloc_provider.dart';
import 'package:netease_cloud_music_flutter/page/home/bloc/main_bloc.dart';
import 'package:netease_cloud_music_flutter/page/home/bloc/splash_bloc.dart';
import 'package:netease_cloud_music_flutter/page/home/ui/main_page.dart';
import 'package:netease_cloud_music_flutter/page/home/ui/splash_page.dart';
import 'package:netease_cloud_music_flutter/route/page_builder.dart';
import 'package:netease_cloud_music_flutter/page/login/login_page_route.dart' as login;

/// All page routes of the APP
final Map<String, PageBuilder> pageRoutes = {
  "/": (buildContext, route, arguments) {
    return BlocProvider<SplashBloc>(
        create: (context) => SplashBloc(), child: SplashPage());
  },
  ...login.routes
};
