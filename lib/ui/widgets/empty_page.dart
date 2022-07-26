import 'package:flutter/cupertino.dart';
import 'package:short_video/utils/color_util.dart';

class EmptyPage extends StatelessWidget {
  final String imageFile;
  final String tip;
  const EmptyPage({Key? key, this.imageFile = "assets/png/other/content_empty.png", this.tip = "空空如也"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // borderRadius:
        // BorderRadius.all(Radius.circular(16)),
        color: ColorsUtil.COLOR_FFFFFF,
      ),
      // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 10),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(imageFile),
          ),
          Text(
            tip,
            style: const TextStyle(fontSize: 15, color: ColorsUtil.COLOR_DBDBDB),
          ),
        ],
      ),
    );
  }
}