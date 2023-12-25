import '../shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return HYSizeFit.setPx(toDouble());
  }

  double get rpx {
    return HYSizeFit.setRpx(toDouble());
  }
}