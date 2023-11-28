import 'dart:async';
import 'dart:io';

void main(List<String> args) {
  print("main start");
  var result = getnatWorkData().then((value) {
    print(value);
  });
  print("mian end");
}

// Future<String> getnatWorkData() {
//   return Future(() {
//     sleep(Duration(seconds: 2));
//     return "网络数据";
//   });
// }

/**
 * 解决两个问题
 * 1.await必须在async函数中才能使用
 * async函数返回的结果必须是一个future类型
 */

Future getnatWorkData() async {
  return await sendRequest();
}

Future<String> sendRequest() {
  return Future(() {
    //模拟耗时操作
    sleep(const Duration(seconds: 3));
    return "网络数据";
  });
}
