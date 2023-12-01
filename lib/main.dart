import 'package:flutter/material.dart';
import 'package:my_app/videoplayer/et_videoplayer_custom.dart';

void main() {
  //1.Flutter启动需要执行runApp函数
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MYHomePage(),
    );
  }
}

class MYHomePage extends StatelessWidget {
  const MYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePageContent();
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final String videoUrl =
      "https://live163.ws.126.net/record-live-20c47a984a2ef30cd6029e44bd525a52-2023-11-23-10-44-39_2023-11-23-12-44-39.mp4";

  @override
  Widget build(BuildContext context) {
    return ETVideoPlayerView(videoUrl: videoUrl,);
  }
}


