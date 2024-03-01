import 'package:flutter/material.dart';
import 'eventbus_page2.dart';
import 'global_manager.dart';

class EventBusPage extends StatefulWidget {
  static String routeName = "/EventBusPage";

  const EventBusPage({super.key});

  @override
  State<EventBusPage> createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  String _title = "默认的title";
  String _message = "默认的message";
  String _content = "第一个页面的数据";
  // 定义观察者
  var discrip1;
  var discrip2;
  var discrip3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听对象传递
    discrip1 = EventBusManager.instance.on<PersonInfo>().listen((PersonInfo user) {
      print("discrip1监听了");
      setState(() {
        _title = "${user.nickname}：等级是${user.level}";
      });
    });
    // 监听字符串传递
    discrip2 = EventBusManager.instance.on<String>().listen((str) {
      print("discrip2监听了");

      setState(() {
        _message = str;
      });
    });
    // 监听下个页面传递过来的数据
    discrip3 = EventBusManager.instance.on<PersonInfo>().listen((PersonInfo user) {
      print("discrip3监听了");
      setState(() {
        _content = "${user.nickname}：等级是${user.level}";
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("evnetbus"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 44,),
            Text(_title),
            ElevatedButton(onPressed: (){
              //传递模型
              PersonInfo info = PersonInfo("张大仙", 19);
              EventBusManager.instance.fire(info);

            }, child: const Text("通过模型修改title")),
            const SizedBox(height: 44,),
            Text(_message),
            ElevatedButton(onPressed: (){
              // 传递字符串
              EventBusManager.instance.fire("修改后message");
            }, child: const Text("通过字符串修改message")),
            const SizedBox(height: 44,),
            Text(_content),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const EventBusPage2();
              }));
            }, child: const Text("跳转下个页面")),
          ],
        ),
      ),
    );

  }
  @override
  void dispose() {
    // print("dispose");
    discrip1.cancel();
    discrip2.cancel();
    discrip3.cancel();
    super.dispose();

  }
}
class PersonInfo {
  String nickname;
  int level;
  PersonInfo(this.nickname, this.level);
}
