import 'dart:io';

void main(List<String> args) {
  print("main start");

  // getData();
  getData().then((value) {
    //这个是三次回调的结果
    print(value);
  });

  print("main end");
}

// 这个方法发送3次网络请求
Future getData() async {
  // getNetWorkData("flutter").then((value) {
  //   print("第1次的结果：$value");
  //   //拿到了第一次的结果
  //   return getNetWorkData(value);
  // }).then((value) {
  //   print("第二次的结果：$value");
  //   return getNetWorkData(value);
  // }).then((value) {
  //   print("第三次最终的结果:$value");
  // });
  var res1 = await getNetWorkData("flutter");
  print(res1);
  var res2 = await getNetWorkData(res1);
  print(res2);
  var res3 = await getNetWorkData(res2);
  return res3;
}

Future getNetWorkData(String arg) {
  return Future(() {
    sleep(const Duration(seconds: 3));
    return "Hello  $arg";
  });
}
