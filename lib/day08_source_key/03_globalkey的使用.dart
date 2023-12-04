import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.blue),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  //定义GlobalKey 类型为_HYHomeContentState
  GlobalKey<_HYHomeContentState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      //HYHomeContent对象创建的时候 将GlobalKey传过去 这样就能在父视图拿到对应的state
      body: HYHomeContent(key: homeKey,),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //获取HYHomeContent的name  _HYHomeContentState下的message
          print("message:${homeKey.currentState?.message}");
          print("name:${homeKey.currentState?.widget.name}");

        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  final String name = "张飞";
  HYHomeContent({Key? key}): super(key: key);

  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final String message = "我是测试信息";
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("哈哈哈", style: TextStyle(color: Colors.white, fontSize: 30),),
      height: 80,
      width: double.infinity,
      color: randColor,
    );
  }
}

