import 'package:flutter/material.dart';
import 'dart:math';

import 'package:my_app/14_screenfit/shared/size_fit.dart';

class MyTabBarPage extends StatefulWidget {
  const MyTabBarPage({super.key});

  @override
  State<MyTabBarPage> createState() => _MyTabBarPageState();
}

class _MyTabBarPageState extends State<MyTabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double tabbarViewH = HYSizeFit.screenHeight-HYSizeFit.statusHeight-HYSizeFit.bottomHeight-44*2;
    print('tabbarViewH:$tabbarViewH HYSizeFit.statusHeight:${HYSizeFit.statusHeight}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('tabbar_tabbarview使用'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 44,
              color: Colors.blue,
              child: Text('第一行的数据'),
            ),
            Container(
              height: 44,
              child: TabBar(
                controller: _tabController,
                tabs: tabs.map((e) => Text(e)).toList(),
              ),
            ),
            Container(
              //TODO 这里要提供一个高度
              height: tabbarViewH,
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((e){
                return Container(
                  width: double.infinity,
                  height: 300,
                  // 随机颜色
                  color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
                      Random().nextInt(256), 1),
                  child: Center(
                    child: Text(e),
                  ),
                );
              }).toList(),

              ),
            ),
          ],
        ),
      ),
    );
  }

}
