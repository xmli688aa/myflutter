import 'package:flutter/material.dart';
import 'package:my_app/Favocate/ui/pages/favor/favor.dart';

import 'package:my_app/Favocate/ui/pages/main/main.dart';

class HYRouter {
  static final String initialRoute = HYMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routeName: (ctx) => HYMainScreen(),
    HYFavorScreen.routeName: (ctx) => HYFavorScreen(),

  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}