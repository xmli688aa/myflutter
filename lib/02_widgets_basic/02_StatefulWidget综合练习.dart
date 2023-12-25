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
      appBar: AppBar(title: const Text("商品列表")),
      body: const MYHomeContent(
        "我是传递过去的数据",
      ),
    );
  }
}

//widget是不加_的 暴露给外部使用的
class MYHomeContent extends StatefulWidget {
  //这里定义属性 外部传递过来 同时state就可以通过this.widget.属性的方式传递
  final String message;
  const MYHomeContent(this.message, {super.key});
  @override
  State<MYHomeContent> createState() => _MYHomeContentState();
}

//state前面是加_ 状态这个类只是给widget使用的
class _MYHomeContentState extends State<MYHomeContent> {
  String title = "why";
  int counter = 0;
  // this.Widget.message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _getBtns(),
        Text(
          "当前计数：$counter",
          style: const TextStyle(fontSize: 20),
        ),
        //接收外部传递过来的信息 使用this.widget.属性的方式获取
        Text(
          "接收信息：${widget.message}",
          style: const TextStyle(fontSize: 20),
        ),
      ]),
    );
  }

//如果这里感觉代码比较多 可以抽取代码
  Widget _getBtns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: clickAddBtn,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.add),
                Text(
                  "1",
                  style: TextStyle(fontSize: 18),
                )
              ],
            )),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
            ),
            onPressed: clickReduceBtn,
            child: const Text("-1",
                style: TextStyle(fontSize: 18, color: Colors.white))),
      ],
    );
  }

  clickAddBtn() {
    setState(() {
      counter++;
    });
  }

  clickReduceBtn() {
    setState(() {
      counter--;
      if (counter <= 0) {
        counter = 0;
      }
    });
  }
}
