import 'package:flutter/material.dart';
class VisibilityPage extends StatelessWidget {
  const VisibilityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visibility'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("visible控制内部子组件的显隐"),
          const Text("replacement可在隐藏时进行占位"),
          // Wrap流式布局组件 默认水平布局 位置不够自动换到下一行
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildVisibility(true),
              _buildVisibility(false),
            ],
          ),
        ],
      )
    );
  }

  Widget _buildVisibility(bool visible) {
    Widget box = Container(
      height: 30,
      width: 50,
      color: Colors.blue,
      // margin: EdgeInsets.all(5),
      child: const Center(child: Text("box")),

    );
    return Container(
      width: double.infinity,
      height: 150 * 0.618,
      color: Colors.cyanAccent.withAlpha(33),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          box,
          Visibility(
              visible: visible,
              // 隐藏时的占位视图
              replacement: Container(
                width: 44,
                height: 44,
                color: Colors.green,
              ),
              child: Container(
                alignment: Alignment.center,
                height: 80 * 0.618,
                width: 80,
                color: Colors.red,
                child: const Text(
                  "visible\ntrue",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          box,
        ],
      ),
    );
  }
}
