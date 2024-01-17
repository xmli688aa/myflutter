
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class HYSizeFit {
  // 1.基本信息
  static double physicalWidth = 0;
  static double physicalHeight= 0;
  static double screenWidth= 0;
  static double screenHeight= 0;
  static double dpr= 0;
  static double statusHeight= 0;
  static double bottomHeight= 0;

  static double rpx= 0;
  static double px= 0;
//app启动的时候调用初始化方法 然后初始化宽度 高度等常量
  static void initialize({double standardSize = 750}) {
    FlutterView device = WidgetsBinding.instance.platformDispatcher.views.first;
    // 1.手机的物理分辨率
    // physicalWidth = window.physicalSize.width;
    // 由于window弃用了 改编成下面的设置
    physicalWidth = device.physicalSize.width;

    // physicalHeight = window.physicalSize.height;
    physicalHeight = device.physicalSize.height;
    // 2.获取dpr
    // dpr = window.devicePixelRatio;
    dpr = device.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    // statusHeight = window.padding.top / dpr;
    statusHeight = device.padding.top / dpr;
    bottomHeight = device.padding.bottom / dpr;

    // 5.计算rpx的大小
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}