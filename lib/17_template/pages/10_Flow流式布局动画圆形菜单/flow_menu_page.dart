import 'package:flutter/material.dart';
import 'package:my_app/17_template/pages/10_Flow%E6%B5%81%E5%BC%8F%E5%B8%83%E5%B1%80%E5%8A%A8%E7%94%BB%E5%9C%86%E5%BD%A2%E8%8F%9C%E5%8D%95/test_flow_delegate.dart';

class FlowMenuPage extends StatefulWidget {
  const FlowMenuPage({Key? key}) : super(key: key);

  @override
  State<FlowMenuPage> createState() => _FlowMenuPageState();
}

class _FlowMenuPageState extends State<FlowMenuPage>
    with TickerProviderStateMixin {
  ///   流式布局 Flow 圆形菜单
  ///构建菜单所使用到的图标
  List<Icon> iconList = const [
    Icon(
      Icons.add,
      color: Colors.white,
    ),
    Icon(
      Icons.wallpaper,
      color: Colors.white,
    ),
    Icon(
      Icons.message,
      color: Colors.white,
    ),
    Icon(
      Icons.home,
      color: Colors.white,
    ),
  ];

  //lib/code10/main_data1005.dart
  /// Flow 流式布局 构建菜单数据Widget
  List<Widget> buildTestData() {
    List<Widget> childWidthList = [];
    for (int i = 0; i < iconList.length; i++) {
      ///每个菜单添加InkWell点击事件
      Widget itemContainer = InkWell(
        onTap: () {
          ///打开或者关闭菜单
          colseOrOpen();

          ///点击菜单其他的操作
        },
        child: Container(
          ///圆形背景
          decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: const BorderRadius.all(Radius.circular(23))),
          alignment: Alignment.center,
          height: 44,
          width: 44,
          child: iconList[i],
        ),
      );
      childWidthList.add(
        itemContainer,
      );
    }
    return childWidthList;
  }

  ///控制菜单的打开或者关闭
  void colseOrOpen() {
    if (_closed) {
      _controller.reset();
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  ///动画控制器
  late AnimationController _controller;

  ///变化比率
  double _rad = 0.0;

  ///是否执行完动画，或者说是动画停止
  bool _closed = true;

  @override
  void initState() {
    super.initState();

    ///创建动画控制器
    ///执行时间为200毫秒
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this)

      ///设置监听，每当动画执行时就会实时回调此方法
      ..addListener(() {
        setState(() {
          ///从0到1
          _rad = _controller.value;
          print("$_rad ");
        });
      })

      ///设置状态监听
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("正向执行完毕 ");
          _closed = !_closed;
        } else if (status == AnimationStatus.dismissed) {
          print("反向执行完毕 ");
          _closed = !_closed;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('环形菜单布局'),
      ),
      body: Stack(
        children: [
          const Center(child: Text('hhhhh'),),
          Flow(
            ///代理
            delegate: TestFlowDelegate(radiusRate: _rad),
            ///使用到的子Widget
            children: buildTestData(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
