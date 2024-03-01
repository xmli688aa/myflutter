import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXObxPage extends StatelessWidget {
  static String routeName = "/GetXObxPage";

  // RxInt count = RxInt(0);
  // var count = Rx<double>(0);
  var _count = 0.obs;
  final _teacher = ETTeacher();

  GetXObxPage({super.key});
  void increment() {
    _count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("计数器"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("当前计数：$_count")),
            ElevatedButton(
              onPressed: () {
                increment();
              },
              child: const Text("点我+1"),
            ),
            const SizedBox(height: 60,),
            Obx(() => Text("老师的姓名:${_teacher.name} 年龄:${_teacher.age}")),
            ElevatedButton(
              onPressed: () {
                // 修改的时候需要改变属性的value值
                _teacher.name.value = "张三";
                _teacher.age.value = 49;
              },
              child: const Text("修改老师数据"),
            ),
          ],
        ),
      ),
    );
  }
}


class ETTeacher {
  // rx 变量
  var name = "Jimi".obs;
  var age = 18.obs;
// 构造函数创建
// var name;
// var age;
// Teacher({this.name, this.age});
}
