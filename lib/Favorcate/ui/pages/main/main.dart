import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/ui/pages/home/home_app_bar.dart';

import '../home/home_drawer.dart';
import 'initialize_items.dart';
class HYMainScreen extends StatefulWidget {
  static const String routeName = "/";

  const HYMainScreen({super.key});
  @override
  _HYMainScreenState createState() => _HYMainScreenState();
}

class _HYMainScreenState extends State<HYMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HYHomeAppBar(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer:HYHomeDrawer(),

    );
  }
}
