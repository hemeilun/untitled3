import 'package:flutter/material.dart';
import 'package:short_video/ui/pages/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Short Video",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),

    );
  }
}
