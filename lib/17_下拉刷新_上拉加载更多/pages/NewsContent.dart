import 'package:flutter/material.dart';

class NewsContent extends StatefulWidget {
  NewsContent();

  _NewsContentState createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        appBar: AppBar(
          title: Text("这是一个新闻"),
        ),
        body: Text("这是一个内容"),
      ),
    );
  }
}