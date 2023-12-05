import 'package:flutter/material.dart';

//1.创建自己需要共享的数据
//viewModel需要继承ChangeNotifier 或者混入（with）ChangeNotifier
class ETCounterViewModel extends ChangeNotifier {
  int _counter =0;

  ETCounterViewModel(this._counter);

  int get counter => _counter;

  //快捷键cmd+n
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}
