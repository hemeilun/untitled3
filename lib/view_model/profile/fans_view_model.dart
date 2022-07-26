
import 'package:flutter/material.dart';

class FansViewModel extends ChangeNotifier {
  List datas = [1,1,1,1];

  FansViewModel() {

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