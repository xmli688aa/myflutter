import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/ui/pages/filter/filter_content.dart';
import 'package:my_app/Favorcate/ui/shared/app_theme.dart';

class HYFilterScreen extends StatelessWidget {
  static const String routeName = "./filterScreen";
  const HYFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HYAppTheme.navigationBGColor,
        title: const Text("美食过滤",style: TextStyle(color: Colors.white),),
      ),
      body: const HYFilterContent(),
    );
  }
}
