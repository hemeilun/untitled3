import 'package:flutter/cupertino.dart';

class NavigatorUtil {
  static Future push(BuildContext context, Widget widget) async {
    return await Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));
  }

  static Future pushDialogAndRemoveUntil(BuildContext context, Widget widget) async {
    return await Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true), (route) => false);
  }

  static Future pushAndRemoveUntil(BuildContext context, Widget widget) async {
    return await Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => widget), (route) => false);
  }

  static pushAndPop(BuildContext context, Widget widget) {
    Navigator.pop(context);
    Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
