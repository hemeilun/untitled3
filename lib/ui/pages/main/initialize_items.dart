import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../publish/publish_page.dart';
import 'bottom_bar_item.dart';

List<Widget> pages = [
  const HomePage(),
  const PublishPage(),
  const ProfilePage()
];

final List<BottomNavigationBarItem> items = [
  BottomBarItem("home", "首页"),
  BottomBarItem("publish", "发布"),
  BottomBarItem("profile", "我的"),
];