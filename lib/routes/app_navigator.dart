import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppRoute {
  AppRoute({
    required this.route,
    this.query,
  });

  String route;
  String? query;
}

class RouteChangeNotifier extends ChangeNotifier {
  void _notifyListeners() {
    notifyListeners();
  }
}

abstract class AppNavigator {
  static final _routeStack = <AppRoute>[];
  static bool isPoppingNativePages = false;

  static final routeChangeNotifier = RouteChangeNotifier();

  static final Map<String, int> _activeRoutesPerController = {};

  /// Get the current route name
  static String? currentRouteName() =>
      _routeStack.isNotEmpty ? _routeStack.last.route : null;

  /// Get the current route
  static AppRoute? currentRoute() =>
      _routeStack.isNotEmpty ? _routeStack.last : null;

  static List<AppRoute> get appRoutes => _routeStack;

  static Future<void> nativePopRoute(Route<dynamic> route) async {
    if (route.settings.name == null || isPoppingNativePages) {
      return;
    }

    if (_routeStack.isNotEmpty) {
      _routeStack.removeLast();
    }

    routeChangeNotifier._notifyListeners();
  }

  /// Function that is called when a native page in pushed
  ///
  /// This must be called ONLY by `AppNavigatorObserver`
  static void nativePushRoute(Route<dynamic> route) {
    if (route.settings.name == null) {
      return;
    }

    // F.printDev('Navigator: native PUSH ${route.settings.name}');

    _routeStack.add(AppRoute(route: route.settings.name!));

    routeChangeNotifier._notifyListeners();
  }

  /// Increase a controller usage in some page
  ///
  /// This must be called ONLY by `ControlledScreen`
  static void increaseControllerUsage(String key) {
    final count = _activeRoutesPerController[key];

    if (count == null) {
      _activeRoutesPerController[key] = 1;
    } else {
      _activeRoutesPerController[key] = count + 1;
    }
  }

  /// Decrease and remove a controller usage
  ///
  /// This must be called ONLY by `ControlledScreen`
  static int decreaseAndMaybeRemoveControllerUsage(String key) {
    final count = _activeRoutesPerController[key]!;

    if (count == 1) {
      _activeRoutesPerController.remove(key);
      return 0;
    } else {
      _activeRoutesPerController[key] = count - 1;
      return _activeRoutesPerController[key]!;
    }
  }

  static void closeAllNonNamedRoutes() {
    Get.until((route) => route.settings.name != null);
  }

  /// Opens the home page
  static Future<void> openCompassPage() async {
    return Get.toNamed<void>(AppRoutes.compassPage);
  }

  static Future<void> openHomePage() async {
    return Get.toNamed<void>(AppRoutes.home);
  }
}
