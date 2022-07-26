import 'package:flutter/material.dart';

class ColorsUtil {
  static const Color COLOR_F7F8FA = Color(0xffF7F8FA);
  static const Color COLOR_FF5C5C = Color(0xffFF5C5C);
  static const Color COLOR_333333 = Color(0xff333333);
  static const Color COLOR_666666 = Color(0xff666666);
  static const Color COLOR_999999 = Color(0xff999999);
  static const Color COLOR_AAAAAA = Color(0xffAAAAAA);
  static const Color COLOR_DBDBDB = Color(0xffDBDBDB);
  static const Color COLOR_FFFFFF = Color(0xffFFFFFF);
  static const Color COLOR_EBEBEB = Color(0xffEBEBEB);
  static const Color COLOR_TRANSPARENT = Colors.transparent;

  static Color alphaColorFF5C5C(int alpha) {
    int num = 255 * alpha ~/ 100;
    return Color.fromARGB(num, 255, 92, 92);
  }

  static Color alphaColor000000(int alpha) {
    int num = 255 * alpha ~/ 100;
    return Color.fromARGB(num, 0, 0, 0);
  }
}