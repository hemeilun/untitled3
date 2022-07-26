import 'package:flutter/material.dart';

class CustomGesture extends StatelessWidget {
  final Widget? child;
  final HitTestBehavior? behavior;
  final GestureTapCallback? onTap;

  const CustomGesture(
      {Key? key,
      this.child,
      this.behavior = HitTestBehavior.opaque,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      behavior: behavior,
      onTap: () async {
        // String? token = await AccountMgr().getToken();
        // debugPrint("CustomGesture_token----$token");
        // if (token == null || token.isEmpty) {
        //   NavigatorUtil.push(
        //       Global.navigatorKey.currentState!.context, LoginPage());
        // } else {
        //   onTap?.call();
        // }
        onTap?.call();
      },
    );
  }
}
