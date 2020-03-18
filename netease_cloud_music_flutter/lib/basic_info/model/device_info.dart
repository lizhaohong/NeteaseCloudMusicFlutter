class DeviceInfo {
  String manufacturer;
  String platform;
  String deviceName;
  String systemVersion;
  double scale;
  String deviceId;
  String advertisingId;
  DeviceInfo.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    manufacturer = map["manufacturer"];
    platform = map["platform"];
    deviceName = map["device_name"];
    advertisingId = map["advertising_id"];
    systemVersion = map["system_version"];
    scale = map["scale"];
    deviceId = map['device_id'];
  }
}
