import 'package:flutter/widgets.dart';
import 'package:netease_cloud_music_flutter/basic_info/native_info_manager.dart';
import 'package:netease_cloud_music_flutter/channels/event/native_event_dispatcher.dart';

/// Global event handler that handle the currency/language changed and other events.
class NativeEventHandler with ChangeNotifier {
  NativeEventHandler(this._nativeEventDispatcher, this._nativeInfoManager) {
    _initEvent();
  }

  final NativeEventDispatcher _nativeEventDispatcher;
  final NativeInfoManager _nativeInfoManager;

  void _initEvent() {
    _nativeEventDispatcher.addUIRefreshEventListener((event) async {
      debugPrint(
          "NativeEventHandler: Received event:[$event], update app info");
      await _nativeInfoManager.refreshAppInfo();
      var appInfo = await _nativeInfoManager.provideAppInfo();

      notifyListeners();
    });
  }
}
