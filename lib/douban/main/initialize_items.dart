// import "package:my_app/douban/main/bottom_bar_item.dart";//import的两种方式 绝对路径
import "package:flutter/cupertino.dart";
import "../home/home.dart";
import "../subject/subject.dart";
import "bottom_bar_item.dart";//import的两种方式 相对路径



List<ETBottomBarItem> bottomNavigationbarItems =[
  ETBottomBarItem("home", "首页"),
  ETBottomBarItem("subject", "书影音"),
  ETBottomBarItem("group", "小组"),
  ETBottomBarItem("mall", "市集"),
  ETBottomBarItem("profile", "我的"),
];

List<Widget> pages = [
  ETHomePage(),
  ETSubjectPage(),
  ETSubjectPage(),
  ETSubjectPage(),
  ETSubjectPage(),

];
