//根Widget
import 'package:flutter/cupertino.dart';

class ETCounterWidget extends InheritedWidget {
  //1定义共享的数据 可以是基本数据类型 也可以是对象
  int counter ;
  ETPerson person ;
  //2定义构造方法
  ETCounterWidget({super.key,   required this.person,  this.counter=10, required Widget child}) : super(child: child);
  //3获取组件最近的当前InheritedWidget
  static ETCounterWidget? of(BuildContext context) {
    //沿着Element树，去找到最近的ETCounterElement 从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }
  @override
  //4决定要不要回调State中的didChangeDependencies
  //如果返回true：执行依赖当前的InheritedWidget的State中的didChangeDependencies
  bool updateShouldNotify(covariant ETCounterWidget oldWidget) {
    return oldWidget.counter != counter;
    return true;
  }

}

class ETPerson {
  int? age ;
  String? name ;
  ETPerson({this.age,this.name});
}

