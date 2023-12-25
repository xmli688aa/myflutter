import 'package:flutter/material.dart';
import 'package:my_app/09_%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/viewmodel/counter_view_model.dart';
import 'package:my_app/09_%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/viewmodel/initialize_providers.dart';
import 'package:my_app/09_%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //多个providers的情况
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );

  // runApp(
  //     ChangeNotifierProvider(
  //     child: ChangeNotifierProvider(
  //       child: const MyApp(),
  //       create: (context){
  //         return UserViewModel(UserInfo("李磊",20,"url"));
  //       },
  //     ),
  //     create: (context) {
  //       return ETCounterViewModel(199);
  //     })
  // );
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
    return const HomePageContent();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("proverder"),
      ),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ETData1(),
          ETData2(),
          ETData3(),
          ETData4(),
        ]),
      ),

    );
  }
}

class ETData1 extends StatefulWidget {
  const ETData1({Key? key}) : super(key: key);

  @override
  State<ETData1> createState() => _ETData1State();
}

class _ETData1State extends State<ETData1> {
  @override
  Widget build(BuildContext context) {
    print("执行了data1的build方法");
    //3步 在其他位置使用共享的数据
    int counter = Provider.of<ETCounterViewModel>(context).counter;
    return Container(
      color: Colors.cyan,
      child: Text(
        "当前计数 $counter",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

class ETData2 extends StatefulWidget {
  const ETData2({Key? key}) : super(key: key);

  @override
  State<ETData2> createState() => _ETData2State();
}

class _ETData2State extends State<ETData2> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // nsLog("执行了didChangeDependencies", StackTrace.current);
  }

  @override
  Widget build(BuildContext context) {
    //3步 在其他位置使用共享的数据

    print("执行了data2的build方法");
    return Container(
      color: Colors.redAccent,
      child: Consumer<ETCounterViewModel>(
        builder: (context, viewmodel, child) {
          return Text(
            "当前计数 ${viewmodel.counter}",
            style: const TextStyle(fontSize: 20),
          );
        },
      ),
    );
  }
}

class ETData3 extends StatelessWidget {
  const ETData3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (ctx,usrVM,child){
      return Container(
        color: Colors.yellow,
        child: Text("姓名:${usrVM.user.nickName}",style: const TextStyle(fontSize: 20),),
      );
    });
  }
}
class ETData4 extends StatelessWidget {
  const ETData4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer2<UserViewModel,ETCounterViewModel>(builder: (ctx,userVM,counterVM,child){
      return Container(
        child: Text("当前计数：${counterVM.counter} 姓名:${userVM.user.nickName} ",style: const TextStyle(fontSize: 20),),
      );
    });
  }
}
