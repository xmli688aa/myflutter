
import 'package:flutter/material.dart';
import 'package:my_app/17_template/pages/02_%E8%A7%86%E9%A2%91%E6%92%AD%E6%94%BEvideoplayer/et_videoplayer_custom.dart';
import '../03_图片轮播/swipe_page.dart';
import '../04_本地存储/storage_page.dart';
import 'Tabs.dart';
import '../01_下拉刷新_上拉加载/News.dart';

//配置路由
final routes = {
  '/': (context) => const Tabs(),
  NewsPage.routeName: (context) => const NewsPage(),
  ETVideoPlayerView.routeName: (context)=> ETVideoPlayerView(videoUrl: "https://highlight-video.cdn.bcebos.com/video/6s/cc18b784-9e87-11ee-a6b1-b4055dd1839b.mp4"),
  ETSwiperPage.routeName: (context)=> const ETSwiperPage(),
  ETStoragePage.routeName: (context)=> const ETStoragePage(),
};
//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
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
};
