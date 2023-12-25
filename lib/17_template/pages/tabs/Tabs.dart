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
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
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
        fixedColor: Colors.red,
        //选中的颜色
        type: BottomNavigationBarType.fixed,
        //配置底部tabs可以有多个按钮
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: UserAccountsDrawerHeader(
                  accountName: const Text("大地老师"),
                  accountEmail: const Text("dadi@itying.com"),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.itying.com/images/flutter/3.png"),
                  ),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://www.itying.com/images/flutter/2.png"),
                    fit: BoxFit.cover,
                  )),
                  otherAccountsPictures: <Widget>[
                    Image.network(
                        "https://www.itying.com/images/flutter/4.png"),
                    Image.network(
                        "https://www.itying.com/images/flutter/5.png"),
                  ],
                ))
              ],
            ),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("我的空间"),
            ),
            const Divider(),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.people)),
              title: const Text("用户中心"),
              onTap: () {
                Navigator.of(context).pop(); //隐藏侧边栏
                Navigator.pushNamed(context, '/user');
              },
            ),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("设置中心"),
            ),
            const Divider(),
          ],
        ),
      ),
      endDrawer: const Drawer(
        child: Text('右侧侧边栏'),
      ),
    );
  }
}
