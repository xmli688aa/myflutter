// ignore: file_names
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
      appBar: AppBar(title: const Text("商品列表")),
      body: const MYHomeContent(),
    );
  }
}

class MYHomeContent extends StatelessWidget {
  const MYHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ProductItem("Apple1", "MacBook Product1",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        ProductItem("Apple2", "MacBook Product1",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        ProductItem("Apple3", "MacBook Product1",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
      ],
    );
  }
}

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;
  const ProductItem(this.title, this.desc, this.imageURL, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          desc,
          style: const TextStyle(fontSize: 18),
        ),
        Image.network(imageURL)
      ],
    );
  }
}
