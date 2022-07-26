import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

///Hud工具类
class HudUtil {
  static ready() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 40.0
      ..radius = 5.0
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..maskType = EasyLoadingMaskType.none
      ..dismissOnTap = false
      ..progressColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false;
  }

  static show({String msg = "加载中...", bool dismissOnTap = false}) {
    EasyLoading.show(status: msg, dismissOnTap: dismissOnTap);
  }

  static showSuccess(String msg) {
    EasyLoading.showSuccess(msg);
  }

  static showFail(String msg) {
    EasyLoading.showError(msg);
  }

  static dismiss() {
    EasyLoading.dismiss();
  }

  static toast(String msg) {
    EasyLoading.showToast(msg, dismissOnTap: true);
  }
}
