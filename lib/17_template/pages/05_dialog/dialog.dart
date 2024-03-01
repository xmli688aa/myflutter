import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class ETDialogPage extends StatefulWidget {
  static String routeName = "/ETDialogPage";
  const ETDialogPage({Key? key}) : super(key: key);

  @override
  State<ETDialogPage> createState() => _ETDialogPageState();
}

class _ETDialogPageState extends State<ETDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ETDialogPage"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              _alertDialog();
            }, child: const Text("alert弹框-AlertDialog")),
            ElevatedButton(onPressed: () {
              _simpleDialog();

            }, child: const Text("select弹框-SimpleDialog")),
            ElevatedButton(onPressed: () {
              _modalBottomSheet();

            }, child: const Text("AcitonSheet底部弹出框-showModalBottomSheet")),
            ElevatedButton(onPressed: () {
              _toast();
            }, child: const Text("toast-fluttertoast第三方库")),
          ],
        ),
      ),
    );
  }
  _alertDialog() async{
    //可以通过result监听点击事件 也可以直接在按钮的点击方法中处理点击事件
    var result = await showDialog(context: context, builder:(context){
      return AlertDialog(
            title: const Text("提示"),
        content: const Text("您确定要删除吗"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(onPressed: (){
                print("取消");
                Navigator.pop(context,"Cancel");
              },child: const Text("取消"),),
              FloatingActionButton(onPressed: (){
                print("确定");
                Navigator.pop(context,"OK");

              },child: const Text("确定"),),
            ],
          )
        ],
      );
    });
    print(result);
  }
  _simpleDialog() async {
    var result = await showDialog(context: context, builder: (context){
      return SimpleDialog(
          title: const Text("选择内容"),
        children: [
          SimpleDialogOption(
            child: const Text("Option A"),
            onPressed: (){
              print("Option A");
              Navigator.pop(context,"A");

            },
          ),
          const Divider(),
          SimpleDialogOption(
            child: const Text("Option B"),
            onPressed: (){
              print("Option B");
              Navigator.pop(context,"B");

            },
          ),
          const Divider(),

          SimpleDialogOption(
            child: const Text("Option C"),
            onPressed: (){
              print("Option C");
              Navigator.pop(context,"C");

            },
          ),
          const Divider(),

        ],
      );
    });
    print(result);

  }
  _modalBottomSheet(){
   showModalBottomSheet(context: context, builder: (context){
     return SizedBox(
       height: 200,
       child:  Column(
         children: [
           ListTile(
             title: const Text("分享 A"),
             onTap: (){
               print("A");
               Navigator.pop(context,"A");

             },
           ),
           const Divider(),
           ListTile(
             title: const Text("分享 B"),
             onTap: (){
               print("B");
               Navigator.pop(context,"B");

             },
           ),
           const Divider(),

           ListTile(
             title: const Text("分享 C"),
             onTap: (){
               print("C");
               Navigator.pop(context,"C");

             },
           )
         ],
       ),
     );
   });
  }
  _toast(){
    Fluttertoast.showToast(
        msg: "这是一个提示信息",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,//位置
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
