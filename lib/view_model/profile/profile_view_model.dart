
import 'package:flutter/material.dart';
import 'package:short_video/ui/pages/profile/fans_page.dart';
import 'package:short_video/ui/pages/profile/follow_page.dart';
import 'package:short_video/ui/pages/profile/setting_page.dart';
import 'package:short_video/ui/pages/publish/publish_page.dart';
import 'package:short_video/utils/navigator_util.dart';

class ProfileViewModel extends ChangeNotifier {
  List<String> tabs = ["作品","喜欢"];
  TabController? tabController;
  int currentIndex = 0;

  ProfileViewModel({required TickerProvider vsync}) {
    tabController = TabController(initialIndex: currentIndex, length: tabs.length, vsync: vsync);
  }


  void setting(BuildContext context) {
    NavigatorUtil.push(context, const SettingPage());
  }

  void fans(BuildContext context) {
    NavigatorUtil.push(context, const FansPage());
  }

  void follow(BuildContext context) {
    NavigatorUtil.push(context, const FollowPage());
  }

  void publish(BuildContext context) {
    NavigatorUtil.push(context, const PublishPage());
  }

  void playVideo(BuildContext context) {

  }
}