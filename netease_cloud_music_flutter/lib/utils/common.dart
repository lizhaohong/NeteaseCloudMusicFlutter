import 'package:flutter_screenutil/flutter_screenutil.dart';

const String HeroTagLogo = "logo";

double getWidth(double width) {
  return ScreenUtil().setWidth(width);
}

double getHeight(double height) {
  return ScreenUtil().setHeight(height);
}