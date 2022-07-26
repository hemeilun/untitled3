
import 'package:flutter/material.dart';
import 'package:short_video/utils/color_util.dart';

import 'initialize_items.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        fixedColor: ColorsUtil.COLOR_FF5C5C,
        unselectedItemColor: ColorsUtil.COLOR_999999,
        elevation: 5,
        items: items,
        onTap: (index) {
          debugPrint("--------$index");
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
