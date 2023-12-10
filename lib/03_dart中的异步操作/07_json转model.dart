import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:my_app/03_dart中的异步操作/et_persion.dart';
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
      appBar: AppBar(title: Text("获取本地json文件数据")),
      body: const HomePageContent(),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAnchors().then((value) {
      print("获取到了本地json数据");
      for (ETPersion anchor in value) {
        print(anchor.nickname);
      }
      // print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("hello world");
  }
}

Future<List<ETPersion>> getAnchors() async {
  //1.获取json文件
  String jsonString = await rootBundle.loadString("assets/files/yz.json");
  // 2.将jsonString转成List或者Map类型
  final jsonResult = jsonDecode(jsonString);
  // 3.遍历List 转成Anchor对象 放到另一个List中
  List<ETPersion> listAnchors = [];
  for (Map<String, dynamic> element in jsonResult) {
    // listAnchors.add(Anchor.withMap(element));
    //这里直接使用fromJson方法就可以转成模型
    listAnchors.add(ETPersion.formJson(element));
  }
  return listAnchors;
}

