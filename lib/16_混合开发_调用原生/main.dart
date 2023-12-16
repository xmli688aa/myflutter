import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ETMyapp());
}

class ETMyapp extends StatelessWidget {
  const ETMyapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '原生开发',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  const HYHomePage({Key? key}) : super(key: key);

  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  File? _imageFile;
  XFile? _photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("调用原生相机"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _pickImage();
                  },
                  child: Text("选择一张照片")),
              _imageFile == null
                  ? Text("请选择一张照片")
                  : Image.file(
                _imageFile!,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              ElevatedButton(
                  onPressed: () {
                    print("点击了拍照");
                    _takePhoto();
                  },
                  child: Text("拍照")),
              _photo == null ? Container() : Image.file(
                File(_photo!.path) ,
                width: 300,
                height: 300,
                fit: BoxFit.cover,),
            ],
          )
        ],
      ),
    );
  }

  void _pickImage() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000.0, // 设置图片最大宽度，间接压缩了图片的体积
    );
    setState(() {
      if (file != null) {
        _imageFile = File(file!.path);
      }
    });
  }

  void _takePhoto() async {
    XFile photoFile =
    await ImagePicker().pickImage(source: ImageSource.camera) as XFile;
    if (photoFile != null) {
      setState(() {
        _photo = photoFile;
      });
    }
  }
}
