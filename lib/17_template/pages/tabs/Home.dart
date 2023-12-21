
import 'package:flutter/material.dart';
import 'package:my_app/17_template/pages/01_%E4%B8%8B%E6%8B%89%E5%88%B7%E6%96%B0_%E4%B8%8A%E6%8B%89%E5%8A%A0%E8%BD%BD/News.dart';
import 'package:my_app/17_template/pages/02_%E8%A7%86%E9%A2%91%E6%92%AD%E6%94%BEvideoplayer/et_videoplayer_custom.dart';
import 'package:my_app/17_template/pages/03_%E5%9B%BE%E7%89%87%E8%BD%AE%E6%92%AD/swipe_page.dart';
import 'package:my_app/17_template/pages/04_%E6%9C%AC%E5%9C%B0%E5%AD%98%E5%82%A8/storage_page.dart';

class HomePage extends StatefulWidget {
  HomePage();
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(       
        mainAxisAlignment: MainAxisAlignment.start,
        children: [                   
                      ElevatedButton(
              child: Text('跳转到下拉刷新，上拉分页加载更多页面'),
              onPressed: (){
                  Navigator.pushNamed(context, NewsPage.routeName);
              },
            ),
          ElevatedButton(
            child: Text('跳转视频播放页面'),
            onPressed: (){
              Navigator.pushNamed(context, ETVideoPlayerView.routeName);
            },
          ),
          ElevatedButton(
            child: Text('轮播图card_swiper的使用'),
            onPressed: (){
              Navigator.pushNamed(context, ETSwiperPage.routeName);
            },
          ),
          ElevatedButton(
            child: Text('数据本地存储'),
            onPressed: (){
              Navigator.pushNamed(context, ETStoragePage.routeName);
            },
          ),
        ],
       
      ),
    );
  }
}
