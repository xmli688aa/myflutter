
import 'package:flutter/material.dart';
import 'package:my_app/douban/home/home_movie_item.dart';
import 'package:my_app/douban/home/home_request.dart';

class ETHomePageContent extends StatefulWidget {
  const ETHomePageContent({Key? key}) : super(key: key);

  @override
  State<ETHomePageContent> createState() => _ETHomePageContentState();
}

class _ETHomePageContentState extends State<ETHomePageContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //发送网络请求
    HomeRequest.requestMovieList(0);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (ctx, index) {
          return ETHomeMovieItem();
        });
  }



}
