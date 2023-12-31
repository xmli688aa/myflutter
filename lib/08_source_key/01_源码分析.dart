
import 'package:flutter/material.dart';
import 'package:my_app/03_dart%E4%B8%AD%E7%9A%84%E5%BC%82%E6%AD%A5%E6%93%8D%E4%BD%9C/service/http_request.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // BuildContext context -> Element
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: const HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1.自己写Widget
    // 2.某些Widget中会创建RenderObject
    // 3.每一个Widget都会创建一个Element对象
    // 4.1.ComponentElement: mount方法 -> firstBuild -> rebuild -> performBuild -> build -> _widget.build
    // 4.2.RenderObjectElement: mount方法 -> _widget.createRenderObject
    // 4.3.StatefulElement:
    // * 构造方法中 _state = widget.createState()
    // * _state._widget = widget;

    // 所有的Widget都会创建一个对应的Element对象
//    StatelessElement;
//    StatefulElement;

    // 组件Widget: 不会生成RenderObject
    // Container -> StatelessWidget -> Widget
//    Container();
//    Text();
//    HYHomeContent();

    // 创建Element: RenderObjectElement
    // 渲染Widget: 生成RenderObject
    // Padding -> SingleChildRenderObjectWidget -> RenderObjectWidget(createRenderObject) -> Widget
    // Padding -> createRenderObject -> RenderPadding -> RenderBox -> RenderObject
//    Padding();
//    RenderObjectWidget

    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: const HYHomeContent(),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  const HYHomeContent({super.key});

  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  void initState() {
    super.initState();

    // 发送网络请求
    // 1.创建Dio对象
//    final dio = Dio();

    // 2.发送网络请求
//    dio.get("https://httpbin.org/get").then((res) {
//      print(res);
//    });
//
//    dio.post("https://httpbin.org/post").then((res) {
//      print(res);
//    });

    HttpRequest.request(
        params: {"name": "why"}, url: '/get')
        .then((res) {
      print(res);
    }).catchError((err) {});
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

int calc(int count) {
  int total = 0;
  print(count);
  for (int i = 0; i < count; i++) {
    total += i;
  }
  return total;
}
