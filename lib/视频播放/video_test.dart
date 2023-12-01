import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
  @override
  Widget build(BuildContext context) {
    return ETVideoPlayerView();
  }
}

class ETVideoPlayerView extends StatefulWidget {
  const ETVideoPlayerView({Key? key}) : super(key: key);

  @override
  State<ETVideoPlayerView> createState() => _ETVideoPlayerViewState();
}

class _ETVideoPlayerViewState extends State<ETVideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  bool _isPlaying = false;
  String _lastTime = "";
  bool _showSlider = true;

  final String videoUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
  // final String videoUrl =
  //     "https://live163.ws.126.net/record-live-20c47a984a2ef30cd6029e44bd525a52-2023-11-23-10-44-39_2023-11-23-12-44-39.mp4";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setVideoPlayer();
  }

  void setVideoPlayer() {
    _videoPlayerController =
    VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        print("视频播放器初始化成功");
        // 确保在初始化视频后显示第一帧，直至在按下播放按钮。
        setState(() {
          _videoPlayerController.play();
        });
      });
    _videoPlayerController!.addListener(() {
      // print(_videoPlayerController.value.duration);
      // print(_videoPlayerController.value.position);
      getLastTime();
      setState(() {
        _isPlaying = _videoPlayerController!.value.isPlaying;
      });
    });
  }

  //获取最后剩余时间
  void getLastTime() {
    Duration totalTime = _videoPlayerController.value.duration;
    int totalSeconds = totalTime.inSeconds;
    Duration positionTime = _videoPlayerController.value.position;
    int positionSeconds = positionTime.inSeconds;
    int lastSeconds = totalSeconds - positionSeconds;
    int hour = (lastSeconds / 3600).floor();
    String hourStr = "${hour}";
    if (hour < 10) {
      hourStr = "0$hourStr";
    }

    int minute = ((lastSeconds % 3600) / 60).floor();
    String minStr = "${minute}";
    if (minute < 10) {
      minStr = "0$minStr";
    }
    int second = (lastSeconds % 60).floor();
    String secStr = "${second}";
    if (second < 10) {
      secStr = "0$secStr";
    }
    // print("当前剩余时间${hourStr}:${minStr}:${secStr}") ;
    _lastTime = "${hourStr}:${minStr}:${secStr}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("视频播放")),
      body: Container(
        // width: double.infinity,
        // height: 350,
        // color: Colors.grey,
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              createVideoView(),//视频界面
              buildBottomSliderView(),//底部的进度条
              buildFastAndBackView(),//快进和后退按钮
            ],
          )),
    );
  }

  Positioned buildFastAndBackView() {
    return Positioned(
        bottom: 100,
        right: 10,
        left: 10,
        child: Visibility(
          visible: !_showSlider,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {
                    //添加点击事件
                    Duration positionTime = _videoPlayerController.value.position;
                    int positionSeconds = positionTime.inSeconds;
                    setState(() {
                      _videoPlayerController.seekTo(Duration(seconds: positionSeconds-15));
                    });
                  },
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Container(
                      child: Icon(Icons.assignment_return_rounded),
                      width: 30,
                      height: 30,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    //添加点击事件
                    Duration positionTime = _videoPlayerController.value.position;
                    int positionSeconds = positionTime.inSeconds;
                    setState(() {
                      _videoPlayerController.seekTo(Duration(seconds: positionSeconds+15));
                    });
                  },
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Container(
                      child: Icon(Icons.fast_forward),
                      width: 30,
                      height: 30,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
            ],

          ),
        ));
  }

  Positioned buildBottomSliderView() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Visibility(
        visible: _showSlider,
        child: Container(
          // height: _showSlider? 30:0,
          height: 30,
          width: double.infinity,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  //添加点击事件
                  setState(() {
                    _videoPlayerController.value.isPlaying
                        ? _videoPlayerController.pause()
                        : _videoPlayerController.play();
                  });
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Container(
                    child:
                    Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                    width: 30,
                    height: 30,
                    color: Colors.white60,
                  ),
                ),
              ),

              Expanded(
                child: VideoProgressIndicator(
                  _videoPlayerController,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                      backgroundColor: Colors.black,
                      bufferedColor: Colors.white,
                      playedColor: Colors.red),
                ),
              ),
              Container(
                width: 65,
                alignment: Alignment.center,
                child: Text("$_lastTime"),
              ),
              GestureDetector(
                onTap: () {
                  print("点击了全屏");
                  //添加点击事件
                  setState(() {});
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Container(
                    child: Icon(Icons.fullscreen),
                    width: 30,
                    height: 30,
                    color: Colors.white60,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              //SizeBox设置父视图的高度为0 但是SizeBox还是会显示
              // SizedBox(
              //   width:30,
              //   height:30,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       print("点击了全屏");
              //     },
              //     child: Icon(Icons.fullscreen),
              //     style: ButtonStyle(
              //       padding: MaterialStateProperty.all(EdgeInsets.zero),
              //       backgroundColor:
              //       MaterialStateProperty.all<Color>(Colors.white60),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //         RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(5),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector createVideoView() {
    return GestureDetector(
      onDoubleTap: () {
        print("双击了视频");
        setState(() {
          _showSlider = true;
          _videoPlayerController.value.isPlaying
              ? _videoPlayerController.pause()
              : _videoPlayerController.play();
        });
      },
      onTap: () {
        print("点击了视频");
        setState(() {
          _showSlider = !_showSlider;
        });
      },
      child: Container(
        height: 230,
        color: Colors.grey,
        child: _videoPlayerController.value.isInitialized
            ? AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: VideoPlayer(_videoPlayerController),
        )
            : Container(
          width: double.infinity,
          height: 230,
          color: Colors.grey,
          child: Text("视频正在缓冲"),
        ),
      ),
    );
  }
}
