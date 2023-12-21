import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/01_下拉刷新_上拉加载/News.dart';

//配置路由
final routes = {
  '/': (context) => Tabs(),
  NewsPage.routeName: (context) => NewsPage(),
};
//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
