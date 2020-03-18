

import 'package:netease_cloud_music_flutter/basic_info/basic_info_channel.dart';
import 'package:netease_cloud_music_flutter/basic_info/model/app_info.dart';
import 'package:netease_cloud_music_flutter/basic_info/model/device_info.dart';
import 'package:netease_cloud_music_flutter/basic_info/model/user_info.dart';
import 'package:netease_cloud_music_flutter/channels/signature/signature_channel.dart';

class AppInfoProvider {
  Future<AppInfo> provideAppInfo() {
    throw UnsupportedError("Not Supported!");
  }
}

class UserInfoProvider {
  Future<UserInfo> provideUserInfo() {
    throw UnsupportedError("Not Supported!");
  }
}

class SignatureInfoProvider {
  Future<String> provideSignature(String raw) {
    throw UnsupportedError("Not Supported!");
  }
}

class DeviceInfoProvider {
  Future<DeviceInfo> provideDeviceInfo() {
    throw UnsupportedError("Not Supported!");
  }
}

/// Class that handle the [AppInfo], [UserInfo], [DeviceInfo], etc...
class NativeInfoManager
    implements
        AppInfoProvider,
        UserInfoProvider,
        SignatureInfoProvider,
        DeviceInfoProvider {
  NativeInfoManager(
      [BasicInfoChannel basicInfoChannel, SignatureChannel signatureChannel])
      : this._basicInfoChannel = basicInfoChannel ?? BasicInfoChannel(),
        this._signatureChannel = signatureChannel ?? SignatureChannel();

  final BasicInfoChannel _basicInfoChannel;

  final SignatureChannel _signatureChannel;

  AppInfo _appInfo;
  UserInfo _userInfo;
  DeviceInfo _deviceInfo;

  Future<void> refreshAppInfo() async {
    _appInfo = await _basicInfoChannel.getAppInfo();
  }

  @override
  Future<AppInfo> provideAppInfo() async {
    if (_appInfo != null) return _appInfo;
    _appInfo = await _basicInfoChannel.getAppInfo();
    return _appInfo;
  }

  @override
  Future<String> provideSignature(String raw) {
    return _signatureChannel.getSignature(raw);
  }

  Future<void> refreshUserInfo() async {
    _userInfo = await _basicInfoChannel.getUserInfo();
  }

  @override
  Future<UserInfo> provideUserInfo() async {
    if (_userInfo != null) return _userInfo;
    _userInfo = await _basicInfoChannel.getUserInfo();
    return _userInfo;
  }

  @override
  Future<DeviceInfo> provideDeviceInfo() async {
    if (_deviceInfo != null) return _deviceInfo;
    _deviceInfo = await _basicInfoChannel.getDeviceInfo();
    return _deviceInfo;
  }
}
