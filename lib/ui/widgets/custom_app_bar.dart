import 'package:flutter/material.dart';
import 'package:short_video/utils/asset_util.dart';

import '../../utils/color_util.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Color titleColor;
  final double titleFontSize;
  final Widget? titleWidget;
  final bool centerTitle;
  final Widget? leftWidget;
  final Color leftWidgetColor;
  final List<Widget>? actions;
  final double elevation;
  final Color backgroundColor;
  final bool isShowLeading;
  final Function? onLeftClick;
  final Brightness brightness;
  final bool offstage;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    this.title,
    this.titleColor = ColorsUtil.COLOR_333333,
    this.titleFontSize = 16.0,
    this.titleWidget,
    this.centerTitle = true,
    this.leftWidget,
    this.leftWidgetColor = ColorsUtil.COLOR_333333,
    this.actions,
    this.elevation = 0.5,
    this.backgroundColor = ColorsUtil.COLOR_FFFFFF,
    this.isShowLeading = true,
    this.onLeftClick,
    this.brightness = Brightness.light,
    this.offstage = false,
    this.automaticallyImplyLeading = false,
    this.bottom,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: widget.offstage,
      child: AppBar(
        title: widget.titleWidget ??
            Text( widget.title ?? "",
                style: TextStyle(
                    fontSize: widget.titleFontSize, color: widget.titleColor)),
        leading: (widget.isShowLeading == true)
            ? widget.leftWidget != null
                ? GestureDetector(
                    child: widget.leftWidget,
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      widget.onLeftClick?.call();
                    },
                  )
                : IconButton(
                    icon: AssetUtil.pngImage("other/back_arrow", size: const Size(24, 24)),
                    onPressed: () {
                      if (widget.onLeftClick == null) {
                        Navigator.of(context).pop();
                      } else {
                        widget.onLeftClick!();
                      }
                    },
                  )
            : null,
        actions: [
          Container(
              // color: Colors.amber,
              height: kToolbarHeight,
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: widget.actions == null ? 0 : 16),
              child: Row(children: widget.actions ?? [])),
        ],
        centerTitle: widget.centerTitle,
        titleSpacing: 0,
        backgroundColor: widget.backgroundColor,
        elevation: widget.elevation,
        // brightness: widget.brightness,
        automaticallyImplyLeading: widget.automaticallyImplyLeading,
        bottom: widget.bottom,
      ),
    );
  }
}
