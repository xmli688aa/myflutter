import 'package:flutter/material.dart';

import 'main/main_page.dart';

void main() {
  //1.Flutter启动需要执行runApp函数
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Dou Ban",
      theme: ThemeData(

      ),
      home:Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.cyan,
        // ),
        body: ETMainPage(),
      ),
    );
  }
}



