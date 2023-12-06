// routes.dart
import 'package:flutter/material.dart';
import 'package:my_app/day11_router/detail.dart';
import 'package:my_app/day11_router/unknown.dart';
import '../about.dart';
import '../main.dart';

class ETRouter {
  static final Map<String, WidgetBuilder> routes = {
    HYHomePage.routerName:(ctx) => const HYHomePage() ,
    ETAboutPage.routeName: (ctx) => ETAboutPage()
  };
  static const String initialRoute = HYHomePage.routerName;

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == ETDetailPage.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        return ETDetailPage(settings.arguments as String);
      });
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return HYUnknownPage();
    });
  };
}
