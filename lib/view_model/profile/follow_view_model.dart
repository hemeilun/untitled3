
import 'package:flutter/material.dart';

class FollowViewModel extends ChangeNotifier {
  List datas = [1,1,1,1];
  FollowViewModel() {

  }

  void requestData() {
    debugPrint("requestData-------");

  }

  void follow(BuildContext context) {
    debugPrint("follow-------");
  }

  void unfollow(BuildContext context) {
    debugPrint("unfollow-------");
  }
}