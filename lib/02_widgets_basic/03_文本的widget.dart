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
      appBar: AppBar(title: const Text("基础的widget")),
      body: const TextRichDemo(),
    );
  }
}

//富文本的实现 对比原生来讲简单很多
class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
        // TextSpan(text: "hello world", style: TextStyle(color: Colors.red))
        TextSpan(children: [
      TextSpan(text: "hello world", style: TextStyle(color: Colors.red)),
      TextSpan(text: "hello flutter", style: TextStyle(color: Colors.black)),
      WidgetSpan(
          child: Icon(
        Icons.favorite,
        color: Colors.red,
      )),
      TextSpan(text: "hello swift", style: TextStyle(color: Colors.green))
    ]));
  }
}

//text Widget
class TextDemo extends StatelessWidget {
  const TextDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      maxLines: 2,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}
