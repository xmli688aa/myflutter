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
        appBar: AppBar(title: const Text("列表测试")),
        body: ListViewDemo3());
  }

  ListView ListViewDemo3() {
    return ListView.separated(
      itemCount: 40,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.centerLeft,
          height: 44,
          child: Text(
            "hello world: $index",
            style: const TextStyle(backgroundColor: Colors.blue),
          ),//因为外层包裹的是Container 所以这里设置item的高度
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          // padding: EdgeInsets.all(16),
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
            leading: const Icon(Icons.people),
            title: Text("联系人 ${index + 1}"),
            subtitle: const Text("电话：18912345678"),
            trailing: const Icon(Icons.edit),
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
