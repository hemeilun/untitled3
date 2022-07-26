import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_video/ui/widgets/video_view.dart';
import 'package:short_video/utils/asset_util.dart';
import 'package:short_video/utils/color_util.dart';

import '../../../view_model/home/home_view_model.dart';
import '../../widgets/custom_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(vsync: this),
      child: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
        return Scaffold(
          body: _buildContent(viewModel),
        );
      }),
    );
  }

  Widget _buildContent(HomeViewModel viewModel) {
    return Stack(
      children: [
        _buildTabView(viewModel),
        _buildTabBar(viewModel),
      ],
    );
  }

  Widget _buildTabView(HomeViewModel viewModel) {
    List<Widget> tempList = [];
    for (int i = 0; i < viewModel.tabs.length; i++) {
      tempList.add(_buildPageView(viewModel));
    }
    return TabBarView(
      controller: viewModel.tabController,
      children: tempList,
    );
  }

  /// PageView
  Widget _buildPageView(HomeViewModel viewModel) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: ColorsUtil.COLOR_999999,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const VideoView(
                url:
                    "https://cloud-res.obs.cn-east-3.myhuaweicloud.com:443/video/20220719/file/bc6e58d0e85548728eca7f1251bd034a.mp4",
                cover:
                    "https://img1.baidu.com/it/u=1773366646,898438994&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
              ),
              // const CustomNetworkImage(
              //   width: double.infinity,
              //   height: double.infinity,
              //   fit: BoxFit.cover,
              //   url:
              //       "https://img1.baidu.com/it/u=1773366646,898438994&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
              // ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildPageBottomContent(viewModel, index),
              ),
              Positioned(
                right: 20,
                bottom: 100,
                child: _buildPageRightContent(viewModel),
              ),
            ],
          ),
        );
      },
    );
  }

  /// PageView底部内容
  Widget _buildPageBottomContent(HomeViewModel viewModel, int index) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(20),
      color: ColorsUtil.COLOR_FFFFFF.withOpacity(0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "首页 $index",
            style:
                const TextStyle(fontSize: 14, color: ColorsUtil.COLOR_FFFFFF),
          ),
          const SizedBox(height: 8),
          const Text(
            "不辜负自己，莫错过流光，去做你想做的事，趁阳光正好，趁微风不燥。余生很长，何必慌张。你再优秀，也总有人对你不堪。你再不堪，也有人认为你是限量版的唯一。生命的价值在于自己看得起自己，人生的意义在于努力进取。",
            style: TextStyle(fontSize: 14, color: ColorsUtil.COLOR_FFFFFF),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// PageView右边内容
  Widget _buildPageRightContent(HomeViewModel viewModel) {
    return Column(
      children: [
        _buildOperationOption(
          viewModel,
          iconName: "follow",
          onPressed: () {
            viewModel.follow(context);
          },
        ),
        const SizedBox(height: 20),
        _buildOperationOption(
          viewModel,
          iconName: "like",
          number: "0",
          onPressed: () {
            viewModel.like(context);
          },
        ),
        const SizedBox(height: 20),
        _buildOperationOption(
          viewModel,
          iconName: "comment",
          number: "0",
          onPressed: () {
            viewModel.comment(context);
          },
        ),
        const SizedBox(height: 20),
        _buildOperationOption(
          viewModel,
          iconName: "forward",
          number: "0",
          onPressed: () {
            viewModel.forward(context);
          },
        ),
      ],
    );
  }

  Widget _buildOperationOption(HomeViewModel viewModel,
      {required String iconName, String? number, Function? onPressed}) {
    return GestureDetector(
      child: Column(
        children: [
          AssetUtil.svgImage("home/$iconName", size: const Size(28, 28)),
          const SizedBox(height: 4),
          number == null
              ? Container()
              : Text(
                  number,
                  style: const TextStyle(
                      fontSize: 13, color: ColorsUtil.COLOR_FFFFFF),
                ),
        ],
      ),
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onPressed?.call();
      },
    );
  }

  /// TabBar
  Widget _buildTabBar(HomeViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      height: 84,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            height: 45,
            child: Center(
              child: TabBar(
                controller: viewModel.tabController,
                indicatorColor: ColorsUtil.COLOR_FFFFFF,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                labelColor: ColorsUtil.COLOR_FFFFFF,
                unselectedLabelColor: ColorsUtil.COLOR_AAAAAA,
                indicatorWeight: 2.0,
                labelStyle: const TextStyle(
                    fontSize: 16, height: 2, fontWeight: FontWeight.w500),
                unselectedLabelStyle: const TextStyle(
                    fontSize: 16, height: 2, fontWeight: FontWeight.w500),
                tabs: viewModel.tabs.map((e) {
                  return Text(e);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
