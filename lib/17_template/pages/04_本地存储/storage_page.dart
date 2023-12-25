
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage.dart';
class ETStoragePage extends StatefulWidget {
  static String routeName = "./ETStoragePage";

  const ETStoragePage({Key? key}) : super(key: key);

  @override
  State<ETStoragePage> createState() => _ETStoragePageState();
}

class _ETStoragePageState extends State<ETStoragePage> {
  String _storageStr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shared_preferences的使用"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              print("保存");
              _saveData();
            }, child: const Text("保存数据")),
            ElevatedButton(onPressed: () {
              print("获取");
              _getData();
            }, child: const Text("获取数据")),
            Text(_storageStr),
            ElevatedButton(onPressed: () {
              print("获取");
              _deleteData();
            }, child: const Text("清除数据")),
          ],
        ),
      ),
    );
  }
  Future<void> _saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("myName", "ethos");
    //封装SharedPreferences setString方法
    Storage.setString("hisName", "leborn");
  }
  Future<void> _getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var result = sharedPreferences.getString("myName");
    //封装SharedPreferences getString方法
    var result2 = await Storage.getString("hisName");
    var res = "$result + $result2";
    print(res);
    setState(() {
      _storageStr = res;
    });
  }
  Future<void> _deleteData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("myName").then((success){
      if(success){
        setState(() {
          _storageStr = "";
        });
      }
    });


  }
}
 