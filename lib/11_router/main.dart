import 'package:flutter/material.dart';
import 'package:my_app/11_router/router/routes.dart';
import 'about.dart';
import 'detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: const HYHomePage(),
        routes: ETRouter.routes,
        onGenerateRoute: ETRouter.generateRoute,
        onUnknownRoute: ETRouter.unknownRoute
      // initialRoute: ETRouter.initialRoute,//这个可以替换home

    );

  }
}

class HYHomePage extends StatefulWidget {
  static const String routerName = "/home";

  const HYHomePage({Key? key}) : super(key: key);

  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  String _message = "默认展示的信息";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${_message}"),
            ElevatedButton(
              onPressed: () {
                //1 普通的跳转方式
                _jumpToDetailPage(context);
              },
              child: Text("进入详情页 普通跳转方式"),
            ),
            ElevatedButton(
                onPressed: () {
                  _jumpToAboutPage(context);
                },
                child: Text("跳转到关于页面")),
            ElevatedButton(
              onPressed: () {
             _jumpToDetailPage2(context);
              },
              child: Text("进入详情页 第2种方式"),
            ),
            ElevatedButton(
              onPressed: () {
                _jumpToSettingsPage(context);
              },
              child: Text("进入设置页面"),
            ),
          ],
        ),
      ),
    );
  }
//跳转详情页面 普通的跳转方式
  _jumpToDetailPage(BuildContext context) {
    //传递参数：通过构造器直接传递即可
    Future result =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ETDetailPage("这是首页传递过来的数据");
    }));
    result.then((value) {
      print("详情页传递过来的数据：${value}");
      //这里要做一个判断 判断value是否是字符串 防止详情页没有传递数据 直接赋值会导致报错
      if (value is String) {
        _message = value;
        setState(() {});
      }
    });
  }
  //跳转关于页面 命名路由方式
  _jumpToAboutPage(BuildContext context){
    Navigator.of(context)
        .pushNamed(ETAboutPage.routeName, arguments: "首页传递过来的数据");
  }
  //跳转详情页面  ETDetailPage构建需要传参的问题 通过onGenerateRoute来解决
  _jumpToDetailPage2(BuildContext context) {
    Navigator.of(context).pushNamed(ETDetailPage.routeName,
        arguments: "命名路由的方式跳转传参");
  }
  _jumpToSettingsPage(BuildContext context){
    Navigator.of(context)
        .pushNamed("/setting", arguments: "a home detail2 message");
  }

}
