import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_video/ui/widgets/custom_network_image.dart';
import 'package:short_video/utils/color_util.dart';

import '../../../view_model/profile/fans_view_model.dart';
import '../../widgets/custom_gesture.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/empty_page.dart';

class FansPage extends StatefulWidget {
  const FansPage({Key? key}) : super(key: key);

  @override
  State<FansPage> createState() => _FansPageState();
}

class _FansPageState extends State<FansPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FansViewModel(),
      child: Consumer<FansViewModel>(builder: (context, viewModel, child) {
        return CustomScaffold(
          context: context,
          title: "粉丝",
          elevation: 0.2,
          backgroundColor: ColorsUtil.COLOR_FFFFFF,
          child: _buildContent(viewModel),
        );
      }),
    );
  }

  Widget _buildContent(FansViewModel viewModel) {
    return viewModel.datas.isEmpty
        ? const EmptyPage()
        : ListView.builder(
            // shrinkWrap: true,
            itemCount: viewModel.datas.length,
            padding: EdgeInsets.zero,
            primary: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(context, viewModel, index);
            });
  }

  Widget _buildItem(BuildContext context, FansViewModel viewModel, int index) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: ColorsUtil.COLOR_DBDBDB,
                      width: 60,
                      height: 60,
                      child: const CustomNetworkImage(
                        url: "https://img1.baidu.com/it/u=1773366646,898438994&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
                        fit: BoxFit.cover,
                        logoSize: Size(22, 22),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      "随机名字",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorsUtil.COLOR_333333,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomGesture(
                    child: Container(
                      padding:
                      const EdgeInsets.only(top: 6, left: 15, bottom: 6, right: 15),
                      decoration: const BoxDecoration(
                        color: ColorsUtil.COLOR_FF5C5C,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: const Text("关注", style: TextStyle(fontSize: 14, color: ColorsUtil.COLOR_FFFFFF)),
                    ),
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      viewModel.follow(context);
                    },
                  ),
                ],
              ),
            ),
            index != viewModel.datas.length - 1
                ? Container(height: 0.5, color: ColorsUtil.COLOR_EBEBEB)
                : Container(),
          ],
        ),
      ),
      behavior: HitTestBehavior.opaque,
      onTap: () {},
    );
  }
}
