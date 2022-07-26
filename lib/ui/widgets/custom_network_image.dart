import 'package:flutter/material.dart';
import 'package:short_video/utils/asset_util.dart';

class CustomNetworkImage extends StatefulWidget {
  /// 图片地址
  final String url;

  /// 占位gif
  final String gifPlaceholder;

  /// 占位图片路径
  final String pathPlaceholder;

  /// 宽
  final double? width;

  /// 高
  final double? height;

  /// 图片加载错误显示的Widget
  final Widget? errorWidget;

  /// 适配
  final BoxFit? fit;

  /// 占位图片的Size
  final Size logoSize;

  const CustomNetworkImage({
    Key? key,
    required this.url,
    this.gifPlaceholder = "loading",
    this.pathPlaceholder = "other/placeholder_logo",
    this.width,
    this.height,
    this.errorWidget,
    this.fit,
    this.logoSize = const Size(30, 30),
  }) : super(key: key);

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // debugPrint("----------$constraints");
      return FadeInImage(
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
        placeholder: AssetImage("assets/gif/${widget.gifPlaceholder}.gif"),
        image: NetworkImage(widget.url),
        imageErrorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          // return AssetUtil.gifImage(widget.gifPlaceholder);

          return widget.errorWidget ??
              Center(
                child: AssetUtil.pngImage(widget.pathPlaceholder,
                    size: widget.logoSize),
              );
        },
      );
    });
  }
}
