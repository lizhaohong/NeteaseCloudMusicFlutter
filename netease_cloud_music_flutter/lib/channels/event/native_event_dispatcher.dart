import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:netease_cloud_music_flutter/channels/event/native_event_channel.dart';

typedef UIRefreshEventListener = void Function(String event);
typedef UserInfoUpdateEventListener = void Function(String event);

/// Handle the events received from the [NativeEventChannel]
class NativeEventDispatcher {
  NativeEventDispatcher({NativeEventChannel nativeEventChannel}) {
    _nativeEventChannel = nativeEventChannel ?? NativeEventChannel();
    _nativeEventChannel.addEventChangedListener((event) {
      switch (event) {
        case "event_currency_changed":
        case "event_language_changed":
        case "event_force_update_ui":
          notifyUIRefreshEventListener(event);
          break;
        case "event_update_user_info":
          notifyUserInfoUpdateEventListener(event);
          break;
      }
    });
  }

  NativeEventChannel _nativeEventChannel;

  final List<UIRefreshEventListener> _uiRefreshEventListeners = List();

  final List<UserInfoUpdateEventListener> _userInfoUpdateEventListeners =
      List();

  /// Add [UIRefreshEventListener]
  VoidCallback addUIRefreshEventListener(UIRefreshEventListener listener) {
    _uiRefreshEventListeners.add(listener);

    return () {
      _uiRefreshEventListeners.remove(listener);
    };
  }

  /// Remove [UIRefreshEventListener]
  void removeUIRefreshEventListener(UIRefreshEventListener listener) {
    _uiRefreshEventListeners.remove(listener);
  }

  @visibleForTesting
  void notifyUIRefreshEventListener(String event) {
    _uiRefreshEventListeners.forEach((listener) {
      listener(event);
    });
  }

  @visibleForTesting
  List<UIRefreshEventListener> getUIRefreshEventListeners() {
    return _uiRefreshEventListeners;
  }

  /// Add [UserInfoUpdateEventListener]
  VoidCallback addUserInfoUpdateEventListener(
      UserInfoUpdateEventListener listener) {
    _userInfoUpdateEventListeners.add(listener);

    return () {
      _userInfoUpdateEventListeners.remove(listener);
    };
  }

  /// Remove [UserInfoUpdateEventListener]
  void removeUserInfoUpdateEventListener(UIRefreshEventListener listener) {
    _userInfoUpdateEventListeners.remove(listener);
  }

  @visibleForTesting
  void notifyUserInfoUpdateEventListener(String event) {
    _userInfoUpdateEventListeners.forEach((listener) {
      listener(event);
    });
  }

  @visibleForTesting
  List<UIRefreshEventListener> getUserInfoUpdateEventListeners() {
    return _userInfoUpdateEventListeners;
  }
}
