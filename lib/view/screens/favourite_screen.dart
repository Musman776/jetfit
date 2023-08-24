import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/controllers/dahboard_controller.dart';
import 'package:jetfit/controllers/favourite_controller.dart';
import 'package:jetfit/controllers/training_controller.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/utilis/static_data.dart';
import 'package:get/get.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/view/screens/home01/home01_controller.dart';
import 'package:jetfit/view/screens/home01/home_01.dart';
import 'package:jetfit/view/screens/trainigng_screen.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';
import 'package:video_player/video_player.dart';

import '../../web_view/home_screen/dashboard_screen/dashboard_controller.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  var height, width;

  @override
  void initState() {
    Get.put(DashBoardController());
    Get.put(TrainingController());
    Get.put(FavouriteController());
    FavouriteController.my.isclick = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MyThemeData.background,
        body: GetBuilder<FavouriteController>(builder: (obj) {
          return OrientationBuilder(builder: (context, orientation) {
            return InkWell(
              onTap: () {
                obj.isclick = false;
                obj.update();
              },
              child: SizedBox(
                height: height,
                width: width,
                child: Stack(
                  children: [
                    Container(
                      height: height,
                      width: width,
                      color: MyThemeData.background,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height! * 0.05,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.12),
                              child: Text(
                                "Favorites",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        orientation == Orientation.portrait
                                            ? width * 0.05
                                            : width * 0.03),
                              ),
                            ),
                            StreamBuilder<QuerySnapshot>(
                                stream: firebaseFirestore
                                    .collection("Favourite")
                                    .doc(Staticdata.uid)
                                    .collection("UserFavourites")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return snapshot.data == null
                                        ? Expanded(
                                            child: Center(
                                              child:
                                                  WhiteSpinkitFlutter.spinkit,
                                            ),
                                          )
                                        : snapshot.data!.docs.isEmpty
                                            ? Expanded(
                                                child: const Center(
                                                    child:
                                                        Text("No Favourites")),
                                              )
                                            : Expanded(
                                                child: SizedBox(
                                                  height: height,
                                                  width: width,
                                                  child: Padding(
                                                      padding: orientation ==
                                                              Orientation
                                                                  .portrait
                                                          ? const EdgeInsets
                                                              .all(8.0)
                                                          : EdgeInsets.only(
                                                              left: width! *
                                                                  0.12),
                                                      child:
                                                          orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? InkWell(
                                                                  onTap: () {
                                                                    // DashBoardController
                                                                    //     .my
                                                                    //     .index = 6;
                                                                    // DashBoardController
                                                                    //     .my
                                                                    //     .update();

                                                                    // DashBoardController
                                                                    //     .my
                                                                    //     .index = 2;
                                                                  },
                                                                  child: GridView
                                                                      .builder(
                                                                    itemCount: snapshot
                                                                        .data!
                                                                        .docs
                                                                        .length,
                                                                    gridDelegate:
                                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          2,
                                                                      crossAxisSpacing:
                                                                          10,
                                                                      mainAxisSpacing:
                                                                          3,
                                                                    ),
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      PlayListModel
                                                                          playListModel =
                                                                          PlayListModel(
                                                                        classType: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('classType'),
                                                                        categoryID: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('categoryID'),
                                                                        dificulty: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('dificulty'),
                                                                        duration: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('duration'),
                                                                        instructor: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('instructor'),
                                                                        videoDescription: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('videoDescription'),
                                                                        videoID: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('videoID'),
                                                                        videoLanguage: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('videoLanguage'),
                                                                        videoName: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('videoName'),
                                                                        videoURL: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('videoURL'),
                                                                        viewers: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get('viewers'),
                                                                      );

                                                                      return SizedBox(
                                                                        height:
                                                                            height,
                                                                        width:
                                                                            width,
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Card(
                                                                              elevation: 5,
                                                                              color: MyThemeData.background,
                                                                              shadowColor: MyThemeData.onSurface,
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                              child: Container(
                                                                                height: height! * 0.13,
                                                                                width: width,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                child: FavouriteVideoPlayer(playListModel: playListModel),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Text(
                                                                                playListModel.videoName!,
                                                                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                left: 8,
                                                                                top: 2,
                                                                                right: 8,
                                                                              ),
                                                                              child: Text(
                                                                                playListModel.duration!,
                                                                                style: TextStyle(color: MyThemeData.onSurface),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                )
                                                              : InkWell(
                                                                  onTap: () {
                                                                    // DashBoardController
                                                                    //     .my
                                                                    //     .index = 6;
                                                                    // DashBoardController
                                                                    //     .my
                                                                    //     .update();

                                                                    // DashBoardController
                                                                    //     .my
                                                                    //     .index = 2;
                                                                  },
                                                                  child: GridView
                                                                      .builder(
                                                                    shrinkWrap:
                                                                        true,
                                                                    primary:
                                                                        false,
                                                                    gridDelegate:
                                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisSpacing:
                                                                          27,
                                                                      mainAxisSpacing:
                                                                          1,
                                                                      crossAxisCount:
                                                                          3,
                                                                    ),
                                                                    itemCount: snapshot
                                                                        .data!
                                                                        .docs
                                                                        .length,
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                context,
                                                                            index) {
                                                                      PlayListModel
                                                                          playListModel =
                                                                          PlayListModel(
                                                                        classType: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("classType"),
                                                                        categoryID: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("categoryID"),
                                                                        dificulty: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("dificulty"),
                                                                        duration: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("duration"),
                                                                        instructor: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("instructor"),
                                                                        videoDescription: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("videoDescription"),
                                                                        videoID: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("videoID"),
                                                                        videoLanguage: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("videoLanguage"),
                                                                        videoName: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("videoName"),
                                                                        videoURL: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("videoURL"),
                                                                        viewers: snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .get("viewers"),
                                                                      );

                                                                      return Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Card(
                                                                            elevation:
                                                                                5,
                                                                            shadowColor:
                                                                                MyThemeData.onSurface,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              height: height! * 0.27,
                                                                              width: width! * 0.5,
                                                                              decoration: BoxDecoration(
                                                                                color: MyThemeData.background,
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              child: FavouriteVideoPlayer(playListModel: playListModel),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            playListModel.videoName!,
                                                                            style:
                                                                                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            '${playListModel.duration} | intensity *',
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.grey,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                )),
                                                ),
                                              );
                                  } else if (snapshot.hasError) {
                                    return Expanded(
                                        child:
                                            Text('Error: ${snapshot.error}'));
                                  } else {
                                    return Expanded(
                                      child: Center(
                                        child: WhiteSpinkitFlutter.spinkit,
                                      ),
                                    );
                                  }
                                }),
                            orientation == Orientation.portrait
                                ? SizedBox(
                                    height: height! * 0.08,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    ///////////sort
                    ///
                    obj.isclick
                        ? InkWell(
                            onTap: () {
                              obj.isclick = false;
                              obj.update();
                            },
                            child: Container(
                              height: height,
                              width: width,
                              color: MyThemeData.background.withOpacity(0.3),
                            ),
                          )
                        : const SizedBox(),
                    obj.isclick
                        ? Align(
                            alignment: Alignment.center,
                            child: orientation == Orientation.portrait
                                ? Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 5,
                                    shadowColor: MyThemeData.background,
                                    child: Container(
                                      height: height! * 0.6,
                                      width: width! * 0.75,
                                      decoration: BoxDecoration(
                                          color: MyThemeData.surfaceVarient,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Container(
                                            height: height * 0.35,
                                            width: width,
                                            decoration: BoxDecoration(
                                                // image: DecorationImage(
                                                //   fit: BoxFit.cover,
                                                //   image: AssetImage(Staticdata
                                                //       .challengemodel!.image
                                                //       .toString()),
                                                // ),
                                                color:
                                                    MyThemeData.surfaceVarient,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TrainingCoverVideo(
                                                playListModel:
                                                    obj.playListModel),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: height * 0.33,
                                              width: width * 0.65,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    obj.playListModel
                                                        .videoName!,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '${obj.playListModel.duration} | intensity ***',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    obj.playListModel
                                                        .videoDescription!,
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        // DashBoardController.my.index =
                                                        //     8;
                                                        // DashBoardController.my
                                                        //     .update();
                                                        // DashBoardController.my.index =
                                                        //     3;

                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomeVideoPlayerScreen(
                                                              videooo: obj
                                                                  .playListModel,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: height * 0.045,
                                                        width: width * 0.3,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Image(
                                                              image: AssetImage(
                                                                  'images/training/play_arrow_24px.png'),
                                                            ),
                                                            Text(
                                                              "Start video",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      obj.removetofavourite(
                                                          obj.playListModel);
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        height: height * 0.045,
                                                        width: width * 0.45,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .heart_broken,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            Text(
                                                              "Remove to favorites",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                          ],
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
                                  )
                                : Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 10,
                                    shadowColor: MyThemeData.background,
                                    child: Container(
                                      height: height! * 0.9,
                                      width: width! * 0.4,
                                      decoration: BoxDecoration(
                                          color: MyThemeData.surfaceVarient,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            height: height! * 0.02,
                                          ),
                                          SizedBox(
                                            height: height! * 0.4,
                                            width: width,
                                            child: TrainingCoverVideo(
                                                playListModel:
                                                    obj.playListModel),
                                            // child: Image(
                                            //   fit: BoxFit.cover,
                                            //   image: AssetImage(Staticdata
                                            //       .challengemodel!.image
                                            //       .toString()),
                                            // ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: height * 0.63,
                                              width: width * 0.35,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    obj.playListModel.videoName
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.026,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '${obj.playListModel.duration} | intensity ***',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    obj.playListModel
                                                        .videoDescription
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        // DashBoardController
                                                        //     .my.index = 8;
                                                        // DashBoardController.my
                                                        //     .update();

                                                        // DashBoardController
                                                        //     .my.index = 3;
                                                      },
                                                      child: Container(
                                                        height: height * 0.08,
                                                        width: width * 0.25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Image(
                                                              image: AssetImage(
                                                                  'images/training/play_arrow_24px.png'),
                                                            ),
                                                            Text(
                                                              "Start workout",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      obj.removetofavourite(
                                                          obj.playListModel);
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        height: height * 0.08,
                                                        width: width * 0.25,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Image(
                                                              image: AssetImage(
                                                                  'images/training/heart.png'),
                                                            ),
                                                            Text(
                                                              "Remove to favorites",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                          ],
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
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            );
          });
        }));
  }
}

class FavouriteVideoPlayer extends StatefulWidget {
  final PlayListModel playListModel;

  const FavouriteVideoPlayer({super.key, required this.playListModel});

  @override
  _FavouriteVideoPlayerState createState() => _FavouriteVideoPlayerState();
}

class _FavouriteVideoPlayerState extends State<FavouriteVideoPlayer> {
  VideoPlayerController? _videoPlayerController;
  Future<void>? _initializeVideoPlayerFuture;
  bool _isVideoPlaying = false;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    Get.put(Home01Controller());
    Get.put(FavouriteController());
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.playListModel.videoURL!));
    _initializeVideoPlayerFuture =
        _videoPlayerController!.initialize().then((_) {
      setState(
          () {}); // Ensure the player is initialized before calling setState
    });
    _videoPlayerController!.addListener(_videoPlayerListener);
  }

  void _videoPlayerListener() {
    if (_videoPlayerController!.value.isPlaying) {
      setState(() {
        _isVideoPlaying = true;
      });
    } else {
      setState(() {
        _isVideoPlaying = false;
      });
    }
  }

  Widget lableTextname(String title) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.015, bottom: height * 0.01),
      child: Text(
        title,
        style: TextStyle(
            color: MyThemeData.background, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _disposeControllers() {
    _videoPlayerController!.dispose();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(
                    _videoPlayerController!,
                  ),
                  if (!_isVideoPlaying)
                    Center(
                      child: InkWell(
                        onTap: () {
                          FavouriteController.my
                              .videoclickModel(widget.playListModel);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => HomeVideoPlayerScreen(
                          //       videooo: widget.playListModel,
                          //     ),
                          //   ),
                          // );
                        },
                        child: const Icon(
                          Icons.play_arrow,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  //   Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: Container(
                  //       height: height * 0.03,
                  //       width: width * 0.05,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         color: Colors.black,
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           '${_videoPlayerController!.value.position.inMinutes}:${(_videoPlayerController!.value.position.inSeconds % 60).toString().padLeft(2, '0')} / ${_videoPlayerController!.value.duration.inMinutes}:${(_videoPlayerController!.value.duration.inSeconds % 60).toString().padLeft(2, '0')}',
                  //           style:
                  //               const TextStyle(color: Colors.white, fontSize: 12),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox(
            width: width * 0.1,
            height: height * 0.12,
            child: Center(
              child: WhiteSpinkitFlutter.spinkit,
            ),
          );
        }
      },
    );
  }
}
