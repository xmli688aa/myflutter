import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text("Hello World")),
      body: const HomePageContent(),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final String imageUrl =
      "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg";
  @override
  Widget build(BuildContext context) {
    return ImagesDemo(imageUrl: imageUrl);
    ;
  }
}

class ImagesDemo extends StatelessWidget {
  ImagesDemo({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  final Widget _image = Image.asset(
    "assets/images/headerIcon.jpg",
    width: 400,
    height: 400,
    fit: BoxFit.cover,
  );
  final Widget _image2 = Image.asset(
    "assets/images/blackzhijia.jpg",
    width: 200,
    height: 200,
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //listView宽度默认就是屏幕的宽度 所以这里要包裹一个Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //1图片切圆角ClipRRect
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: _image2,
            ),
          ],
        ),
        //2图片切圆角 Container设置圆形的decoration
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: _image2,
        ),
        // 3图片切圆角ClipOval
        ClipOval(
          child: _image2,
        ),
        // 4 CircleAvatar设置backgroundImage
        CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(imageUrl),
          // child: _image2,
        ),
        //5.ClipPath切圆角
        ClipPath.shape(
          shape: const CircleBorder(),
          child: _image2,
        )
      ],
    );
  }
}
//width、height：用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，
//如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则。
// fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：
// fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
// cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
// contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
// fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
// fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
// none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。

// color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式；
// repeat：当图片本身大小小于显示空间时，指定图片的重复规则。