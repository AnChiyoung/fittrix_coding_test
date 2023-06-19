import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayView extends StatefulWidget {
  const VideoPlayView({Key? key}) : super(key: key);

  @override
  State<VideoPlayView> createState() => _VideoPlayViewState();
}

class _VideoPlayViewState extends State<VideoPlayView> {
  
  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;

  List<String> videoPath = ['assets/mp4/ad_video1.mp4', 'assets/mp4/ad_video2.mp4'];
  int videoIndex = 0;
  
  @override
  void initState() {
    videoInitialize();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  void videoInitialize() {
    print(videoIndex);
    if(videoIndex > 1) {
      videoPlayerController.pause();
    } else {

      videoPlayerController = VideoPlayerController.asset(videoPath.elementAt(videoIndex));
      initializeVideoPlayerFuture = videoPlayerController.initialize();
      videoPlayerController.setLooping(false);

      videoPlayerController.addListener(() {
        if(videoPlayerController.value.isPlaying) {
        } else {
          setState(() {});
        }
      });
      videoPlayerController.play();
      videoIndex++;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: videoPlayerController.value.aspectRatio,
            child: VideoPlayer(videoPlayerController),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
