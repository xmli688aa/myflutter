import 'package:flutter/material.dart';

class ETTrianglePainter extends CustomPainter {
  // 三角形的颜色
  Color? color;
  // 箭头方向
  Direction? direction;

  ETTrianglePainter(
      {this.color = Colors.green, this.direction = Direction.bottom});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color!;
    var path = Path();
    switch (direction) {
      case Direction.bottom:
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(size.width / 2, size.height);
        break;

      case Direction.top:
        path.moveTo(size.width / 2, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height / 2);
        break;

      case Direction.left:
        path.moveTo(0, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height / 2);
        break;

      case Direction.right:
        path.moveTo(0, size.height / 2);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height);
        break;

      case null:
        break;
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

enum Direction { top, left, bottom, right }
