import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/17_template/pages/tabs/Tabs.dart';
import 'Routes.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    Color schemeColor = Colors.lightBlue;

    return GetMaterialApp(
      debugShowCheckedModeBanner:false ,  //去掉debug图标
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: schemeColor),
        appBarTheme:  AppBarTheme(
          backgroundColor: schemeColor,
        ),
        useMaterial3: true,
      ),
      // home:Tabs(),
      initialRoute: '/',     //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
      getPages: getPages,
    );
  }
}
