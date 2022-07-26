import 'package:flutter/material.dart';
import 'package:short_video/ui/widgets/custom_network_image.dart';

class PublishPage extends StatefulWidget {
  const PublishPage({Key? key}) : super(key: key);

  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("发布"),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    // return const Center(
    //   child: Text("发布"),
    // );
    return Center(
      child: Container(
        width: 200,
        height: 250,
        color: Colors.amber,
        child: const CustomNetworkImage(url: "https://img1.baidu.com/it/u=1773366646,898438994&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",),
      ),
    );
  }
}
