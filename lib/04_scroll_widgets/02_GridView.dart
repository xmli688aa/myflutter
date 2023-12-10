import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  //1.Flutter启动需要执行runApp函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Flutter Demo',
      home: MYHomePage(),
    );
  }
}

class MYHomePage extends StatelessWidget {
  const MYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("列表测试"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: GridViewDemo3(),
        ));
  }

  GridView GridViewDemo3() {
    return GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,//item的宽度
            mainAxisExtent:80//itme的高度
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // height: 200,//这里设置高度不会生效
            alignment: Alignment.center,
            // margin: EdgeInsets.all(5),
            color: Color.fromARGB(255, Random().nextInt(255),
                Random().nextInt(255), Random().nextInt(255)),
            child: const Text("hello world"),
          );
        });
  }

  GridView GridViewDemo2() {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
      ),
      children: List.generate(20, (index) {
        return Container(
          // padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          // margin: EdgeInsets.all(5),
          color: Color.fromARGB(255, Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255)),
          child: const Text("hello world"),
        );
      }),
    );
  }

  GridView GridViewDemo1() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8, //宽度和高度的比例
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
      children: List.generate(20, (index) {
        return Container(
          // padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          // margin: EdgeInsets.all(5),
          color: Color.fromARGB(255, Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255)),
          child: const Text("hello world"),
        );
      }),
    );
  }
}
