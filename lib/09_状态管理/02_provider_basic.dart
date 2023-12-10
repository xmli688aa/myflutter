import 'package:flutter/material.dart';
import 'package:my_app/09_%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/viewmodel/counter_view_model.dart';
import 'package:provider/provider.dart';

/**
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider
 * 3.在其它位置使用共享的数据
 *  > Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
 *  > Consumer(相对推荐): 当Provider中的数据发生改变时, 执行重新执行Consumer的builder
 *  > Selector: 1.selector方法(作用,对原有的数据进行转换) 2.shouldRebuild(作用,要不要重新构建)
 */

void main() {

  runApp(ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) {
        return ETCounterViewModel(199);
      }));
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
        title: Text("InheritedWidget"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ETData1(),
          ETData2(),
        ]),
      ),
      floatingActionButton: Selector<ETCounterViewModel,ETCounterViewModel>(
        child: Icon(Icons.add),//优化 数据改变的时候 这个地方的child不会重新build
        builder:
            (BuildContext context,  model, Widget? child) {
          return FloatingActionButton(
            child:child,
            onPressed: () {
              model.counter += 1;
            },
          );
        },
        selector: (context ,counterVM ) =>counterVM,
        shouldRebuild: (ctx,vm) =>false,
      ),
      // floatingActionButton: Consumer<ETCounterViewModel>(
      //   child: Icon(Icons.add),//优化 数据改变的时候 这个地方的child不会重新build
      //   builder:
      //       (BuildContext context,  model, Widget? child) {
      //     return FloatingActionButton(
      //       child:child,
      //       onPressed: () {
      //         model.counter += 1;
      //       },
      //     );
      //   },
      // ),
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
        style: TextStyle(fontSize: 20),
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
      child:Consumer<ETCounterViewModel>(
        builder: (context,viewmodel,child){
          return  Text(
            "当前计数 ${viewmodel.counter}",
            style: TextStyle(fontSize: 20),
          );
        },
      ),
    );
  }
}
