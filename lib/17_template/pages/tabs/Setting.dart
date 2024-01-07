import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/17_template/pages/00_Widget%E4%BD%BF%E7%94%A8%E6%A1%88%E4%BE%8B/visibility_page%E6%98%BE%E9%9A%90%E7%BB%84%E4%BB%B6.dart';
import 'home_drawer.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组件使用案例'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildElevatedButton(
                context: context,
                title: "Visibility显隐组件",
                onPressed: () {
                  Get.to(VisibilityPage());
                }),
          ],
        ),
      ),
      drawer: HomeDrawer(),
    );
  }
}

Widget _buildElevatedButton(
    {required BuildContext context,
    required String title,
    required Function onPressed}) {
  return ElevatedButton(
    child: Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    onPressed: () {
      onPressed();
    },
  );
}
