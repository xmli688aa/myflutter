import 'package:flutter/material.dart';
import 'package:my_app/douban/home/home.dart';
import 'bottom_bar_item.dart';
import 'initialize_items.dart';

class ETMainPage extends StatefulWidget {
  const ETMainPage({Key? key}) : super(key: key);

  @override
  State<ETMainPage> createState() => _ETMainPageState();
}

class _ETMainPageState extends State<ETMainPage> {
  Color themeColor = Colors.green;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 13,
        selectedItemColor: themeColor,
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,//item超过5个的时候 需要设置这个属性才会文字和icon同时显示
        items: bottomNavigationbarItems,
      ),
    );
  }

}
