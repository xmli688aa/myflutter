import 'dart:io';

void main(List<String> args) {
  print("start");
  // Future的链式调用
  Future(() {
    // 发送网络请求1
    sleep(const Duration(seconds: 1));
    return "第一次的结果";
  }).then((value) {
    print(value);
    sleep(const Duration(seconds: 1));
    //用网络请求1返回的数据 发送第二次网络请求 但是出现了异常 这个时候就抛出异常，可以在后面的catchError中拿到异常
    throw Exception("网络请求2发生了错误");
    //发送网络请求2
    // return "第二次的结果";
  }).then((value) {
    print(value);
    return "第三次的结果";
  }).then((value) {
    print(value);
  }).catchError((error) {
    //这里捕获异常
    print(error);
  });
  print("main end");
}
