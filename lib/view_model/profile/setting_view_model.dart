import 'package:flutter/cupertino.dart';
import 'package:short_video/ui/pages/common/webview_page.dart';
import 'package:short_video/utils/color_util.dart';
import 'package:short_video/utils/navigator_util.dart';

class SettingViewModel extends ChangeNotifier {

  void logout(BuildContext context) {
    debugPrint("logout-------");
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text(
              "温馨提示",
              style: TextStyle(
                fontSize: 16,
                color: ColorsUtil.COLOR_333333,
              ),
            ),
            content: const Text(
              "确认退出登录吗?",
              style: TextStyle(
                fontSize: 15,
                color: ColorsUtil.COLOR_666666,
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text(
                  "取消",
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorsUtil.COLOR_666666,
                  ),
                ),
                onPressed: () {
                  NavigatorUtil.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: const Text(
                  "确定",
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorsUtil.COLOR_FF5C5C,
                  ),
                ),
                onPressed: () {
                  NavigatorUtil.pop(context);
                },
              ),
            ],
          );
        });
  }

  void about(BuildContext context) {
    NavigatorUtil.push(context, const WebViewPage(initialUrl: "https://www.baidu.com"));
  }

}
