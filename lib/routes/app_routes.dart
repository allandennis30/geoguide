import 'package:flutter/material.dart';
import 'package:geoguide/ui/compass/compass_page.dart';
import 'package:geoguide/ui/home_page/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static const home = '/home';
  static const compassPage = '/compassPage';

  // When creating new routes always remember, if your screen opens a webview, you MUST add that page to
  // AppNavigator _onWebViewHistoryPop, otherwise, the you press back on the webview, it won't return to the native app
  static final routes = <GetPage<dynamic>>[
    _animatedPage(name: home, page: HomePage.new),
    _animatedPage(name: compassPage, page: CompassPage.new),
  ];

  static GetPage<T> _animatedPage<T>({
    required String name,
    required Widget Function() page,
  }) {
    return GetPage<T>(
      name: name,
      page: page,
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeft,
    );
  }
}
