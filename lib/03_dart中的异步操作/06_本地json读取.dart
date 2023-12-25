import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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
      appBar: AppBar(title: const Text("获取本地json文件数据")),
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
      for (Anchor anchor in value) {
        print(anchor.nickname);
      }
      // print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Text("hello world");
  }
}

Future<List<Anchor>> getAnchors() async {
  //1.获取json文件
  String jsonString = await rootBundle.loadString("assets/files/yz.json");
  // 2.将jsonString转成List或者Map类型
  final jsonResult = jsonDecode(jsonString);
  // 3.遍历List 转成Anchor对象 放到另一个List中
  List<Anchor> listAnchors = [];
  for (Map<String, dynamic> element in jsonResult) {
    listAnchors.add(Anchor.withMap(element));
  }
  return listAnchors;
}

//自定义的类
class Anchor {
  String nickname = "";
  String roomName = "";
  String imageUrl = "";
  Anchor(
      {required this.nickname, required this.roomName, required this.imageUrl});
  Anchor.withMap(Map<String, dynamic> parsedMap) {
    nickname = parsedMap["nickname"];
    roomName = parsedMap["roomName"];
    imageUrl = parsedMap["imageUrl"];
  }
}
