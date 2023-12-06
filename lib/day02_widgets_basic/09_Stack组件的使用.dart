import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  //1.Flutter启动需要执行runApp函数
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MYHomePage(),
    );
  }
}

class MYHomePage extends StatelessWidget {
  const MYHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World")),
      body: const HomePageContent(),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  var _favor = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      //超出父控件 允许显示
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Colors.red,
          width: 300,
          height: 200,
        ),
        Image.asset("assets/images/headerIcon.jpg"),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            color: Color.fromARGB(212, 19, 19, 19),
            width: double.infinity,
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "这个人头像挺不错的",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    print("点击了不错");
                    _favor = !_favor;
                    setState(() {});
                  },
                  onLongPress: () {
                    print("长按了不错图标");
                  },
                  child: Icon(
                    Icons.favorite,
                    color: _favor == false ? Colors.white : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
