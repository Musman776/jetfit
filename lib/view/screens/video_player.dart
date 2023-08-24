import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jetfit/controllers/dahboard_controller.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/web_view/home_screen/manage_profile/manage_profile_controller.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';
import 'package:video_player/video_player.dart';

import '../../utilis/utilis.dart';

class VideoPlayerScreen extends StatefulWidget {
  final  videooo;

  const VideoPlayerScreen({super.key, required this.videooo});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  var height, width;

  VideoPlayerController? videoplayerController;
  Future<void>? _initializeVideoPlayerFuture;
  VideoModel? model;
  bool isclick = false;
  String? time;

  Future<VideoModel> video() async {
    setState(() {
      model = VideoModel.fromMap(widget.videooo.toMap());
      print("model $model");
    });
    return model!;
  }

  void _disposeControllers() {
    videoplayerController?.dispose();
  }

  @override
  void initState() {
    Get.put(DashBoardController());
    video().then((value) {
      videoplayerController =
          VideoPlayerController.networkUrl(Uri.parse(value.videoURL!));
      _initializeVideoPlayerFuture =
          videoplayerController!.initialize().then((value) {
            setState(() {
              videoplayerController!.play();
            });
            videoplayerController!.addListener(() {
              setState(() {
                time =
                '${videoplayerController!.value.position.inMinutes}:${(videoplayerController!.value.position.inSeconds % 60).toString().padLeft(2, '0')} / ${videoplayerController!.value.duration.inMinutes}:${(videoplayerController!.value.duration.inSeconds % 60).toString().padLeft(2, '0')}';
              });
            });
          });
    });

    super.initState();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Stack(
          children: [
            Container(
                height: height,
                width: width,
                color: MyThemeData.background,
                child: orientation == Orientation.portrait
                    ? Stack(
                  children: [
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                isclick = !isclick;
                                print(isclick);
                              });
                            },
                            child: Stack(
                              children: [
                                Center(
                                  child: AspectRatio(
                                    aspectRatio: videoplayerController!
                                        .value.aspectRatio,
                                    child: VideoPlayer(
                                        videoplayerController!),
                                  ),
                                ),
                                isclick == false
                                    ? SizedBox()
                                    : Expanded(
                                  child: Container(
                                    height: height,
                                    width: width,
                                    color: MyThemeData.background
                                        .withOpacity(0.3),
                                  ),
                                ),
                                isclick == false
                                    ? SizedBox()
                                    : Center(
                                  child: IconButton(
                                    icon: Icon(
                                      videoplayerController!
                                          .value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (videoplayerController!
                                            .value.isPlaying) {
                                          videoplayerController!
                                              .pause();
                                        } else {
                                          videoplayerController!
                                              .play();
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                              child: WhiteSpinkitFlutter.spinkit);
                        }
                      },
                    ),
                    isclick == false
                        ? SizedBox()
                        : Padding(
                      padding:
                      EdgeInsets.only(bottom: height * 0.1),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: height * 0.1,
                          width: width * 0.9,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.videooo.videoName
                                        .toString(),
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.04),
                                  ),
                                  Text(
                                    widget.videooo.videoDescription
                                        .toString(),
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: width * 0.03,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: height * 0.18,
                                  width: width,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Container(
                                        height: height * 0.04,
                                        width: width * 0.07,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: const Center(
                                            child: Image(
                                                image: AssetImage(
                                                    "images/music (2).png"))),
                                      ),
                                      Container(
                                        height: height * 0.04,
                                        width: width * 0.07,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: const Center(
                                            child: Image(
                                                image: AssetImage(
                                                    "images/subtitle.png"))),
                                      ),
                                      Container(
                                        height: height * 0.04,
                                        width: width * 0.07,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: const Center(
                                            child: Image(
                                                image: AssetImage(
                                                    "images/settings_24px.png"))),
                                      ),
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            videoplayerController!.pause();
                                          },
                                          child: Container(
                                            height: height * 0.045,
                                            width: width * 0.25,
                                            decoration:
                                            BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius
                                                  .circular(50),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "End workout",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    isclick == false
                        ? SizedBox()
                        : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: height * 0.06,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  time.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: VideoProgressIndicator(
                                  colors: VideoProgressColors(
                                      playedColor: Colors.white),
                                  videoplayerController!,
                                  allowScrubbing: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
                    : Stack(
                  children: [
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                isclick = !isclick;
                                print(isclick);
                              });
                            },
                            child: Stack(
                              children: [
                                Center(
                                  child: AspectRatio(
                                    aspectRatio: videoplayerController!
                                        .value.aspectRatio,
                                    child: VideoPlayer(
                                        videoplayerController!),
                                  ),
                                ),
                                isclick == false
                                    ? SizedBox()
                                    : Expanded(
                                  child: Container(
                                    height: height,
                                    width: width,
                                    color: MyThemeData.background
                                        .withOpacity(0.3),
                                  ),
                                ),
                                isclick == false
                                    ? SizedBox()
                                    : Center(
                                  child: IconButton(
                                    icon: Icon(
                                      videoplayerController!
                                          .value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (videoplayerController!
                                            .value.isPlaying) {
                                          videoplayerController!
                                              .pause();
                                        } else {
                                          videoplayerController!
                                              .play();
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                              child: WhiteSpinkitFlutter.spinkit);
                        }
                      },
                    ),
                    isclick == false
                        ? SizedBox()
                        : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:
                        EdgeInsets.only(bottom: height * 0.15),
                        child: SizedBox(
                          height: height * 0.1,
                          width: width * 0.9,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.videooo.videoName
                                          .toString(),
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow:
                                      TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: height * 0.04),
                                    ),
                                    Text(
                                      widget
                                          .videooo.videoDescription
                                          .toString(),
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow:
                                      TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: height * 0.03,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: width * 0.18,
                                  width: height,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Container(
                                        height: width * 0.04,
                                        width: height * 0.07,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: const Center(
                                            child: Image(
                                                image: AssetImage(
                                                    "images/music (2).png"))),
                                      ),
                                      Container(
                                        height: width * 0.04,
                                        width: height * 0.07,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: const Center(
                                            child: Image(
                                                image: AssetImage(
                                                    "images/subtitle.png"))),
                                      ),
                                      Container(
                                        height: width * 0.04,
                                        width: height * 0.07,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: const Center(
                                            child: Image(
                                                image: AssetImage(
                                                    "images/settings_24px.png"))),
                                      ),
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            videoplayerController!.pause();
                                          },
                                          child: Container(
                                            height: width * 0.045,
                                            width: height * 0.25,
                                            decoration:
                                            BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius
                                                  .circular(50),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "End workout",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    isclick == false
                        ? SizedBox()
                        : Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: width * 0.9,
                        height: height * 0.1,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                time.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: VideoProgressIndicator(
                                colors: VideoProgressColors(playedColor: Colors.white),
                                videoplayerController!,
                                allowScrubbing: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ],
        );
      }),
    );
  }
}
