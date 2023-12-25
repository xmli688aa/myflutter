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
      appBar: AppBar(title: const Text("Hello World")),
      body: const ButtonDemo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
            style: ButtonStyle(
                //去掉内边距
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                //去掉外边距
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // elevation: MaterialStateProperty.all(0),
                shadowColor: const MaterialStatePropertyAll(Colors.blue),
                backgroundColor: MaterialStateProperty.all(Colors.yellow)),
            onPressed: () {},
            child: const Text(
              "我是ElevatedButton",
              style:
                  TextStyle(color: Colors.red, backgroundColor: Colors.green),
            )),
        ElevatedButton(
            style: ButtonStyle(
                // elevation: MaterialStateProperty.all(0),
                shadowColor: const MaterialStatePropertyAll(Colors.blue),
                backgroundColor: MaterialStateProperty.all(Colors.yellow)),
            onPressed: () {},
            child: const Text(
              "我是ElevatedButton",
              style:
                  TextStyle(color: Colors.red, backgroundColor: Colors.green),
            )),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.phone),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text("OutlinedButton"),
        ),
        OutlinedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.lightGreen),
            //设置圆角最大为高度的一半
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(42))),
            shadowColor: const MaterialStatePropertyAll(Colors.yellow),
            iconSize: const MaterialStatePropertyAll(84),
          ),
          onPressed: () {},
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text(
                "喜欢作者",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
