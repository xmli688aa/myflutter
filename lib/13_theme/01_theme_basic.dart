import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * 1.一旦设置了主题, 那么应用程序中的某些Widget, 就会直接使用主题的样式
     * 2.可以通过Theme.of(context).textTheme.display2
     */

    // MaterialColor extends Color
    // 父类的引用指向一个子类的对象
//    Color color = Colors.orangeAccent;

    // 子类的引用指向父类的对象;
    // MaterialColor color = Color(0xff000000);

    return MaterialApp(
      title: 'Flutter Demo',
      // 全局主题
      theme: ThemeData(
        // 1.亮度
          brightness: Brightness.light,
          colorScheme:
          ColorScheme.fromSeed(
            seedColor: Colors.blue,
            // onPrimary:Colors.red,
            // primary: Colors.purple,
            // secondary: Colors.redAccent,
            // onSecondary: Colors.black,
            // background: Colors.grey
          ),
          // 5.Button的主题
          // buttonTheme: ButtonThemeData(
          //     height: 25, minWidth: 10, buttonColor: Colors.pinkAccent),
          // 6.Card的主题
          cardTheme: const CardTheme(color: Colors.greenAccent, elevation: 10),
          // 7.Text的主题
          textTheme: const TextTheme(
            // bodyText1: TextStyle(fontSize: 16, color: Colors.red),
            // bodyText2: TextStyle(fontSize: 20),
            // headline4: TextStyle(fontSize: 14),
            // headline3: TextStyle(fontSize: 16),
            // headline2: TextStyle(fontSize: 18),
            // headline1: TextStyle(fontSize: 20),
          )),
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
        //设置了背景色 才会跟主题的颜色保持一致
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("Hello World"),
            const Text(
              "Hello World",
              style: TextStyle(fontSize: 14),
            ),
            const Text(
              "Hello World",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Hello World",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Hello World",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Switch(
              value: true,
              onChanged: (value) {},
            ),
            Switch(
              value: false,
              onChanged: (value) {},
            ),
            CupertinoSwitch(
              value: true,
              onChanged: (value) {},
              // activeColor: Colors.red,
            ),
            CupertinoSwitch(
              value: false,
              onChanged: (value) {},
              // activeColor: Colors.red,
            ),
            ElevatedButton(
              child: const Text("Button"),
              onPressed: () {},
            ),
            const Card(
              child: Text(
                "你好啊,Flutter",
                style: TextStyle(fontSize: 50),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "分类", icon: Icon(Icons.category))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return const HYDetailPage();
          }));
        },
      ),
    );
  }
}

class HYDetailPage extends StatelessWidget {
  const HYDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("详情页"),
        backgroundColor: Colors.yellow,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text("detail pgae"),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(secondary: Colors.pink)),
        child: FloatingActionButton(
          child: const Icon(Icons.pets),
          onPressed: () {},
        ),
      ),
    );
  }
}
