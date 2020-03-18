import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/di/global_di.dart';
import 'package:netease_cloud_music_flutter/home/ui/home_page_route.dart';
import 'package:netease_cloud_music_flutter/route/navigation_service.dart';
import 'package:netease_cloud_music_flutter/route_configs.dart';

void main() async {
  if (kDebugMode) {
    runApp(MyApp());
    _initApp();
  } else {
    FlutterError.onError = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    };
    runZoned<Future<Null>>(() async {
      runApp(MyApp());
      WidgetsFlutterBinding.ensureInitialized();
//      FlutterCrashlytics().initialize();
//      forceReportCrash = FlutterCrashlytics().reportCrash;
      _initApp();
    }, onError: (error, stackTrace) async {
//      await FlutterCrashlytics()
//          .reportCrash(error, stackTrace, forceCrash: false);
    });
  }
}

void _initApp() {
  WidgetsBinding.instance.renderView.automaticSystemUiAdjustment = false;
}

class MyApp extends StatelessWidget implements NavigatorServiceProvider {
  @override
  Widget build(BuildContext context) {
    return GlobalDI(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        navigatorObservers: navigatorObservers,
        onGenerateRoute: (settings) {
          var pageBuilder = pageRoutes[settings.name];
//          if (settings.name == "/") {
//            return HomePageRoute<Map<dynamic, dynamic>>(
//                widget:
//                pageBuilder(context, settings.name, settings.arguments));
//          }
          return MaterialPageRoute<Map<dynamic, dynamic>>(
              settings: settings,
              builder: (context) {
                return pageBuilder(context, settings.name, settings.arguments);
              });
        },
      ),
    );
  }
}
