import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

typedef NativeEventChangedListener = void Function(String eventName);

/// The event channel
///
/// The events just be forwarded so all the events, and the events will be handled
/// by [NativeEventDispatcher]
///
/// see also:
/// [NativeEventDispatcher]
class NativeEventChannel {
  NativeEventChannel() {
    _channel.setMethodCallHandler((call) async {
      checkEventName(call.method);
      debugPrint("NativeEventChannel: Received event:[$call.method]");
      _eventChangedListeners.forEach((listener) {
        listener(call.method);
      });
    });
  }

  final MethodChannel _channel =
      const MethodChannel('com.klook.platform/event');

  final List<NativeEventChangedListener> _eventChangedListeners = List();

  void addEventChangedListener(NativeEventChangedListener listener) {
    _eventChangedListeners.add(listener);
  }

  static void checkEventName(String event) {
    assert(event.startsWith("event"),
        "The event name should be start with \"event\", e.g. \"event_update\"");
  }
}
