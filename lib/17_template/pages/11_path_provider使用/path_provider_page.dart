import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderPage extends StatefulWidget {
  const PathProviderPage({super.key});

  @override
  State<PathProviderPage> createState() => _PathProviderPageState();
}

class _PathProviderPageState extends State<PathProviderPage> {
  String fileStr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文件、文件夹操作'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  createDir();
                  print('创建文件夹');
                },
                child: Text('创建文件夹')),
            TextButton(
                onPressed: () {
                  queryDir();
                  print('遍历文件夹');
                },
                child: Text('遍历文件夹')),
            TextButton(
                onPressed: () {
                  renameDir();
                  print('重命名文件夹');
                },
                child: Text('重命名文件夹')),
            TextButton(
                onPressed: () {
                  deleteDir();
                  print('删除文件夹');
                },
                child: Text('删除文件夹')),
            TextButton(
                onPressed: () {
                  createFile();
                  print('创建文件');
                },
                child: Text('创建文件')),
            TextButton(
                onPressed: () {
                  deleteFile();
                  print('删除文件');
                },
                child: Text('删除文件')),
            TextButton(
                onPressed: () {
                  writeFile();
                  print('文件写入数据');
                },
                child: Text('文件写入数据')),
            TextButton(
                onPressed: () {
                  writeFileContinue();
                  print('文件追加写入数据');
                },
                child: Text('文件追加写入数据')),
            TextButton(
                onPressed: () {
                  readFile();
                  print('文件读取');
                },
                child: Text('文件读取')),
            Text(fileStr),
            TextButton(
                onPressed: () {
                  readAsset(context);
                  print('读取asset文件数据');
                },
                child: Text('读取asset文件数据的两种方式')),
          ],
        ),
      ),
    );
  }

  /// 创建文件夹
  createDir() async {
    final parentDir = await getApplicationSupportDirectory();
    // Platform.pathSeparator：平台分隔符，在Android和iOS中表示“/”。
    String path = "${parentDir.path}${Platform.pathSeparator}hello/a/b/c";
    print("path:$path");
    var dir = Directory(path);
    bool exist = dir.existsSync();
    if (exist) {
      print("文件已存在");
    } else {
      // create()：创建文件夹，默认不支持嵌套文件夹，create(recursive:true)支持嵌套文件夹的创建。
      var result = dir.create(recursive: true);
      print("创建$result");
    }
  }

  /// 遍历文件夹中的文件
  queryDir() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}hello";
    Stream<FileSystemEntity> fileList = Directory(path).list(recursive: true);
    fileList.forEach((element) {
      FileSystemEntityType type = FileSystemEntity.typeSync(element.path);
      print("$element 类型：$type");
    });
  }

  /// 重命名文件夹
  renameDir() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}hello";
    var dir = Directory(path);
    String newPath = '${parentDir.path}${Platform.pathSeparator}newhello';
    var dir2 = Directory(newPath);
    if (dir2.existsSync()) {
      print('newhello文件夹已经存在');
    } else {
      var newDir = await dir.rename(newPath);
      print(newDir);
    }
  }

  /// 删除文件夹
  deleteDir() async {
    final parentDir = await getApplicationSupportDirectory();

    String path = "${parentDir.path}${Platform.pathSeparator}hello";
    var dir = Directory(path);
    if (dir.existsSync()) {
      dir.delete(recursive: true);
      print(dir);
    } else {
      print('文件夹hello不存在');
    }
  }

  /// 创建文件
  createFile() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}mytxt.txt";
    var file = File(path);
    bool exist = file.existsSync();
    if (exist) {
      print("文件已存在");
    } else {
      await file.create();
      print(file);
    }
  }

  /// 删除文件
  deleteFile() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}mytxt.txt";
    var file = File(path);
    bool exist = file.existsSync();
    if (exist == false) {
      print("文件不存在");
    } else {
      await file.delete();
      print(file);
    }
  }

  /// 文件写入数据
  writeFile() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}mytxt.txt";
    var file = File(path);
    await file.writeAsString("哈喽 flutter1");
    // //追加写入
    // await file.writeAsBytes(const Utf8Encoder().convert("\n哈喽 flutter2"),
    //     mode: FileMode.writeOnlyAppend);
  }

  /// 文件追加写入数据
  writeFileContinue() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}mytxt.txt";
    var file = File(path);
    //追加写入
    await file.writeAsBytes(const Utf8Encoder().convert("\n哈喽 flutter2"),
        mode: FileMode.writeOnlyAppend);
  }

  /// 文件读取数据
  readFile() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}mytxt.txt";
    var file = File(path);
    List<String> lines = await file.readAsLines();
    for (var e in lines) {
      print(e);
    }
    //读取bytes并转String
    String result = const Utf8Decoder().convert(await file.readAsBytes());
    print("result: $result");
    setState(() {
      fileStr = result;
    });
  }

  /// 读取asset文件
  readAsset(BuildContext context) async {
    //方式一
    String jsonStr = await DefaultAssetBundle.of(context)
        .loadString("assets/json/category.json");
    var list = json.decode(jsonStr);
    print("jsonStr: $list");

    //方式二
    //1.加载json文件
    final String categoryStr =
        await rootBundle.loadString("assets/json/category.json");
    //2.解析json字符串 转成Map 或者List
    final categoryMap = json.decode(categoryStr);
    //3.将map中的内容转成一个一个对象
    final resultList = categoryMap["category"];

    print("jsonStr2: $resultList");
  }
}
