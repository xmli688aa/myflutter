import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "第一个程序",
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: Colors.green,
        ),
        body: const HomeContent(),
      ),
    );
  }
}

//StatefulWidget不能定义状态---》需要创建一个单独的类 HomeContentState 这个类来维护状态
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeContentState();
  }
}

class HomeContentState extends State<HomeContent> {
  var flag = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
              value: flag,
              onChanged: (value) {
                flag = !flag;
                setState(() {});
                print(value);
              }),
          const Text("同意协议信息"),
        ],
      ),
    );
  }
}
