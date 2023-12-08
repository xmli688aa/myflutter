import 'package:my_app/day03-dart%E4%B8%AD%E7%9A%84%E5%BC%82%E6%AD%A5%E6%93%8D%E4%BD%9C/service/http_request.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
        appBar: AppBar(title: const Text("列表测试")),
        body: ListViewDemo3());
  }

  ListView ListViewDemo3() {
    return ListView.separated(
      itemCount: 40,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "hello world: $index",
            style: TextStyle(backgroundColor: Colors.blue),
          ),
          height: 44,//因为外层包裹的是Container 所以这里设置item的高度
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          // padding: EdgeInsets.all(16),
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          color: Colors.grey,
          height: 5,
        );
      },
    );
  }

  ListView ListViewDemo2() {
    return ListView.builder(
        itemExtent: 44,
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人 ${index + 1}"),
            subtitle: Text("电话：18912345678"),
            trailing: Icon(Icons.edit),
          );
        });
  }

  ListView ListViewDemo1() {
    return ListView(
      children: List.generate(100, (index) {
        return Text("hello world $index");
      }),
    );
  }
}
