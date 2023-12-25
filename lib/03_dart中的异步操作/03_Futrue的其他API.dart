void main(List<String> args) {
  // Future(() {
  //   return "哈哈";
  // }).then((value) {
  //   print(value);
  // });

  Future.value("哈哈哈").then((result) {
    print(result);
  });
  Future.error("错误信息").catchError((value) {
    print(value);
  });
  Future.delayed(const Duration(seconds: 2), () {
    print("延迟2s执行了任务");
    return "hello fullter";
  }).then((value) {
    print("拿到了第一次返回的结果：$value");
    return "hello world";
  }).then((value) {
    print("拿到了第二次返回的结果：$value");
  });
}
