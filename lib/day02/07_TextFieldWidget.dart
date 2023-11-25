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
  //TextEditingController用来绑定TextField的，用来获取TextField文本
  final userNameTextCl = TextEditingController();
  final passwordTextCl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Theme(
            //这个是用来修改TextField边框的颜色
            data: ThemeData(
              //要修改哪些参数，直接在这里修改，覆盖之前的设置
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Colors.red,
                  ),
              //下面这个地方设置primaryColor已经失效了
              // primaryColor: Colors.red,
            ),
            child: TextField(
              controller: userNameTextCl,
              decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  // labelText: "uesename",
                  hintText: "请输入用户名",
                  //去掉边框
                  border: InputBorder.none,
                  // border: OutlineInputBorder(),
                  //设置filled位true才能试着fillColor
                  filled: true,
                  fillColor: Colors.red[100]),
              onChanged: (value) {
                print("onChanged：${value}");
              },
              onSubmitted: (value) {
                print("onSubmitted：${value}");
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordTextCl,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              // labelText: "password",
              hintText: "请输入密码",
              //去掉边框
              // border: InputBorder.none,
              border: OutlineInputBorder(),
              //设置filled位true才能试着fillColor
              // filled: true,
              // fillColor: Colors.red[100]
            ),
            onChanged: (value) {
              print("onChanged：${value}");
            },
            onSubmitted: (value) {
              print("onSubmitted：${value}");
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 44,
            //给按钮设置高度宽度 需要外边包括一个container
            child: ElevatedButton(
                onPressed: () {
                  print("用户名：${userNameTextCl.text},密码：${passwordTextCl.text}");
                  // userNameTextCl.text = "";
                  passwordTextCl.text = "";
                },
                child: Text(
                  "登录",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
          ),
        ],
      ),
    );
  }
}


// 一些属性比较简单：keyboardType键盘的类型，style设置样式，textAlign文本对齐方式，maxLength最大显示行数等等；
// decoration：用于设置输入框相关的样式
// icon：设置左边显示的图标
// labelText：在输入框上面显示一个提示的文本
// hintText：显示提示的占位文字
// border：输入框的边框，默认底部有一个边框，可以通过InputBorder.none删除掉
// filled：是否填充输入框，默认为false
// fillColor：输入框填充的颜色
// controller：
// onChanged：监听输入框内容的改变，传入一个回调函数
// onSubmitted：点击键盘中右下角的down时，会回调的一个函数