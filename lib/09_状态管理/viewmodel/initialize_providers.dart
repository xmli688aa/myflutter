import 'package:my_app/09_%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import '../model/model.dart';
import 'counter_view_model.dart';
//这个地方必须要导入package:provider/single_child_widget.dart
import 'package:provider/single_child_widget.dart';
//这里统一维护App的provider
//类型必须是SingleChildWidget
List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => ETCounterViewModel(10)),
  ChangeNotifierProvider(create: (ctx) => UserViewModel(UserInfo("lixiaolong", 22, "imageUrl"))),
];
