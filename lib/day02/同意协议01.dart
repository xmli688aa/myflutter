import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "第一个程序",
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: Colors.green,
        ),
        body: const HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      //想让文字居中在屏幕 使用Center组件
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: false,
            onChanged: (value) => print("hello world"),
          ),
          const Text(
            "同意协议",
            textDirection: TextDirection.ltr,
          )
        ],
      ),
    );
  }
}
