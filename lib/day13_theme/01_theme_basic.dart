import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          cardTheme: CardTheme(color: Colors.greenAccent, elevation: 10),
          // 7.Text的主题
          textTheme: TextTheme(
            // bodyText1: TextStyle(fontSize: 16, color: Colors.red),
            // bodyText2: TextStyle(fontSize: 20),
            // headline4: TextStyle(fontSize: 14),
            // headline3: TextStyle(fontSize: 16),
            // headline2: TextStyle(fontSize: 18),
            // headline1: TextStyle(fontSize: 20),
          )),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        //设置了背景色 才会跟主题的颜色保持一致
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Hello World"),
            Text(
              "Hello World",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "Hello World",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Hello World",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              "Hello World",
              style: Theme.of(context).textTheme.headline4,
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
              child: Text("Button"),
              onPressed: () {},
            ),
            Card(
              child: Text(
                "你好啊,Flutter",
                style: TextStyle(fontSize: 50),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "分类", icon: Icon(Icons.category))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return HYDetailPage();
          }));
        },
      ),
    );
  }
}

class HYDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
        backgroundColor: Colors.yellow,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text("detail pgae"),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(secondary: Colors.pink)),
        child: FloatingActionButton(
          child: Icon(Icons.pets),
          onPressed: () {},
        ),
      ),
    );
  }
}
