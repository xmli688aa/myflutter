import 'package:get/get.dart';
class GetxControllerExampleState {
  var teacher = Teacher();

  GetxControllerExampleState() {
    ///Initialize variables
  }
}

class Teacher {
  // rx 变量
  var name = "Jimi".obs;
  var age = 18.obs;
// 构造函数创建
// var name;
// var age;
// Teacher({this.name, this.age});
}