import 'dart:io';

void main(List<String> args) {
  print("main start");
  var future = getNetwork();
  //2.拿到结果(dynamic)
  // then后面的函数什么时候被执行？
  // 需要再future函数有结果彩之星后面的then方法
  future.then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  }).whenComplete(() {
    print("网络处理完成");
  });

  print("main end");
  greet1(name: "李磊", message: "欢迎学习Flutter");
  greet2(name: "你是蕾蕾吧");
}

Future<String> getNetwork() {
  return Future<String>(() {
    //1.将耗时的操作包裹到future的回调函数中
    //1>只要有返回结果 就会执行future对应的then函数的回调
    //2>如果没有返回结果（有错误信息），需要在future回调中抛出一个异常
    sleep(const Duration(seconds: 3));
    throw Exception(["错误的信息", "哈哈哈哈哈哈", "呵呵呵呵呵"]);
    // return "获取到的网络信息";
  });
}

void greet1({required String name, required String message}) {
  print("$name:$message");
}

void greet2({required String name, String? message}) {
  print("$name:$message");
}
