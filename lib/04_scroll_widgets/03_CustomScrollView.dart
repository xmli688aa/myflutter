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
      // appBar: AppBar(
      //   title: const Text("列表测试"),
      //   backgroundColor: Colors.blue,
      // ),
      body: CustomScrollViewDemo2(),
    );
  }

  CustomScrollView CustomScrollViewDemo2() {
    return CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: Colors.grey,
        expandedHeight: 300,
        pinned: true, //滚动是否可以超过AppBar
        toolbarHeight: 88, //这个是滚动到最上面的时候 占据导航栏的高度
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0), //这个值不设置会导致下面的text文本不居中 奇怪
          // centerTitle:true ,
          title: Container(
            alignment: Alignment.center,
            color: Colors.orangeAccent,
            width: double.infinity,
            height: 88,
            child: Text(
              "hello flutter",
              style: TextStyle(color: Colors.green),
            ),
          ),
          background: Image.asset(
            "assets/images/headerIcon.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverGrid(
          delegate: SliverChildBuilderDelegate(childCount: 6,
              (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Color.fromARGB(255, Random().nextInt(255),
                  Random().nextInt(255), Random().nextInt(255)),
              child: const Text("hello world"),
            );
          }),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2)),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人"),
          );
        }),
      ),
    ]);
  }

  CustomScrollView CustomScrollViewDemo1() {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          //滚动的安全区域
          sliver: SliverPadding(
            //设置与顶部的间距 并且可以滚动
            padding: EdgeInsets.symmetric(vertical: 10),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 47,
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Color.fromARGB(255, Random().nextInt(255),
                        Random().nextInt(255), Random().nextInt(255)),
                    child: const Text("hello world"),
                  );
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.5)),
          ),
        ),
      ],
    );
  }
}
