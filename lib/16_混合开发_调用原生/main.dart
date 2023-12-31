
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ETMyapp());
}

class ETMyapp extends StatelessWidget {
  const ETMyapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '原生开发',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: const HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  const HYHomePage({Key? key}) : super(key: key);

  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  //名字需要唯一 一般是域名/功能
  static const platform = MethodChannel("codewhy.com/battery");
  int _level = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("获取电量信息"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                print("获取电量信息");
                getBatteryInfo();
              }, child: const Text("获取剩余电量")),
              Text("当前电量$_level")
            ],
          ),
        ));
  }
  void getBatteryInfo()async{
    final result = await platform.invokeMethod("getBatteryInfo");
    setState(() {
      _level = result;
    });
  }


}
