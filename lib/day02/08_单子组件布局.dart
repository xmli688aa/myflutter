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
    return Scaffold(
      appBar: AppBar(title: Text("Hello World")),
      body: const HomePageContent(),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          width: 5,
          color: Colors.blue,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black, offset: Offset(10, 10), blurRadius: 10),
          BoxShadow(
              color: Colors.yellow, offset: Offset(-10, 10), blurRadius: 10)
        ],
      ),
      width: 200,
      height: 200,
      // color: Colors.amber,
      child: Align(
          alignment: Alignment(-1, -1),
          child: Icon(
            Icons.pets,
            color: Colors.red,
            size: 60,
          )),
    );
  }
}
