
import 'package:my_app/03_dart%E4%B8%AD%E7%9A%84%E5%BC%82%E6%AD%A5%E6%93%8D%E4%BD%9C/service/http_request.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
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
      appBar: AppBar(title: Text("网络请求")),
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
    //发送网络请求
    // //1创建dio
    // final dio = Dio();
    // dio.get("https://httpbin.org/get").then((res){
    //   print(res);
    // });
    // dio.post("https://httpbin.org/post").then((res){
    //   print(res);
    // });
    HttpRequest.request(url: "https://httpbin.org/get", params: {"name":"张三","age":11},
      // headers: {"nameeee":"lilili"},
      //   inter: InterceptorsWrapper(
      // onResponse: (options,handler){
      //   print("单独拦截响应：${options}");
      //   return handler.next(options);
      // })
    ).then((value){
      // print(value);
    });
    HttpRequest.postRequest(url: "https://httpbin.org/post", params: {"name":"zez"}).then((value){

    });

  }
  @override
  Widget build(BuildContext context) {
    return Text("hello world");
  }
}
