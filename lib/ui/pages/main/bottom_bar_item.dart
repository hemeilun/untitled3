import 'package:flutter/material.dart';

class BottomBarItem extends BottomNavigationBarItem {
  BottomBarItem(String iconName, String title)
      : super(
    label: title,
    icon: Image.asset("assets/png/tabbar/$iconName.png", width: 32, gaplessPlayback: true),
    activeIcon: Image.asset("assets/png/tabbar/${iconName}_active.png", width: 32, gaplessPlayback: true),
  );
}