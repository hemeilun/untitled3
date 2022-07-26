import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_video/ui/widgets/custom_network_image.dart';
import 'package:short_video/utils/asset_util.dart';
import 'package:short_video/utils/color_util.dart';

import '../../../view_model/profile/profile_view_model.dart';
import '../../widgets/custom_tab_indicator.dart';
import '../../widgets/sliver_header_delegate.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileViewModel(vsync: this),
      child: Consumer<ProfileViewModel>(builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: ColorsUtil.COLOR_FFFFFF,
          body: _buildContent(viewModel),
        );
      }),
    );
  }

  Widget _buildContent(ProfileViewModel viewModel) {
    return Container(
      // margin: const EdgeInsets.only(top: kToolbarHeight),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // SliverToBoxAdapter(
            //   child: _buildHeader(viewModel),
            // ),

            SliverAppBar(
              backgroundColor: ColorsUtil.COLOR_FF5C5C,
              expandedHeight: 240,
              pinned: true,
              elevation: 0.2,
              title: const Text("我的", style: TextStyle(fontSize: 16),),
              flexibleSpace: _buildFlexibleSpaceBar(viewModel),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(
                minHeight: 45,
                maxHeight: 45,
                child: _buildTabBar(viewModel),
              ),
            ),
          ];
        },
        body: _buildTabView(viewModel),
      ),
    );
  }

  Widget _buildFlexibleSpaceBar(ProfileViewModel viewModel) {
    return FlexibleSpaceBar(
      background: _buildHeader(viewModel),
    );
  }

  Widget _buildHeader(ProfileViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.only(top: kToolbarHeight, left: 10, right: 10),
      color: ColorsUtil.COLOR_FFFFFF,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            // width: double.infinity,
            height: 30,
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: AssetUtil.svgImage(
                "profile/setting",
                color: ColorsUtil.COLOR_999999,
                size: const Size(24, 24),
              ),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                viewModel.setting(context);
              },
            ),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Container(
                  color: ColorsUtil.COLOR_DBDBDB,
                  width: 70,
                  height: 70,
                  child: const CustomNetworkImage(
                    url:
                        "https://img1.baidu.com/it/u=1773366646,898438994&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
                    fit: BoxFit.cover,
                    logoSize: Size(22, 22),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildUserData(viewModel, title: "获赞", data: "100"),
                    _buildUserData(viewModel, title: "粉丝", data: "100", onPressed: () {
                      viewModel.fans(context);
                    }),
                    _buildUserData(viewModel, title: "关注", data: "100", onPressed: () {
                      viewModel.follow(context);
                    }),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "随机名字",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorsUtil.COLOR_333333,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "不辜负自己，莫错过流光，去做你想做的事，趁阳光正好，趁微风不燥。余生很长，何必慌张。你再优秀，也总有人对你不堪。你再不堪，也有人认为你是限量版的唯一。",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsUtil.COLOR_666666,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserData(ProfileViewModel viewModel,
      {required String title, String? data, Function? onPressed}) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data ?? "0",
            style: const TextStyle(fontSize: 14, color: ColorsUtil.COLOR_666666),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: ColorsUtil.COLOR_666666),
          ),
        ],
      ),
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onPressed?.call();
      },
    );
  }

  Widget _buildTabBar(ProfileViewModel viewModel) {
    return Container(
      color: ColorsUtil.COLOR_FFFFFF,
      alignment: Alignment.center,
      child: TabBar(
        controller: viewModel.tabController,
        isScrollable: true,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, height: 2),
        labelColor: ColorsUtil.COLOR_FF5C5C,
        unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal, fontSize: 16, height: 2),
        unselectedLabelColor: ColorsUtil.COLOR_333333,
        // indicatorColor: ColorsUtil.COLOR_FF5C5C,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: const UnderlineTabIndicatorFinal(
          borderSide: BorderSide(width: 2, color: ColorsUtil.COLOR_FF5C5C),
        ),
        tabs: viewModel.tabs.map((e) => Tab(text: e)).toList(),
      ),
    );
  }

  Widget _buildTabView(ProfileViewModel viewModel) {
    List<Widget> tempList = [];
    for (int i = 0; i < viewModel.tabs.length; i++) {
      tempList.add(_buildTabViewContent(viewModel));
    }
    return TabBarView(
      controller: viewModel.tabController,
      children: tempList,
    );
  }

  Widget _buildTabViewContent(ProfileViewModel viewModel) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: 10,
        padding:
            const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: ColorsUtil.COLOR_EBEBEB,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CustomNetworkImage(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      url:
                          "https://img1.baidu.com/it/u=1773366646,898438994&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
                    ),
                    // color: ColorsUtil.COLOR_999999,
                    // size: const Size(24, 24),
                    Positioned(
                      child: AssetUtil.svgImage(
                        "profile/play",
                        size: const Size(40, 40),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 5,
                      child: Row(
                        children: [
                          AssetUtil.svgImage(
                            "profile/play",
                            size: const Size(15, 15),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "100",
                            style: TextStyle(
                              fontSize: 10,
                              color: ColorsUtil.COLOR_FFFFFF,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // FocusScope.of(context).unfocus();
            },
          );
        });
  }
}
