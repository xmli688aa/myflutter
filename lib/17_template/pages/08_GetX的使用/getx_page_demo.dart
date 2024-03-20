import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/17_template/pages/08_GetX%E7%9A%84%E4%BD%BF%E7%94%A8/Obx%E5%93%8D%E5%BA%94%E5%BC%8F%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/getx_obx_page.dart';

import 'GetXController/getx_controller_example/app_global_controller.dart';
import 'GetXController/getx_controller_example/getx_controller_example_view.dart';

class ETGetXPageDemo extends StatefulWidget {
  static String routeName = "/ETGetXPageDemo";

  const ETGetXPageDemo({super.key});

  @override
  State<ETGetXPageDemo> createState() => _ETGetXPageDemoState();
}

class _ETGetXPageDemoState extends State<ETGetXPageDemo> {
  // final AppGlobalController globalController  = Get.put(AppGlobalController());
  final AppGlobalController globalController  = Get.find<AppGlobalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetXPage"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              child: const Text("GetX:Snackbar的使用"),
              onPressed: () {
                _showGetSnackbar();
              },
            ),
            ElevatedButton(
              child: const Text("GetX:Dialog的使用"),
              onPressed: () {
                _showGetDefaultLog();
              },
            ),
            ElevatedButton(
              child: const Text("GetX:BottomSheet的使用"),
              onPressed: () {
                _showGetBottomSheet();
              },
            ),
            ElevatedButton(
              child: const Text("GetX:Obx状态管理"),
              onPressed: () {
                Get.toNamed(GetXObxPage.routeName);
              },
            ),
            ElevatedButton(
              child: const Text("GetX:GetxController将UI代码、业务逻辑分开"),
              onPressed: () {
                Get.toNamed(GetxControllerExamplePage.routeName);
              },
            ),
            ElevatedButton(
              child: Obx(() => Text("点击上方按钮，更新globalController的userName：${globalController.userName.value}")),
              onPressed: () {
                setState(() {
                  print('${globalController.userName}');
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  _showGetSnackbar() {
    Get.snackbar("Snackbar 标题", "欢迎使用Snackbar", onTap: (snack) {
      print("点击了${snack.runtimeType}");
    });
  }

  _showGetDefaultLog() {
    Get.defaultDialog(
      title: "温馨提示",
      content: const Text("距离2024年春节还剩36天"),
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(30),
      //内容的内边距，默认（EdgeInsets.all(8)）
      radius: 5,
      //弹出框的圆角大小，默认20
      barrierDismissible: false,
      //是否可以通过点击背景关闭弹窗
      textCancel: "取消",
      textConfirm: "确定",
      onConfirm: () {
        print("点击了确定");
        Get.back();
      },
      onCancel: () {
        print("点击了取消");
      },
    );
  }

  _showGetBottomSheet() {
    Get.bottomSheet(
        backgroundColor:Colors.white,
        ignoreSafeArea:true,
        // shape:BorderDirectional(),
        Container(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.wb_sunny_outlined),
                title: const Text("白天模式"),
                onTap: () {
                  Get.changeTheme(ThemeData.light());
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.wb_sunny),
                title: const Text("黑夜模式"),
                onTap: () {
                  Get.changeTheme(ThemeData.dark());
                },
              )
            ],
          ),
        )
    );
  }
}
