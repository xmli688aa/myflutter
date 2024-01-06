
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/17_template/pages/02_%E8%A7%86%E9%A2%91%E6%92%AD%E6%94%BEvideoplayer/et_videoplayer_custom.dart';
import 'package:my_app/17_template/pages/05_dialog/dialog.dart';
import 'package:my_app/17_template/pages/07_eventbus%E4%BD%BF%E7%94%A8/eventbus_page.dart';
import 'package:my_app/17_template/pages/08_GetX%E7%9A%84%E4%BD%BF%E7%94%A8/GetXController/getx_controller_example/getx_controller_example_view.dart';
import 'package:my_app/17_template/pages/08_GetX%E7%9A%84%E4%BD%BF%E7%94%A8/Obx%E5%93%8D%E5%BA%94%E5%BC%8F%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/getx_obx_page.dart';
import 'package:my_app/17_template/pages/08_GetX%E7%9A%84%E4%BD%BF%E7%94%A8/getx_page_demo.dart';
import 'pages/03_图片轮播/swipe_page.dart';
import 'pages/04_本地存储/storage_page.dart';
import 'pages/tabs/Tabs.dart';
import 'pages/01_下拉刷新_上拉加载/News.dart';

//配置路由 已废弃 改成下面的GetX的形式配置命名路由页面
final routes = {
  // '/': (context) => const Tabs(),
  // NewsPage.routeName: (context) => const NewsPage(),
  // ETVideoPlayerView.routeName: (context)=> ETVideoPlayerView(videoUrl: "https://highlight-video.cdn.bcebos.com/video/6s/cc18b784-9e87-11ee-a6b1-b4055dd1839b.mp4"),
  // ETSwiperPage.routeName: (context)=> const ETSwiperPage(),
  // ETStoragePage.routeName: (context)=> const ETStoragePage(),
  // ETDialogPage.routeName: (context)=> const ETDialogPage(),
  // EventBusPage.routeName: (context)=> const EventBusPage(),
};
final List<GetPage> getPages = [
  GetPage(name: '/', page: ()=>const Tabs()),
  GetPage(name: NewsPage.routeName, page: ()=>const NewsPage()),
  GetPage(name: ETVideoPlayerView.routeName, page: ()=>ETVideoPlayerView(videoUrl: "https://highlight-video.cdn.bcebos.com/video/6s/cc18b784-9e87-11ee-a6b1-b4055dd1839b.mp4")),
  GetPage(name: ETSwiperPage.routeName, page: ()=>const ETSwiperPage()),
  GetPage(name: ETStoragePage.routeName, page: ()=>const ETStoragePage()),
  GetPage(name: ETDialogPage.routeName, page: ()=>const ETDialogPage()),
  GetPage(name: EventBusPage.routeName, page: ()=>const EventBusPage()),
  GetPage(name: ETGetXPageDemo.routeName, page: ()=>const ETGetXPageDemo()),
  GetPage(name: GetXObxPage.routeName, page: ()=>GetXObxPage()),
  GetPage(name: GetxControllerExamplePage.routeName, page: ()=>GetxControllerExamplePage()),

];
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
