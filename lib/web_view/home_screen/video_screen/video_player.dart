import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videooo;

  const VideoPlayerScreen({super.key, required this.videooo});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? videoplayerController;
  Future<void>? _initializeVideoPlayerFuture;
  ChewieController? chewieController;

  @override
  void initState() {
    videoplayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videooo));
    _initializeVideoPlayerFuture =
        videoplayerController!.initialize().then((value) {
      setState(() {
        chewieController = ChewieController(
          autoInitialize: true,
          videoPlayerController: videoplayerController!,
          aspectRatio: 16 / 9,
        );
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    videoplayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Form(
          child: Stack(
            children: [
              Container(
                height: height,
                width: width,
                color: Colors.white,
                child: Center(
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                          aspectRatio: videoplayerController!.value.aspectRatio,
                          child: Chewie(controller: chewieController!),
                        );
                      } else {
                        return Center(
                          child: SpinkitFlutter.spinkit,
                        );
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: MyThemeData.background,
                      child: const Center(
                        child: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
