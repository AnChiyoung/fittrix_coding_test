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
  
  @override
  void initState() {
    videoPlayerController = VideoPlayerController.asset('assets/mp4/ad_video1.mp4');
    initializeVideoPlayerFuture = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
    videoPlayerController.play();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
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
