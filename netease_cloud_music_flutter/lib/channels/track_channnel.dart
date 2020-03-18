import 'package:flutter/services.dart';

class TrackChannel {
  final MethodChannel _channel =
      const MethodChannel('com.klook.platform/track');

  Future<T> trackEvent<T>(Map<String, String> args) {
    return _channel.invokeMethod<T>('track_event', args);
  }

  Future<T> trackScreen<T>(Map<String, String> args) {
    return _channel.invokeMethod<T>('track_screen', args);
  }

  Future<T> trackMixpanel<T>(Map<String, dynamic> args) {
    return _channel.invokeMethod<T>('track_mixpanel', args);
  }
}
