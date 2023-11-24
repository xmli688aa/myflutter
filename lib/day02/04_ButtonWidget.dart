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
      body: ButtonDemo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
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
                // elevation: MaterialStateProperty.all(0),
                shadowColor: MaterialStatePropertyAll(Colors.blue),
                backgroundColor: MaterialStateProperty.all(Colors.yellow)),
            onPressed: () {},
            child: const Text(
              "我是ElevatedButton",
              style:
                  TextStyle(color: Colors.red, backgroundColor: Colors.green),
            )),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.phone),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text("OutlinedButton"),
        ),
        OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.lightGreen),
            //设置圆角最大为高度的一半
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(42))),
            shadowColor: MaterialStatePropertyAll(Colors.yellow),
            iconSize: MaterialStatePropertyAll(84),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
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
