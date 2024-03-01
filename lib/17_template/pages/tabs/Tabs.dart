import 'package:flutter/material.dart';
import 'Home.dart';
import 'Category.dart';
import 'Setting.dart';

class Tabs extends StatefulWidget {
  final index;

  const Tabs({super.key, this.index = 0});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;


  final List _pageList = [
    const HomePage(),
    const CategoryPage(),
    const SettingPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //配置对应的索引值选中
        onTap: (int index) {
          setState(() {
            //改变状态
            _currentIndex = index;
          });
        },
        iconSize: 36.0,
        //icon的大小
        fixedColor: Colors.blueAccent,
        //选中的颜色
        type: BottomNavigationBarType.fixed,
        //配置底部tabs可以有多个按钮
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
        ],
      ),
    );
  }
}
