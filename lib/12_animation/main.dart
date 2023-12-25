import 'package:flutter/material.dart';
import 'package:my_app/12_animation/pages/image_detail.dart';
import 'package:my_app/12_animation/pages/model_page.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: const HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Center(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 16/9
          ),
          children: List.generate(10, (index) {
            // final imageURL = "https://picsum.photos/500/500?random=$index";
            const imageURL = "https://lmg.jj20.com/up/allimg/1113/031920120534/200319120534-7-1200.jpg";
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (ctx, anim1, anim2) {
                        return FadeTransition(opacity: anim1, child: HYImageDetailPage(imageURL,index));
                      }
                  ));
                },
                child: Hero(
                  tag: index,
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  ),
                )
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.pool),
        onPressed: () {
          // iOS -> Modal方式
//          Navigator.of(context).push(MaterialPageRoute(
//            builder: (ctx) {
//              return HYModalPage();
//            },
//            fullscreenDialog: true
//          ));
          Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: const Duration(seconds: 3),
              pageBuilder: (ctx, animation1, animation2) {
                return FadeTransition(
                  opacity: animation1,
                  child: const HYModalPage(),
                );
              }
          ));
//          Navigator.of(context).pushNamed(routeName)
        },
      ),
    );
  }
}