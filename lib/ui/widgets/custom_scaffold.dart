import 'package:flutter/material.dart';

import '../../utils/color_util.dart';
import 'custom_app_bar.dart';

class CustomScaffold extends StatefulWidget {
  final BuildContext context;
  final String? title;
  final Color titleColor;
  final double titleFontSize;
  final bool centerTitle;
  final Widget? titleWidget;
  final Widget? leftWidget;
  final Color leftWidgetColor;
  final List<Widget>? actions;
  final double elevation;
  final Color barBackgroundColor;
  final bool isShowLeading;
  final Function? onLeftClick;
  final Brightness brightness;
  final bool offstage;
  final bool automaticallyImplyLeading;
  final Color backgroundColor;
  final PreferredSizeWidget? appbarBottom;
  final Widget child;
  final bool bottomSafeArea;

  const CustomScaffold(
      {Key? key,
      required this.context,
      this.title,
      this.titleColor = ColorsUtil.COLOR_333333,
      this.titleFontSize = 18,
      this.centerTitle = true,
      this.titleWidget,
      this.leftWidget,
      this.leftWidgetColor = ColorsUtil.COLOR_333333,
      this.actions,
      this.elevation = 0.5,
      this.barBackgroundColor = ColorsUtil.COLOR_FFFFFF,
      this.isShowLeading = true,
      this.onLeftClick,
      this.brightness = Brightness.light,
      this.offstage = false,
      this.automaticallyImplyLeading = false,
      this.backgroundColor = ColorsUtil.COLOR_F7F8FA,
      this.appbarBottom,
      required this.child,
        this.bottomSafeArea = true})
      : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.title,
          titleColor: widget.titleColor,
          titleFontSize: widget.titleFontSize,
          centerTitle: widget.centerTitle,
          titleWidget: widget.titleWidget,
          leftWidget: widget.leftWidget,
          leftWidgetColor: widget.leftWidgetColor,
          actions: widget.actions,
          elevation: widget.elevation,
          isShowLeading: widget.isShowLeading,
          backgroundColor: widget.barBackgroundColor,
          onLeftClick: widget.onLeftClick,
          brightness: widget.brightness,
          offstage: widget.offstage,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          bottom: widget.appbarBottom,
        ),
        backgroundColor: widget.backgroundColor,
        body: SafeArea(
          bottom: widget.bottomSafeArea,
          child: widget.child,
        ),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
