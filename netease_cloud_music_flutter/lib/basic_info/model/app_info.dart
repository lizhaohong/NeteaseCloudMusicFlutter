class AppInfo {
  String version;
  String apiHost;
  String apiVersion;
  String language;
  String bundleId;
  String local;
  Currency currency;
  AppInfo.fromJson(Map<String, dynamic> map) {
    print("AppInfo - " + map.toString());

    if (map == null) {
      return;
    }
    version = map["version"];
    apiHost = map["api_host"];
    apiVersion = map["api_version"];
    language = map["language"];
    bundleId = map["bundle_id"];
    local = map["local"];
    currency = Currency.fromJson(Map<String, dynamic>.from(map["currency"]));
  }
}

class Currency {
  String name;
  String symbol;
  Currency.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    symbol = map["symbol"];
  }
}
