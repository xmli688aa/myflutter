
import 'package:flutter/material.dart';
import 'package:my_app/17_template/pages/01_%E4%B8%8B%E6%8B%89%E5%88%B7%E6%96%B0_%E4%B8%8A%E6%8B%89%E5%8A%A0%E8%BD%BD/News.dart';
import 'package:my_app/17_template/pages/02_%E8%A7%86%E9%A2%91%E6%92%AD%E6%94%BEvideoplayer/et_videoplayer_custom.dart';
import 'package:my_app/17_template/pages/03_%E5%9B%BE%E7%89%87%E8%BD%AE%E6%92%AD/swipe_page.dart';
import 'package:my_app/17_template/pages/04_%E6%9C%AC%E5%9C%B0%E5%AD%98%E5%82%A8/storage_page.dart';
import 'package:my_app/17_template/pages/05_dialog/dialog.dart';
import 'package:my_app/17_template/pages/06_%E8%87%AA%E5%AE%9A%E4%B9%89dialog/et_custom_dialog.dart';
import 'package:my_app/17_template/pages/07_eventbus%E4%BD%BF%E7%94%A8/eventbus_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(       
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildElevatedButton(context,"跳转到下拉刷新，上拉分页加载更多页面",NewsPage.routeName),
          _buildElevatedButton(context,"跳转视频播放页面",ETVideoPlayerView.routeName),
          _buildElevatedButton(context,"轮播图card_swiper的使用",ETSwiperPage.routeName),
          _buildElevatedButton(context,"数据本地存储",ETStoragePage.routeName),
          _buildElevatedButton(context,"Dialog页面",ETDialogPage.routeName),
          _buildButton(context,"自定义Dialog页面",(){
            showDialog(context: context, builder:(context){
              return ETCustomDialog("关于我们","内容是很多很西");
            });
          }),
          _buildElevatedButton(context,"eventbus使用",EventBusPage.routeName),


        ],
       
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String title, String routeName){
   return ElevatedButton(
      child:  Text(title),
      onPressed: (){
        Navigator.pushNamed(context, routeName);
      },
    );
  }
  Widget _buildButton(BuildContext context,String title,Function func){
    return ElevatedButton(
      child:  Text(title),
      onPressed: (){
        func();
      },
    );
  }
}
