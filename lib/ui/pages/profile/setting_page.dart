import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_video/utils/color_util.dart';

import '../../../view_model/profile/setting_view_model.dart';
import '../../widgets/custom_gesture.dart';
import '../../widgets/custom_scaffold.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingViewModel(),
      child: Consumer<SettingViewModel>(builder: (context, viewModel, child) {
        return CustomScaffold(
          context: context,
          title: "设置",
          elevation: 0.2,
          backgroundColor: ColorsUtil.COLOR_FFFFFF,
          child: _buildContent(viewModel),
        );
      }),
    );
  }

  Widget _buildContent(SettingViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildPhone(viewModel),
            _buildUpdate(viewModel),
            _buildAbout(viewModel),
            const SizedBox(height: 30),
            CustomGesture(
              child: Container(
                padding:
                const EdgeInsets.only(top: 6, left: 15, bottom: 6, right: 15),
                decoration: const BoxDecoration(
                  color: ColorsUtil.COLOR_FF5C5C,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: const Text("退出登录", style: TextStyle(fontSize: 14, color: ColorsUtil.COLOR_FFFFFF)),
              ),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                viewModel.logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhone(SettingViewModel viewModel) {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "手机号",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsUtil.COLOR_666666,
                  ),
                ),
                Text(
                  "189****9321",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsUtil.COLOR_666666,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 0.5, color: ColorsUtil.COLOR_EBEBEB),
        ],
      ),
    );
  }

  Widget _buildUpdate(SettingViewModel viewModel) {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "检查更新",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsUtil.COLOR_666666,
                  ),
                ),
                Text(
                  "v1.0.0",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsUtil.COLOR_666666,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 0.5, color: ColorsUtil.COLOR_EBEBEB),
        ],
      ),
    );
  }

  Widget _buildAbout(SettingViewModel viewModel) {
    return GestureDetector(
      child: SizedBox(
        height: 50,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "关于我们",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorsUtil.COLOR_666666,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp, size: 18, color: ColorsUtil.COLOR_999999,),
                ],
              ),
            ),
            Container(height: 0.5, color: ColorsUtil.COLOR_EBEBEB),
          ],
        ),
      ),
      behavior: HitTestBehavior.opaque,
      onTap: () {
        viewModel.about(context);
      },
    );
  }
}
