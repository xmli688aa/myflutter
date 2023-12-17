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
  List<XFile> _images = [];

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
                    _pickMultiImage();
                  },
                  child: Text("选择多张照片")),
           GridView.builder(
                      itemCount: _images.length<9?_images.length + 1:9,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150, //item的宽度
                          mainAxisExtent: 200 //itme的高度
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == _images.length && _images.length<9) {
                          return GestureDetector(
                              onTap: () {
                                _pickMultiImage();
                              },
                              child: Icon(Icons.add));
                        }
                        XFile xfile = _images[index];

                        return Image.file(
                          File(xfile.path),
                          fit: BoxFit.fill,
                        );
                      },
                    ),
              ElevatedButton(
                  onPressed: () {
                    print("点击了拍照");
                    _takePhoto();
                  },
                  child: Text("拍照")),
              _photo == null
                  ? Container()
                  : Image.file(
                      File(_photo!.path),
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
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

  void _pickMultiImage() async {
    List<XFile> listFiles =
        await ImagePicker().pickMultiImage(imageQuality: 10);
    if (listFiles.isNotEmpty) {
      setState(() {
        // _images.removeRange(0, _images.length);
        // _images.clear();
        // _images.addAll(listFiles);
        _images.insertAll(0, listFiles);
      });
    }
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
