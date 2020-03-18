import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:netease_cloud_music_flutter/channels/route_channel.dart';
import 'package:netease_cloud_music_flutter/common/bloc/base_bloc.dart';

/// A global navigator that allow you do navigation without [BuildContext],
/// but there's some limitation, you can only access it from [StatelessWidget],
/// [StatefulWidget], [State], [BaseBloc]
///
/// see also:
/// [NavigationServiceMyAppExtension]
/// [NavigationServiceStatelessWidgetExtension]
/// [NavigationServiceStatefulWidgetExtension]
/// [NavigationServiceStateExtension]
/// [NavigationServiceBlocExtension]
class _NavigationService {
  _NavigationService._() {
    _navigatorObservers = <NavigatorObserver>[_navigatorObserverDelegate];
  }

  factory _NavigationService() {
    return _navigationService;
  }

  static final _NavigationService _navigationService = _NavigationService._();

  final GlobalKey<NavigatorState> _navigatorKey =
      new GlobalKey<NavigatorState>();

  final RouteChannel _nativeRouteChannel = RouteChannel();

  List<NavigatorObserver> _navigatorObservers;

  final _NavigatorObserverDelegate _navigatorObserverDelegate =
      _NavigatorObserverDelegate();

  /// Get topmost route
  String get topRoute => _navigatorObserverDelegate.topRoute;

  /// Add [NavigatorObserver]
  VoidCallback addNavigatorObserver(NavigatorObserver navigatorObserver) =>
      _navigatorObserverDelegate.addNavigatorObserver(navigatorObserver);

  /// see [NavigatorState.pushNamed]
  Future<T> pushNamed<T extends Object>(
    String routeName, {
    Object arguments,
  }) {
    return _navigatorKey.currentState
        .pushNamed<T>(routeName, arguments: arguments);
  }

  /// see [NavigatorState.pushNamed]
  Future<bool> pushNamedNative<T extends Object>(
    String routeName, {
    Object arguments,
  }) {
    return _nativeRouteChannel.route(routeName, arguments);
  }

  /// Pop current page or pop the native page (Activity/Fragment on Android, ViewController in iOS)
  /// if on the root page.
  /// see [NavigatorState.pop], [SystemNavigator.pop]
  bool pop<T extends Object>([T result]) {
    debugPrint(
        "_navigatorKey.currentState.canPop(): ${_navigatorKey.currentState.canPop()}");
    if (_navigatorKey.currentState.canPop()) {
      return _navigatorKey.currentState.pop<T>(result);
    } else {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else {
        _nativeRouteChannel.pop();
      }
      // Reset the root route '/' to ensure the cache page gone when the page open again
      _navigatorKey.currentState.pushReplacementNamed("/");

      return false;
    }
  }

  /// see [Navigator.pushReplacementNamed]
  Future<T> pushReplacementNamed<T extends Object, TO extends Object>(
      String routeName,
      {TO result,
      Object arguments}) {
    return _navigatorKey.currentState
        .pushReplacementNamed(routeName, result: result, arguments: arguments);
  }
}

class _NavigatorObserverDelegate extends NavigatorObserver {
  final List<NavigatorObserver> _navigatorObservers = [];

  // NOTE: Using `ModalRoute.of(context).settings.name` to get the top route is
  // easiest way to get the top route, but it will cause unexpected widget rebuild
  // at sometime, so we track the top route manually, will do some investigation
  // and try optimize it in the future.
  String _topRoute;

  String get topRoute => _topRoute;

  VoidCallback addNavigatorObserver(NavigatorObserver navigatorObserver) {
    _navigatorObservers.add(navigatorObserver);

    return () {
      _navigatorObservers.remove(navigatorObserver);
    };
  }

  @override
  void didPop(Route route, Route previousRoute) {
    _topRoute = previousRoute.settings.name;
    _navigatorObservers.forEach((e) {
      e.didPop(route, previousRoute);
    });
  }

  @override
  void didPush(Route route, Route previousRoute) {
    _topRoute = route.settings.name;
    _navigatorObservers.forEach((e) {
      e.didPush(route, previousRoute);
    });
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    _topRoute = previousRoute.settings.name;
    _navigatorObservers.forEach((e) {
      e.didRemove(route, previousRoute);
    });
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    _topRoute = newRoute.settings.name;
    _navigatorObservers.forEach((e) {
      e.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    });
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    _topRoute = previousRoute.settings.name;
    _navigatorObservers.forEach((e) {
      e.didStartUserGesture(route, previousRoute);
    });
  }

  @override
  void didStopUserGesture() {
    _navigatorObservers.forEach((e) {
      e.didStopUserGesture();
    });
  }
}

abstract class NavigatorServiceProvider {}

extension NavigationServiceMyAppExtension on NavigatorServiceProvider {
  GlobalKey<NavigatorState> get navigatorKey =>
      _NavigationService()._navigatorKey;

  List<NavigatorObserver> get navigatorObservers =>
      _NavigationService()._navigatorObservers;
}

extension NavigationServiceRouteChannelExtension on RouteChannel {
  _NavigationService get navigationService => _NavigationService();
}

extension NavigationServiceStatelessWidgetExtension on StatelessWidget {
  _NavigationService get navigationService => _NavigationService();
}

extension NavigationServiceStatefulWidgetExtension on StatefulWidget {
  _NavigationService get navigationService => _NavigationService();
}

extension NavigationServiceStateExtension on State {
  _NavigationService get navigationService => _NavigationService();
}

extension NavigationServiceBlocExtension on BaseBloc {
  _NavigationService get navigationService => _NavigationService();
}
