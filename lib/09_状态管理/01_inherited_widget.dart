import 'package:flutter/material.dart';
import 'package:my_app/douban/utils/log.dart';
import 'counter_inherited_widget.dart';

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
  final ETPerson _person = ETPerson(age: 130,name: "Ethon");
  int _counter = 130;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget"),
      ),
      body: Center(

        child: ETCounterWidget(
          person: _person,
          counter: _counter,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ETData1(),
              ETData2(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          _counter++;
          _person.name = "Lindada";
          _person.age = 30;
          setState(() {

          });
        },
      ),
    );
  }
}

class ETData1 extends StatefulWidget {

  const ETData1({Key? key}) : super(key: key);

  @override
  State<ETData1> createState() => _ETData1State();
}

class _ETData1State extends State<ETData1> {
  @override
  Widget build(BuildContext context) {
    int? count = ETCounterWidget.of(context)?.counter;
    ETPerson? person = ETCounterWidget.of(context)?.person;
    return Column(
      children: [
        Container(
          color: Colors.cyan,
          child: Text("当前计数$count",style: const TextStyle(fontSize: 20),),
        ),
        Container(
          color: Colors.cyan,
          child: Text("姓名${person?.name} 年龄${person?.age}",style: const TextStyle(fontSize: 20),),
        ),
      ],
    );
  }
}

class ETData2 extends StatefulWidget {
  const ETData2({Key? key}) : super(key: key);

  @override
  State<ETData2> createState() => _ETData2State();
}

class _ETData2State extends State<ETData2> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    nsLog("执行了didChangeDependencies", StackTrace.current);
  }
  @override
  Widget build(BuildContext context) {
    int? counter = ETCounterWidget.of(context)?.counter;
    return Container(
      color: Colors.redAccent,
      child: Text("当前计数$counter", style: const TextStyle(fontSize: 30),),
    );
  }
}



