import 'package:flutter/material.dart';
import 'package:my_app/17_template/pages/00_Widget%E4%BD%BF%E7%94%A8%E6%A1%88%E4%BE%8B/05_%E8%87%AA%E5%AE%9A%E4%B9%89%E4%B8%89%E8%A7%92%E5%BD%A2/triangle_painter.dart';

class TrianglePage extends StatefulWidget {
  const TrianglePage({super.key});

  @override
  State<TrianglePage> createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('绘制三角形'),
      ),
      body: Column(
        children: [
          CustomPaint(
            size: const Size(80, 80),
            painter: ETTrianglePainter(color: Colors.green,direction: Direction.bottom),
          ),
        ],
      ),
    );
  }
}

