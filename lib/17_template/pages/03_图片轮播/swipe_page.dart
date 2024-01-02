import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class ETSwiperPage extends StatefulWidget {
  static String routeName = "/ETSwiperPage";

  const ETSwiperPage({Key? key}) : super(key: key);

  @override
  State<ETSwiperPage> createState() => _ETSwiperPageState();
}

class _ETSwiperPageState extends State<ETSwiperPage> {
  List banner = [
    {
      "banner_url":
          "https://ts1.cn.mm.bing.net/th/id/R-C.8e091d0e6a2b9bcb27738cd96e22f699?rik=M4LFAVmmb38W6A&riu=http%3a%2f%2fi3.img.969g.com%2fdown%2fimgx2013%2f01%2f21%2f206_170432_901de.jpg&ehk=564uTBfxvugUBybGO2%2bTpMUNgJEa6rUfSrc1sonLso8%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "banner_url":
          "https://ts1.cn.mm.bing.net/th/id/R-C.abd4829c9387ec1bfd1a276a5c1da122?rik=dl55Voqxy4wINQ&riu=http%3a%2f%2fi1.073img.com%2f140306%2f4343693_144142_1.jpg&ehk=qvhMjT0iGQT5DhH8MTkAzJqUpjHJRScTQTT5hj%2forLM%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "banner_url":
          "https://ts1.cn.mm.bing.net/th/id/R-C.ddfbf9ed55354323035f947515fe0233?rik=0KFdFk3RHUzBdg&riu=http%3a%2f%2fi1.img.969g.com%2fdown%2fimgx2013%2f01%2f05%2f206_164916_4fab0.jpg&ehk=Vqb%2f5c3%2fW5n39t7bAae6YpUlfG4ibEbf9lpETY5Xz4c%3d&risl=&pid=ImgRaw&r=0"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("轮播图card_swiper库的使用"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Custom swiper',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(
                height: 200,
                child: CustomSwiper(
                  banner: banner,
                )),
            const Text('Build in layouts ',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(
                height: 200,
                child: MyLayoutSwiper(
                  banner: banner,
                )),
            const Text('Build in STACK layouts ',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(
                height: 200,
                child: StackLayoutSwiper(
                  banner: banner,
                )),
            const Text('Build in  TINDER layouts ',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(
                height: 200,
                child: TinderLayoutSwiper(
                  banner: banner,
                )),
            const Text('Build in  CUSTOM layouts ',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(
                height: 200,
                child: CustomLayoutSwiper(
                  banner: banner,
                )),
          ],
        ),
      ),
    );
  }
}

//custom swiper
class CustomSwiper extends StatefulWidget {
  const CustomSwiper({super.key, required this.banner});

  final List banner;

  @override
  _CustomSwiperState createState() => _CustomSwiperState();
}
class _CustomSwiperState extends State<CustomSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          widget.banner[index]['banner_url'],
          fit: BoxFit.fill,
        );
      },
      onTap: (index) {
        print(index);
      },
      itemCount: widget.banner.length,
      // autoplay: true,
      pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Color(0xFFFFFFFF), activeColor: Color(0xFFFF4646))),
      control: const SwiperControl(),
    );
  }
}

//layouts swiper
class MyLayoutSwiper extends StatefulWidget {
  const MyLayoutSwiper({super.key, required this.banner});

  final List banner;

  @override
  _MyLayoutSwiperState createState() => _MyLayoutSwiperState();
}
class _MyLayoutSwiperState extends State<MyLayoutSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          widget.banner[index]['banner_url'],
          fit: BoxFit.fill,
        );
      },
      onTap: (index) {
        print(index);
      },
      itemCount: widget.banner.length,
      // autoplay: true,
      pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Color(0xFFFFFFFF), activeColor: Color(0xFFFF4646))),
      viewportFraction: 0.8,
      scale: 0.7,
    );
  }
}

// STACK Layout swiper
class StackLayoutSwiper extends StatefulWidget {
  const StackLayoutSwiper({super.key, required this.banner});

  final List banner;

  @override
  _StackLayoutSwiperState createState() => _StackLayoutSwiperState();
}
class _StackLayoutSwiperState extends State<StackLayoutSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          widget.banner[index]['banner_url'],
          fit: BoxFit.fill,
        );
      },
      onTap: (index) {
        print(index);
      },
      itemCount: widget.banner.length,
      // autoplay: true,
      pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Color(0xFFFFFFFF), activeColor: Color(0xFFFF4646))),
      viewportFraction: 0.8,
      scale: 0.9,
      itemWidth: 300.0,
      layout: SwiperLayout.STACK,
    );
  }
}

// TINDER Layout Swiper
class TinderLayoutSwiper extends StatefulWidget {
  const TinderLayoutSwiper({super.key, required this.banner});

  final List banner;

  @override
  _TinderLayoutSwiperState createState() => _TinderLayoutSwiperState();
}
class _TinderLayoutSwiperState extends State<TinderLayoutSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          widget.banner[index]['banner_url'],
          fit: BoxFit.fill,
        );
      },
      onTap: (index) {
        print(index);
      },
      itemCount: widget.banner.length,
      // autoplay: true,
      pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Color(0xFFFFFFFF), activeColor: Color(0xFFFF4646))),
      viewportFraction: 0.8,
      scale: 0.9,
      itemWidth: 300.0,
      itemHeight: 400.0,
      layout: SwiperLayout.TINDER,
    );
  }
}

// CUSTOM LAYOUT Swiper
class CustomLayoutSwiper extends StatefulWidget {
  const CustomLayoutSwiper({super.key, required this.banner});

  final List banner;

  @override
  _CustomLayoutSwiperState createState() => _CustomLayoutSwiperState();
}
class _CustomLayoutSwiperState extends State<CustomLayoutSwiper> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          widget.banner[index]['banner_url'],
          fit: BoxFit.fill,
        );
      },
      onTap: (index) {
        print(index);
      },
      itemCount: widget.banner.length,
      // autoplay: true,
      pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Color(0xFFFFFFFF), activeColor: Color(0xFFFF4646))),
      viewportFraction: 0.8,
      scale: 0.9,
      itemWidth: 300.0,
      itemHeight: 400.0,
      layout: SwiperLayout.CUSTOM,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
        ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
        ..addTranslate(
            [const Offset(-370.0, -40.0), const Offset(0.0, 0.0), const Offset(370.0, -40.0)]),
    );
  }
}
