
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
    return const HomePageContent();
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final ScrollController _controller = ScrollController(initialScrollOffset: 300);
  bool _showFloatingButton = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      // print("监听到滚动了${_controller.offset}");
      if(_controller.offset>=1000){
        setState(() {
          _showFloatingButton = true;
        });
      }else{
        setState(() {
          _showFloatingButton = false;
        });
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification){
          if(notification is ScrollStartNotification){
            print("开始滚动");
          }else if(notification is ScrollUpdateNotification){
            print("正在滚动。。。最大滚动距离${notification.metrics.maxScrollExtent} 当前滚动的距离${notification.metrics.pixels}");
          }else if(notification is ScrollEndNotification){
            print("结束滚动");
          }
          return true;
        },
        child: ListView.builder(
            controller: _controller,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              // if(index == 0){
              //   return Icon(Icons.factory);
              // }
              return ListTile(
                leading: const Icon(Icons.people),
                title: Text("联系人:$index"),
              );
            }),
      ),
      floatingActionButton:_showFloatingButton? FloatingActionButton(
        child: const Icon(Icons.arrow_upward),
        onPressed: (){
          // controller.jumpTo(0);
          _controller.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeIn);
        },

      ):null,
    );
  }
}
