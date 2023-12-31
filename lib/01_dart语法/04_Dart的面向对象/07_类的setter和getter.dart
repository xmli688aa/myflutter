main(List<String> args) {
  final p = Person();

  // 直接访问属性
  p.name = "why";
  print(p.name);

  // 通过getter和setter访问
  p.setName = "lilei";
  print(p.getName);
}


class Person {
  late String name;

  // setter
  set setName(String name) => this.name = name;
  // getter
  String get getName => name;
}