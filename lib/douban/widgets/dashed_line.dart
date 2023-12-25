import 'package:flutter/material.dart';

class ETDashedLine extends StatelessWidget {
  final double containerSize ;
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;
  const ETDashedLine({super.key, 
    this.containerSize = 200,
    this.axis = Axis.horizontal,
    this.dashedWidth = 2,
    this.dashedHeight = 2,
    this.count = 15,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: axis==Axis.horizontal? containerSize:dashedHeight,
      height:axis==Axis.vertical? containerSize:dashedWidth,
      child: ETDashedLineContent(axis: axis, dashedWidth: dashedWidth, dashedHeight: dashedHeight, count: count, color: color),
    );
  }
}

class ETDashedLineContent extends StatelessWidget {
  final Axis axis;

  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  const ETDashedLineContent({super.key, 
    required this.axis ,
    required this.dashedWidth ,
    required this.dashedHeight ,
    required this.count ,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_) {
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}