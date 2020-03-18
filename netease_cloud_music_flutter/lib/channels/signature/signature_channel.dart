import '../base/channel.dart';

class SignatureChannel extends Channel {
  String name = 'com.klook.platform/signature';

  /// 获取签名
  Future<String> getSignature(String raw) async {
    return await this.invokeMethod('get_signature', raw);
  }
}
