import 'package:netease_cloud_music_flutter/route/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class RouteChannel {
  final MethodChannel _channel =
      const MethodChannel('com.klook.platform/router');

  RouteChannel() {
    _channel.setMethodCallHandler((call) {
      switch (call.method) {
        case "pushReplacementNamed":
          debugPrint("pushReplacementNamed from native: ${call.toString()}");
          // The arguments format should be {"path": "your/path", "params": dynamic}
          var map = call.arguments;
          var path = map["path"];
          var params = map["params"];
          navigationService.pushReplacementNamed(path, arguments: params);
          return Future.value(true);
          break;
        case "pop":
          return Future.value(navigationService.pop());
          break;
      }

      return Future.value(false);
    });
  }

  Future<bool> route(String path, Object params) async {
    Map<String, dynamic> args = {"path": path, "params": params};
    return _channel.invokeMethod<bool>('route', args);
  }

  Future pop() async {
    return _channel.invokeMethod('pop');
  }
}
