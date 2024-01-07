import 'package:flutter/material.dart';

import 'home_drawer.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});


  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('组件使用案例'),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                title: Text("我是一个文本"),
              ),
              ListTile(
                title: Text("我是一个文本"),
              ),
              ListTile(
                title: Text("我是一个文本"),
              ),
              ListTile(
                title: Text("我是一个文本"),
              )
            ],
          )
        ],
      ),
      drawer: HomeDrawer(),

    );
  }
}