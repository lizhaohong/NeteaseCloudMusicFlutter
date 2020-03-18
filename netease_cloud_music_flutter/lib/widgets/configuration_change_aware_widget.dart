import 'package:flutter/cupertino.dart';
import 'package:netease_cloud_music_flutter/basic_info/native_info_manager.dart';
import 'package:netease_cloud_music_flutter/channels/event/native_event_dispatcher.dart';
import 'package:provider/provider.dart';

class _ConfigurationChangeNotifier with ChangeNotifier {
  _ConfigurationChangeNotifier(this._nativeEventDispatcher,
      this._nativeInfoManager) {
    _initEvent();
  }

  final NativeEventDispatcher _nativeEventDispatcher;
  final NativeInfoManager _nativeInfoManager;
  VoidCallback _removeListener;
  VoidCallback _updateUserInfoListener;

  void _initEvent() {
    _removeListener ??=
        _nativeEventDispatcher.addUIRefreshEventListener((event) async {
      debugPrint(
          "NativeEventHandler: Received event:[$event], update app info");
      await _nativeInfoManager.refreshAppInfo();
      var appInfo = await _nativeInfoManager.provideAppInfo();

      notifyListeners();
    });

    _updateUserInfoListener ??=
        _nativeEventDispatcher.addUserInfoUpdateEventListener((event) async {
      debugPrint(
          "NativeEventHandler: Received event:[$event], update user info");

      await _nativeInfoManager.refreshUserInfo();
    });
  }

  @override
  void dispose() {
    _removeListener?.call();
    _removeListener = null;
    _updateUserInfoListener?.call();
    _updateUserInfoListener = null;
    super.dispose();
  }
}

/// A [StatelessWidget] that can handle the configuration change (such as
/// language/currency changed), and rebuild the [_child] widget.
class ConfigurationChangeAwareWidget extends StatelessWidget {
  ConfigurationChangeAwareWidget(
      {@required NativeEventDispatcher nativeEventDispatcher,
      @required NativeInfoManager nativeInfoManager,
      @required Create<Widget> childBuilder})
      : this._nativeEventDispatcher = nativeEventDispatcher,
        this._nativeInfoManager = nativeInfoManager,
        this._childBuilder = childBuilder;

  final NativeEventDispatcher _nativeEventDispatcher;
  final NativeInfoManager _nativeInfoManager;

  final Create<Widget> _childBuilder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ConfigurationChangeNotifier(
          _nativeEventDispatcher, _nativeInfoManager),
      child: Consumer<_ConfigurationChangeNotifier>(
        builder: (context, v, ___) {
          return _childBuilder(context);
        },
      ),
    );
  }
}
