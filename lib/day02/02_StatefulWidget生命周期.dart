import 'package:flutter/material.dart';

void main() {
  //1.Flutter启动需要执行runApp函数
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MYHomePageDemo(),
    );
  }
}

class MYHomePageDemo extends StatelessWidget {
  const MYHomePageDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const MYHOmePage();
  }
}

class MYHOmePage extends StatefulWidget {
  const MYHOmePage({super.key});
  @override
  State<MYHOmePage> createState() => _MYHOmePageState();
}

class _MYHOmePageState extends State<MYHOmePage> {
  final List<Widget> widgets = [MYHomeContent()];
  @override
  Widget build(BuildContext context) {
    print("_MYHOmePageStated的build方法");
    return Scaffold(
      appBar: AppBar(title: const Text("生命周期")),
      body: Column(children: widgets),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            widgets.insert(0, Text("新增一行Text"));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//widget是不加_的 暴露给外部使用的
class MYHomeContent extends StatefulWidget {
  //这里定义属性 外部传递过来 同时state就可以通过this.widget.属性的方式传递
  MYHomeContent() {
    print("1.调用MYHomeContent的constructor");
  }

  @override
  State<MYHomeContent> createState() {
    print("2.调用MYHomeContent的createState");
    return _MYHomeContentState();
  }
}

//state前面是加_ 状态这个类只是给widget使用的
class _MYHomeContentState extends State<MYHomeContent> {
  int _counter = 0;
  _MYHomeContentState() {
    print("3.调用_MYHomeContentState的constructor");
  }

  @override
  void initState() {
    //这里必须调用super的initState方法
    print("4.调用_MYHomeContentState的initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("调用_MYHomeContentState的didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MYHomeContent oldWidget) {
    print("调用_MYHomeContentState的didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  // this.Widget.message;
  @override
  Widget build(BuildContext context) {
    print("5.调用_MYHomeContentState的build");
    return Column(
      children: [
        Text(
          "计数：${_counter}",
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  void dispose() {
    print("6.调用_MYHomeContentState的dispose");
    super.dispose();
  }
}
