import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/controllers/dahboard_controller.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:get/get.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/view/challenge/challenge_screen.dart';
import 'package:jetfit/view/screens/home01/home_01.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';

class ChallengeTabsScreen extends StatefulWidget {
  final CategoryModel? modal;
  const ChallengeTabsScreen({super.key, this.modal});

  @override
  State<ChallengeTabsScreen> createState() => _ChallengeTabsScreenState();
}

class _ChallengeTabsScreenState extends State<ChallengeTabsScreen> {
  var height, width;

  @override
  void initState() {
    Get.put(DashBoardController());
    super.initState();
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
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.07,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.1),
                          child: Row(
                            children: [
                              const Text(
                                "Challenge details",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              const Image(
                                image:
                                    AssetImage('images/training/arrowback.png'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.1),
                          child: Text(
                            "Weekly plan",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Week 1: Meet the basics",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Week 2: Get your footing",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Week 3: Expand your style",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Week 4: Challenge yourself",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                          child: Container(
                              height: height,
                              width: width,
                              color: MyThemeData.background,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection("category")
                                        .doc(widget.modal!.categoryID)
                                        .collection("playlist")
                                        .snapshots(),
                                    builder: (context, snapshot) {

                                      return snapshot.hasData
                                          ? snapshot.data != null
                                          ? snapshot.data!.docs.isEmpty
                                          ? const Center(child: Text("No video"),)
                                      :GridView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 3),
                                        itemBuilder: (context, index) {

                                          PlayListModel model = PlayListModel(
                                            duration: snapshot.data!.docs[index].get("duration"),
                                            classType: snapshot.data!.docs[index].get("classType"),
                                            dificulty: snapshot.data!.docs[index].get("dificulty"),
                                            instructor: snapshot.data!.docs[index].get("instructor"),
                                            videoLanguage: snapshot.data!.docs[index].get("videoLanguage"),
                                            categoryID: snapshot.data!.docs[index].get("categoryID"),
                                            videoDescription: snapshot.data!.docs[index].get("videoDescription"),
                                            videoID: snapshot.data!.docs[index].get("videoID"),
                                            videoName: snapshot.data!.docs[index].get("videoName"),
                                            videoURL: snapshot.data!.docs[index].get("videoURL"),
                                            viewers: snapshot.data!.docs[index].get("viewers"),);
                                            return Stack(
                                              children: [
                                                SizedBox(
                                                  height: height,
                                                  width: width,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Card(
                                                        elevation: 5,
                                                        color: MyThemeData
                                                            .background,
                                                        shadowColor: MyThemeData
                                                            .onSurface,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10)),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.push(context,
                                                                MaterialPageRoute(builder: (context) =>
                                                                    ChallengeScreen(videoModal: PlayListModel(
                                                                        videoURL: model.videoURL,
                                                                        duration: model.duration,
                                                                        categoryID: model.categoryID,
                                                                        classType: model.classType,
                                                                        dificulty: model.dificulty,
                                                                        instructor: model.instructor,
                                                                        videoDescription: model.videoDescription,
                                                                        videoID: model.videoID,
                                                                        videoLanguage: model.videoLanguage,
                                                                        videoName: model.videoName,
                                                                        viewers:model.viewers
                                                                    )),)
                                                            );
                                                          },
                                                          child: Container(
                                                            height: height! * 0.13,
                                                            width: width,
                                                            foregroundDecoration:
                                                            BoxDecoration(
                                                              color: Colors.black
                                                                  .withOpacity(
                                                                  0.2),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10),
                                                            ),
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10),
                                                            ),
                                                            child:
                                                            Home01VideoPlayer(
                                                              isIcon: false,
                                                              playListModel: PlayListModel(
                                                                duration: model.duration,
                                                                videoURL: model.videoURL,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(4.0),
                                                        child: Text(
                                                          model.videoName!,
                                                          style: TextStyle(
                                                              color: MyThemeData
                                                                  .whitecolor,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                      Text(
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        '${model.videoDescription} | intensity *',
                                                        style: TextStyle(
                                                            color: MyThemeData
                                                                .whitecolor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );

                                        }
                                      )
                                          : Center(child: SpinkitFlutter.spinkit,
                                      )
                                          : Center(
                                        child: SpinkitFlutter.spinkit,
                                      );
                                    }),

                              )),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                      ],
                    )


                  : Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: height * 0.07,
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Text(
                    "Weekly plan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.027,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Week 1: Meet the basics",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.017,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(50)),
                            height: height * 0.005,
                            width: width * 0.04,
                          ),
                        ],
                      ),
                      Text(
                        "Week 2: Get your footing",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.017,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Week 3: Expand your style",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.017,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Week 4: Challenge yourself",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.017,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),

                  Expanded(
                      child: SizedBox(
                        height: height * 0.7,
                        width: width,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("category")
                                .doc(widget.modal!.categoryID)
                                .collection("playlist")
                                .snapshots(),
                            builder: (context, snapshot) {

                              return snapshot.hasData
                                  ? snapshot.data != null
                                  ? snapshot.data!.docs.isEmpty
                                  ? const Center(child: Text("No video"),)
                                  :GridView.builder(
                                scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 3),
                                  itemBuilder: (context, index) {

                                    PlayListModel model = PlayListModel(
                                      duration: snapshot.data!.docs[index].get("duration"),
                                      classType: snapshot.data!.docs[index].get("classType"),
                                      dificulty: snapshot.data!.docs[index].get("dificulty"),
                                      instructor: snapshot.data!.docs[index].get("instructor"),
                                      videoLanguage: snapshot.data!.docs[index].get("videoLanguage"),
                                      categoryID: snapshot.data!.docs[index].get("categoryID"),
                                      videoDescription: snapshot.data!.docs[index].get("videoDescription"),
                                      videoID: snapshot.data!.docs[index].get("videoID"),
                                      videoName: snapshot.data!.docs[index].get("videoName"),
                                      videoURL: snapshot.data!.docs[index].get("videoURL"),
                                      viewers: snapshot.data!.docs[index].get("viewers"),);
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            height: height,
                                            width: width,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Card(
                                                  elevation: 5,
                                                  color: MyThemeData
                                                      .background,
                                                  shadowColor: MyThemeData
                                                      .onSurface,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          10)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(builder: (context) =>
                                                              ChallengeScreen(videoModal: PlayListModel(
                                                                  videoURL: model.videoURL,
                                                                  duration: model.duration,
                                                                  categoryID: model.categoryID,
                                                                  classType: model.classType,
                                                                  dificulty: model.dificulty,
                                                                  instructor: model.instructor,
                                                                  videoDescription: model.videoDescription,
                                                                  videoID: model.videoID,
                                                                  videoLanguage: model.videoLanguage,
                                                                  videoName: model.videoName,
                                                                  viewers:model.viewers
                                                              )),)
                                                      );
                                                    },
                                                    child: Container(
                                                      height: width! * 0.13,
                                                      width: height,
                                                      foregroundDecoration:
                                                      BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(
                                                            0.2),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            10),
                                                      ),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            10),
                                                      ),
                                                      child:
                                                      Home01VideoPlayer(
                                                        isIcon: false,
                                                        playListModel: PlayListModel(
                                                          duration: model.duration,
                                                          videoURL: model.videoURL,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(4.0),
                                                  child: Text(
                                                    model.videoName!,
                                                    style: TextStyle(
                                                        color: MyThemeData
                                                            .whitecolor,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  '${model.videoDescription} | intensity *',
                                                  style: TextStyle(
                                                      color: MyThemeData
                                                          .whitecolor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );

                                  }
                              )
                                  : Center(child: SpinkitFlutter.spinkit,
                              )
                                  : Center(
                                child: SpinkitFlutter.spinkit,
                              );
                            }),
                      )
                  )
                ],
              )
            ),
          ],
        );
      }),
    );
  }
}
