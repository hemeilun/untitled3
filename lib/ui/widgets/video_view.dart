import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:short_video/ui/widgets/custom_network_image.dart';
import 'package:short_video/utils/color_util.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String url;
  final String? cover;
  final bool autoPlay;
  final bool looping;
  final double aspectRatio;
  final Widget? overlayUI;

  const VideoView(
      {Key? key,
      required this.url,
      this.cover,
      this.autoPlay = false,
      this.looping = false,
      this.aspectRatio = 16 / 9,
      this.overlayUI})
      : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _videoPlayerController; //video_player播放器Controller
  late ChewieController _chewieController; //chewie播放器Controller

  @override
  void initState() {
    super.initState();
    //初始化播放器设置
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: widget.aspectRatio,
        autoPlay: widget.autoPlay,
        looping: widget.looping,
        placeholder: CustomNetworkImage(
          url: widget.cover ?? "",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        allowMuting: false,
        allowPlaybackSpeedChanging: false);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double playerHeight = screenWidth / widget.aspectRatio;
    return Container(
      width: screenWidth,
      height: playerHeight,
      // width: double.infinity,
      // height: double.infinity,
      color: ColorsUtil.COLOR_999999,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
