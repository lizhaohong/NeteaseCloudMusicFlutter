import 'package:netease_cloud_music_flutter/channels/base/channel.dart';

import 'model/app_info.dart';
import 'model/device_info.dart';
import 'model/user_info.dart';

class BasicInfoChannel extends Channel {
  String name = 'com.klook.platform/basicInfo';

  BasicInfoChannel();

  /// 获取设备信息
  Future<DeviceInfo> getDeviceInfo() async {
    Map info = await this.invokeMethod('get_device_info');
    return DeviceInfo.fromJson(Map<String, dynamic>.from(info));
  }

  // 获取用户信息
  Future<UserInfo> getUserInfo() async {
    Map info = await this.invokeMethod('get_user_info');
    info = info ?? {};
    return UserInfo.fromJson(Map<String, dynamic>.from(info));
  }

  // 获取APP信息
  Future<AppInfo> getAppInfo() async {
    Map info = await this.invokeMethod('get_app_info');
    return AppInfo.fromJson(Map<String, dynamic>.from(info));
  }
}
