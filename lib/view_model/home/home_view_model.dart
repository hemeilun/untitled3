
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<String> tabs = ["推荐", "关注"];
  TabController? tabController;
  int currentIndex = 0;

  HomeViewModel({required TickerProvider vsync}) {
    tabController = TabController(initialIndex: currentIndex, length: tabs.length, vsync: vsync);
  }

  void requestData() {

  }

  void follow(BuildContext context) {
    debugPrint("follow-------");
  }

  void like(BuildContext context) {
    debugPrint("like-------");
  }

  void comment(BuildContext context) {
    debugPrint("comment-------");
  }

  void forward(BuildContext context) {
    debugPrint("forward-------");
  }
}