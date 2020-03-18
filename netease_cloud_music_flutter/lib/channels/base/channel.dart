/// Base Channel
/// 各个业务线建议直接继承于 `DefaultChannelImplement` 来开发自己的 Channel
/// `DefaultChannelImplement` 提供了基本的 Channel 实现以及单例模式
/// 如果 `DefaultChannelImplement` 不满足需求，可以自行实现 `Channel` 接口
/// 但是不建议直接使用 Flutter 提供的 `MethodChannel`

import 'dart:async';

import 'package:flutter/services.dart';

typedef MethodCallHandler = Future Function(dynamic args);

abstract class Channel {
  String name;
  MethodChannel _channel;
  Map<String, MethodCallHandler> _methodCallHandlers = Map();

  Channel() {
    if (name != null && name.length > 0) {
      _channel = MethodChannel(name);
      this.initializeChannel();
    }
  }

  void initializeChannel() {
    _channel.setMethodCallHandler((MethodCall methodCall) {
      final methodName = methodCall.method;
      MethodCallHandler handler = _methodCallHandlers[methodName];
      // TODO: 处理方法没有找到的场景

      if (handler != null) {
        return handler(methodCall.arguments);
      }
      return null;
    });
  }

  MethodChannel getChannel() {
    return _channel;
  }

  Future<T> invokeMethod<T>(String name, [args]) async {
    return this.getChannel().invokeMethod<T>(name, args);
  }

  void bindMethodCallHandler(String name, MethodCallHandler callHandler) {
    _methodCallHandlers[name] = callHandler;
  }

  void unbindMethodCallHandler(String name) {
    _methodCallHandlers.remove(name);
  }
}
