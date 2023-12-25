import 'package:flutter/material.dart';
import 'pages/tabs/Routes.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner:false ,  //去掉debug图标
      // home:Tabs(),   
      initialRoute: '/',     //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}
