import 'package:flutter/material.dart';
import 'package:my_app/11_router/unknown.dart';
import 'package:my_app/Favorcate/ui/pages/detail/detail.dart';
import 'package:my_app/Favorcate/ui/pages/favor/favor.dart';

import 'package:my_app/Favorcate/ui/pages/main/main.dart';

import '../../ui/pages/meal/meal.dart';

class HYRouter {
  static const String initialRoute = HYMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routeName: (ctx) => const HYMainScreen(),
    HYFavorScreen.routeName: (ctx) => const HYFavorScreen(),
    HYDetailScreen.routeName: (ctx) =>  const HYDetailScreen(),
    HYMealScreen.routeName: (ctx)=> const HYMealScreen(),
  };

  // 自己扩展（一般是页面传参问题，比如创建页面需要带参数）
  static final RouteFactory generateRoute = (settings) {
    return null;
  };
  // static final RouteFactory generateRoute = (settings) {
  //   if (settings.name == ETDetailPage.routeName) {
  //     return MaterialPageRoute(builder: (ctx) {
  //       return ETDetailPage(settings.arguments as String);
  //     });
  //   }
  //   return null;
  // };
  //未知页面的路由
  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx){
      return HYUnknownPage();
    });
  };
}