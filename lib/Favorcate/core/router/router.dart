import 'package:flutter/material.dart';
import 'package:my_app/11_router/unknown.dart';
import 'package:my_app/Favorcate/ui/pages/detail/detail.dart';
import 'package:my_app/Favorcate/ui/pages/favor/favor.dart';
import 'package:my_app/Favorcate/ui/pages/filter/filter.dart';

import 'package:my_app/Favorcate/ui/pages/main/main.dart';

import '../../ui/pages/meal/meal.dart';

class HYRouter {
  static const String initialRoute = HYMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routeName: (ctx) => const HYMainScreen(),
    HYFavorScreen.routeName: (ctx) => const HYFavorScreen(),
    HYDetailScreen.routeName: (ctx) => const HYDetailScreen(),
    HYMealScreen.routeName: (ctx) => const HYMealScreen(),
  };

  // 自己扩展（一般是页面传参问题，比如创建页面需要带参数,或者页面弹出样式需要自定义的）
  //ignore
  static  RouteFactory generateRoute = (RouteSettings settings) {
    if (settings.name == HYFilterScreen.routeName) {
      return MaterialPageRoute(
        builder: (ctx) {
          return const HYFilterScreen();
        },
        fullscreenDialog: true,
      );
    }
    return null;
  };

  //未知页面的路由
  static  RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return const HYUnknownPage();
    });
  };
}
