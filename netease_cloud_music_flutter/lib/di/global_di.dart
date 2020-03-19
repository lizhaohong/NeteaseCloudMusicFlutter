import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:netease_cloud_music_flutter/common/network/serialization.dart';
import 'package:netease_cloud_music_flutter/basic_info/basic_info_channel.dart';
import 'package:netease_cloud_music_flutter/basic_info/native_info_manager.dart';
import 'package:netease_cloud_music_flutter/channels/event/native_event_dispatcher.dart';
import 'package:netease_cloud_music_flutter/channels/signature/signature_channel.dart';
import 'package:netease_cloud_music_flutter/common/network/common_request.dart';
import 'package:netease_cloud_music_flutter/common/network/http.dart';
import 'package:netease_cloud_music_flutter/widgets/configuration_change_aware_widget.dart';
import 'package:netease_cloud_music_flutter/serializers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class that initial and provide the global used instance.
class _DIProvider {
  _DIProvider() {
    _init();
  }

  SharedPreferences _sharedPreferences;

  SharedPreferences get sharedPreferences => _sharedPreferences;

  NativeInfoManager _nativeInfoManager;

  NativeInfoManager get nativeInfoManager => _nativeInfoManager;

  NativeEventDispatcher _nativeEventDispatcher;

  NativeEventDispatcher get nativeEventDispatcher => _nativeEventDispatcher;

  Serialization _serialization;

  Serialization get serialization => _serialization;

  CommonRequest _commonRequest;

  CommonRequest get commonRequest => _commonRequest;

  void _init() async {
    _nativeInfoManager =
        NativeInfoManager(BasicInfoChannel(), SignatureChannel());
    _nativeEventDispatcher = NativeEventDispatcher();
    _serialization = Serialization(serializers);
    _sharedPreferences = await SharedPreferences.getInstance();
    List<Interceptor> interceptors = [
//      HostInterceptor(_nativeInfoManager),
//      HeaderInterceptor(
//          _nativeInfoManager, _nativeInfoManager, _nativeInfoManager),
//      SignatureInterceptor(_nativeInfoManager),
    ];
    _commonRequest = CommonRequest(HTTP.instance, interceptors, _serialization);
  }
}

class GlobalDI extends StatelessWidget {
  GlobalDI({
    Key key,
    @required Widget child,
  })  : this._child = child,
        super(key: key);

  final _DIProvider _diProvider = _DIProvider();

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NativeEventDispatcher>.value(
            value: _diProvider.nativeEventDispatcher),
        Provider<Serialization>.value(value: _diProvider.serialization),
        Provider<CommonRequest>.value(value: _diProvider.commonRequest),
        Provider<SharedPreferences>.value(value: _diProvider.sharedPreferences),
      ],
      child: ConfigurationChangeAwareWidget(
          nativeEventDispatcher: _diProvider._nativeEventDispatcher,
          nativeInfoManager: _diProvider._nativeInfoManager,
          childBuilder: (_) => _child),
    );
  }
}
