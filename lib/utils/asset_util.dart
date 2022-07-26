import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AssetUtil {
  static Widget svgImage(String path, {Size? size, Color? color, BoxFit fit = BoxFit.contain}) {
    return SvgPicture.asset(
      "assets/svg/$path.svg",
      color: color,
      width: size?.width,
      height: size?.height,
      fit: fit,
    );
  }

  static Widget pngImage(String path, {Size? size, BoxFit fit = BoxFit.contain, Color? color}) {
    return Image.asset(
      "assets/png/$path.png",
      width: size?.width,
      height: size?.height,
      fit: fit,
      color: color,
    );
  }

  static Widget gifImage(String gifName, {Size? size, BoxFit fit = BoxFit.contain}) {
    return Image.asset(
      "assets/gif/$gifName.gif",
      width: size?.width,
      height: size?.height,
      fit: fit,
    );
  }
}