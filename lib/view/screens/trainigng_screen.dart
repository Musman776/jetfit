import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/controllers/dahboard_controller.dart';
import 'package:jetfit/controllers/training_controller.dart';
import 'package:jetfit/utilis/static_data.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:get/get.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/view/challenge/challenge_screen.dart';
import 'package:jetfit/view/screens/challenge_tabs.dart';
import 'package:jetfit/view/screens/home01/home01_controller.dart';
import 'package:jetfit/view/screens/home01/home_01.dart';
import 'package:jetfit/web_view/home_screen/dashboard_screen/dashboard_controller.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';
import 'package:video_player/video_player.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MyThemeData.background,
        body: OrientationBuilder(builder: (context, orientation) {
          return GetBuilder<TrainingController>(initState: (state) {
            Get.put(TrainingController());
            Get.put(DashboardController());
            TrainingController.to.isFilterOpen = false;
            TrainingController.to.isSortOpen = false;
            TrainingController.to.isclick = false;
            DashboardController.to.getcataories();
            TrainingController.to.fetchplaylistmodel();
            Get.put(DashBoardController());
          }, builder: (obj) {
            return SizedBox(
              height: height,
              width: width,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      obj.sortFilter(false);
                      obj.openFilter(false);
                    },
                    child: Container(
                      height: height,
                      width: width,
                      color: MyThemeData.background,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: height! * 0.05,
                              ),
                              orientation == Orientation.portrait
                                  ? const SizedBox()
                                  : SizedBox(
                                height: height! * 0.1,
                                // color: Colors.red,
                                width: width,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width! * 0.12,
                                    ),
                                    obj.index == 0
                                        ? Container(
                                      height: height,
                                      width: width! * 0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: MyThemeData
                                              .onBackground,
                                          borderRadius:
                                          BorderRadius.circular(
                                              50)),
                                      child: const Text("Workout"),
                                    )
                                        : Padding(
                                      padding: EdgeInsets.only(
                                          left: width! * 0.01,
                                          right: width! * 0.01),
                                      child: Center(
                                          child: InkWell(
                                              onTap: () {
                                                obj.changePage(0);
                                              },
                                              child: const Text(
                                                "Workout",
                                                style: TextStyle(
                                                    color:
                                                    Colors.white),
                                              ))),
                                    ),
                                    obj.index == 1
                                        ? Container(
                                      height: height,
                                      width: width! * 0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: MyThemeData
                                              .onBackground,
                                          borderRadius:
                                          BorderRadius.circular(
                                              50)),
                                      child: const Text("Series"),
                                    )
                                        : Padding(
                                      padding: EdgeInsets.only(
                                          left: width! * 0.01,
                                          right: width! * 0.01),
                                      child: Center(
                                          child: InkWell(
                                              onTap: () {
                                                obj.changePage(1);
                                              },
                                              child: const Text(
                                                "Series",
                                                style: TextStyle(
                                                    color:
                                                    Colors.white),
                                              ))),
                                    ),
                                    obj.index == 2
                                        ? Container(
                                      height: height,
                                      width: width! * 0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: MyThemeData
                                              .onBackground,
                                          borderRadius:
                                          BorderRadius.circular(
                                              50)),
                                      child: const Text("Challenges"),
                                    )
                                        : Padding(
                                      padding: EdgeInsets.only(
                                          left: width! * 0.01,
                                          right: width! * 0.01),
                                      child: Center(
                                          child: InkWell(
                                              onTap: () {
                                                obj.changePage(2);
                                                DashBoardController
                                                    .my.index = 6;
                                                DashBoardController.my
                                                    .update();

                                                DashBoardController
                                                    .my.index = 2;
                                              },
                                              child: const Text(
                                                "Challenges",
                                                style: TextStyle(
                                                    color:
                                                    Colors.white),
                                              ))),
                                    ),
                                    obj.index == 3
                                        ? Container(
                                      height: height,
                                      width: width! * 0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: MyThemeData
                                              .onBackground,
                                          borderRadius:
                                          BorderRadius.circular(
                                              50)),
                                      child: const Text("Routines"),
                                    )
                                        : Padding(
                                      padding: EdgeInsets.only(
                                          left: width! * 0.01,
                                          right: width! * 0.01),
                                      child: Center(
                                          child: InkWell(
                                              onTap: () {
                                                obj.changePage(3);
                                              },
                                              child: const Text(
                                                "Routines",
                                                style: TextStyle(
                                                    color:
                                                    Colors.white),
                                              ))),
                                    ),
                                    SizedBox(
                                      width: width! * 0.4,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              obj.openFilter(false);
                                              obj.isSortOpen
                                                  ? obj.sortFilter(false)
                                                  : obj.sortFilter(true);
                                            },
                                            child: Container(
                                              height: height,
                                              width: width! * 0.16,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: MyThemeData
                                                          .onSurface),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      16)),
                                              child: Text(
                                                "Sort By: Newest",
                                                style: TextStyle(
                                                    color: MyThemeData
                                                        .onSurfaceVarient),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              obj.sortFilter(false);
                                              obj.isFilterOpen
                                                  ? obj.openFilter(false)
                                                  : obj.openFilter(true);
                                            },
                                            child: Container(
                                              height: height,
                                              width: width! * 0.12,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: MyThemeData
                                                          .onSurface),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      16)),
                                              child: Text(
                                                "Filters",
                                                style: TextStyle(
                                                    color: MyThemeData
                                                        .onSurfaceVarient),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              orientation == Orientation.portrait
                                  ? SizedBox(
                                height: height! * 0.05,
                                width: width,
                                child: Row(
                                  children: [
                                    obj.index == 0
                                        ? Container(
                                      height: height,
                                      width: width! * 0.2,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: MyThemeData
                                              .onBackground,
                                          borderRadius:
                                          BorderRadius.circular(
                                              16)),
                                      child: const Text("Workout"),
                                    )
                                        : Padding(
                                      padding: EdgeInsets.only(
                                          left: width! * 0.02,
                                          right: width! * 0.02),
                                      child: Center(
                                          child: InkWell(
                                              onTap: () {
                                                obj.changePage(0);
                                              },
                                              child: const Text(
                                                "Workout",
                                                style: TextStyle(
                                                    color:
                                                    Colors.white),
                                              ))),
                                    ),
                                    obj.index == 1
                                        ? Container(
                                      height: height,
                                      width: width! * 0.2,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: MyThemeData
                                              .onBackground,
                                          borderRadius:
                                          BorderRadius.circular(
                                              16)),
                                      child: const Text("Series"),
                                    )
                                        : Padding(
                                      padding: EdgeInsets.only(
                                          left: width! * 0.02,
                                          right: width! * 0.02),
                                      child: Center(
                                          child: InkWell(
                                              onTap: () {
                                                obj.changePage(1);
                                              },
                                              child: const Text(
                                                "Series",
                                                style: TextStyle(
                                                    color:
                                                    Colors.white),
                                              ))),
                                    ),
                                    obj.index == 2
                                        ? InkWell(
                                      onTap: () {
                                        DashBoardController.my.index =
                                        6;
                                        DashBoardController.my
                                            .update();

                                        DashBoardController.my.index =
                                        2;
                                      },
                                      child: Container(
                                        height: height,
                                        width: width! * 0.2,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: MyThemeData
                                                .onBackground,
                                            borderRadius:
                                            BorderRadius.circular(
                                                16)),
                                        child:
                                        const Text("Challenges"),
                                      ),
                                    )
                                        : Padding(
                                      padding: EdgeInsets.only(
                                          left: width! * 0.02,
                                          right: width! * 0.02),
                                      child: Center(
                                          child: InkWell(
                                              onTap: () {
                                                obj.changePage(2);
                                                DashBoardController
                                                    .my.index = 6;
                                                DashBoardController.my
                                                    .update();

                                                DashBoardController
                                                    .my.index = 2;
                                              },
                                              child: const Text(
                                                "Challenges",
                                                style: TextStyle(
                                                    color:
                                                    Colors.white),
                                              ))),
                                    ),
                                    obj.index == 3
                                        ? Container(
                                      height: height,
                                      width: width! * 0.2,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: MyThemeData
                                              .onBackground,
                                          borderRadius:
                                          BorderRadius.circular(
                                              16)),
                                      child: const Text("Routines"),
                                    )
                                        : Padding(
                                      padding: EdgeInsets.only(
                                          left: width! * 0.02,
                                          right: width! * 0.02),
                                      child: Center(
                                          child: InkWell(
                                              onTap: () {
                                                obj.changePage(3);
                                              },
                                              child: const Text(
                                                "Routines",
                                                style: TextStyle(
                                                    color:
                                                    Colors.white),
                                              ))),
                                    ),
                                  ],
                                ),
                              )
                                  : const SizedBox(),
                              SizedBox(
                                height: orientation == Orientation.portrait
                                    ? height! * 0.02
                                    : 0,
                              ),
                              orientation == Orientation.portrait
                                  ? SizedBox(
                                height: height! * 0.05,
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        obj.openFilter(false);
                                        obj.isSortOpen
                                            ? obj.sortFilter(false)
                                            : obj.sortFilter(true);
                                      },
                                      child: Container(
                                        height: height,
                                        width: width! * 0.4,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                MyThemeData.onSurface),
                                            borderRadius:
                                            BorderRadius.circular(16)),
                                        child: Text(
                                          "Sort By: Newest",
                                          style: TextStyle(
                                              color: MyThemeData
                                                  .onSurfaceVarient),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width! * 0.02,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        obj.sortFilter(false);
                                        obj.isFilterOpen
                                            ? obj.openFilter(false)
                                            : obj.openFilter(true);
                                      },
                                      child: Container(
                                        height: height,
                                        width: width! * 0.2,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                MyThemeData.onSurface),
                                            borderRadius:
                                            BorderRadius.circular(16)),
                                        child: Text(
                                          "Filters",
                                          style: TextStyle(
                                              color: MyThemeData
                                                  .onSurfaceVarient),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  : const SizedBox(),
                              SizedBox(
                                height: orientation == Orientation.portrait
                                    ? height! * 0.02
                                    : 0,
                              ),

                              StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("category")
                            .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                width: width,
                                height: height,
                                color: Colors.black.withOpacity(0.1),
                                child: Center(
                                  child: SpinkitFlutter.spinkit,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return Container();
                              // return Center(
                              //     child: Text("No Categories"));
                            } else {
                              final filteredDocuments = snapshot
                                  .data!.docs
                                  .where((doc) =>
                              doc['categoryType'] == obj.category[obj.index])
                                  .toList();

                              if (filteredDocuments.isEmpty) {
                                // return Center(
                                //     child: Text("No Categories"));
                                return Container();
                              }

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  key: UniqueKey(),
                                  shrinkWrap: true,
                                  itemCount: filteredDocuments.length,
                                  gridDelegate:
                                  orientation == Orientation.portrait
                                  ?SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount  : 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 2,
                                  )
                                      :SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 27,
                                    mainAxisSpacing: 1,
                                    crossAxisCount: 3,
                                  ),
                                  itemBuilder: (context, index) {
                                    CategoryModel model = CategoryModel(
                                      categoryDescription:
                                      filteredDocuments[index].get(
                                          "categoryDescription"),
                                      categoryID:
                                      filteredDocuments[index]
                                          .get("categoryID"),
                                      categoryName:
                                      filteredDocuments[index]
                                          .get("categoryName"),
                                      categoryType:
                                      filteredDocuments[index]
                                          .get("categoryType"),
                                      thumbnailimageURL:
                                      filteredDocuments[index]
                                          .get("thumbnailimageURL"),
                                      categoryTimeline:
                                      filteredDocuments[index]
                                          .get("categoryTimeline"),
                                      playlistType:
                                      filteredDocuments[index]
                                          .get("playlistType"),
                                    );

                                    return Stack(
                                      children: [
                                        SizedBox(
                                          height: orientation==Orientation.portrait?height :width,
                                          width: orientation==Orientation.portrait?width:height,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => ChallengeTabsScreen(modal: model,)));
                                                },
                                                child: Card(
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
                                                  child:
                                                  Container(
                                                    height: orientation==Orientation.portrait? height! * 0.13 : height! *0.27,
                                                    width : orientation==Orientation.portrait? width : width! * 0.5,
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
                                                      image:
                                                      DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image:
                                                        NetworkImage(
                                                          model
                                                              .thumbnailimageURL!,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child:
                                                      StreamBuilder<QuerySnapshot>(
                                                          stream: FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                              'category')
                                                              .doc(model
                                                              .categoryID)
                                                              .collection(
                                                              'playlist')
                                                              .snapshots(),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              return Container(
                                                                height:
                                                                height *
                                                                    0.03,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  borderRadius: BorderRadius.only(
                                                                      bottomLeft:
                                                                      Radius.circular(10),
                                                                      bottomRight: Radius.circular(10)),
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.end,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsets.only(right: 12),
                                                                      child:
                                                                      Text(
                                                                        '${snapshot.data!.docs.length ?? 0} videos',
                                                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                            } else {
                                                              return Center(
                                                                child: SpinkitFlutter
                                                                    .spinkit,
                                                              );
                                                            }
                                                          }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                model.categoryName!,
                                                style: TextStyle(
                                                    color: MyThemeData
                                                        .whitecolor,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                              ),
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                '${model.categoryDescription} | intensity *',
                                                style: TextStyle(
                                                    color: MyThemeData
                                                        .whitecolor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            }
                          }),
                              ///////////// videos gettt
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection("videos")
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: width,
                                        height: height,
                                        color: Colors.black.withOpacity(0.1),
                                        child: Center(
                                          child: SpinkitFlutter.spinkit,
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.docs.isEmpty) {
                                      return Container();
                                      // return Center(
                                      //     child: Text("No Categories"));
                                    } else {
                                      final filteredDocuments = snapshot
                                          .data!.docs
                                          .where((doc) =>
                                      doc['catagorytpe'] ==
                                          obj.category[obj.index])
                                          .toList();

                                      if (filteredDocuments.isEmpty) {
                                        // return Center(
                                        //     child: Text("No Categories"));
                                        return Container();
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GridView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          key: UniqueKey(),
                                          shrinkWrap: true,
                                          itemCount: filteredDocuments.length,
                                          gridDelegate:
                                           SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: orientation == Orientation.portrait?2 : 3,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 3,
                                          ),
                                          itemBuilder: (context, index) {
                                            VideossModel model = VideossModel(
                                              catagorytpe:
                                              filteredDocuments[index]
                                                  .get("catagorytpe"),
                                              classType:
                                              filteredDocuments[index]
                                                  .get("classType"),
                                              dificulty:
                                              filteredDocuments[index]
                                                  .get("dificulty"),
                                              duration: filteredDocuments[index]
                                                  .get("duration"),
                                              instructor:
                                              filteredDocuments[index]
                                                  .get("instructor"),
                                              videoDescription:
                                              filteredDocuments[index]
                                                  .get("videoDescription"),
                                              videoID: filteredDocuments[index]
                                                  .get("videoID"),
                                              videoLanguage:
                                              filteredDocuments[index]
                                                  .get("videoLanguage"),
                                              videoName:
                                              filteredDocuments[index]
                                                  .get("videoName"),
                                              videoURL: filteredDocuments[index]
                                                  .get("videoURL"),
                                              videotype:
                                              filteredDocuments[index]
                                                  .get("videotype"),
                                              viewers: filteredDocuments[index]
                                                  .get("viewers"),
                                            );

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
                                                                        categoryID: model.catagorytpe,
                                                                        classType: model.classType,
                                                                        dificulty: model.dificulty,
                                                                        instructor: model.instructor,
                                                                        videoDescription: model.videoDescription,
                                                                        videoID: model.videoID,
                                                                        videoLanguage: model.videoLanguage,
                                                                        videoName: model.videoName,
                                                                        viewers:model.viewers
                                                                    )),));
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
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  }),
                              orientation == Orientation.portrait
                                  ? SizedBox(
                                height:orientation==Orientation.portrait? height! * 0.08 :width*0.08
                              )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  obj.isFilterOpen
                      ? Padding(
                    padding: EdgeInsets.only(
                        bottom: orientation == Orientation.portrait
                            ? height! * 0.1
                            : 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: orientation == Orientation.portrait
                          ? Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10)),
                        elevation: 10,
                        shadowColor: MyThemeData.onSurface,
                        child: Container(
                          height: height! * 0.5,
                          width: width! * 0.6,
                          decoration: BoxDecoration(
                              color: MyThemeData.surfaceVarient,
                              borderRadius:
                              BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height! * 0.05,
                                  width: width,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "Sort by",
                                        style: TextStyle(
                                            fontSize: width! * 0.05,
                                            color: Colors.white,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                      Container(
                                        height: height,
                                        width: width! * 0.15,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                            MyThemeData.outline,
                                            borderRadius:
                                            BorderRadius
                                                .circular(30)),
                                        child: const Text(
                                          "Reset",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 0.03,
                                ),
                                Container(
                                  height: height! * 0.05,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      color:
                                      MyThemeData.onBackground),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        const Text(
                                          "Newest",
                                        ),
                                        Container(
                                            height: height,
                                            width: width! * 0.15,
                                            alignment:
                                            Alignment.center,
                                            child: Radio(
                                              value: true,
                                              fillColor:
                                              MaterialStateColor
                                                  .resolveWith(
                                                      (states) =>
                                                  Colors
                                                      .green),
                                              activeColor:
                                              Colors.green,
                                              groupValue:
                                              "filtervalue",
                                              onChanged: (value) {
                                                print(value);
                                                //  obj.filterChange(value);
                                              },
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 0.01,
                                ),
                                SizedBox(
                                  height: height! * 0.05,
                                  width: width,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        const Text(
                                          "Easiest",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                              MyThemeData
                                                  .onSurface),
                                          child: Container(
                                              height: height,
                                              width: width! * 0.15,
                                              alignment:
                                              Alignment.center,
                                              child: Radio(
                                                value: true,
                                                activeColor:
                                                Colors.green,
                                                groupValue:
                                                "filtervalue",
                                                onChanged: (value) {
                                                  print(value);
                                                  //  obj.filterChange(value);
                                                },
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 0.01,
                                ),
                                SizedBox(
                                  height: height! * 0.05,
                                  width: width,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        const Text(
                                          "Hardest",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                              MyThemeData
                                                  .onSurface),
                                          child: Container(
                                              height: height,
                                              width: width! * 0.15,
                                              alignment:
                                              Alignment.center,
                                              child: Radio(
                                                value: true,
                                                activeColor:
                                                Colors.green,
                                                groupValue:
                                                "filtervalue",
                                                onChanged: (value) {
                                                  print(value);
                                                  //  obj.filterChange(value);
                                                },
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 0.01,
                                ),
                                SizedBox(
                                  height: height! * 0.05,
                                  width: width,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        const Text(
                                          "Shortest",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                              MyThemeData
                                                  .onSurface),
                                          child: Container(
                                              height: height,
                                              width: width! * 0.15,
                                              alignment:
                                              Alignment.center,
                                              child: Radio(
                                                value: true,
                                                activeColor:
                                                Colors.green,
                                                groupValue:
                                                "filtervalue",
                                                onChanged: (value) {
                                                  print(value);
                                                  //  obj.filterChange(value);
                                                },
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 0.01,
                                ),
                                SizedBox(
                                  height: height! * 0.05,
                                  width: width,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        const Text(
                                          "Longest",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                              MyThemeData
                                                  .onSurface),
                                          child: Container(
                                              height: height,
                                              width: width! * 0.15,
                                              alignment:
                                              Alignment.center,
                                              child: Radio(
                                                value: true,
                                                activeColor:
                                                Colors.green,
                                                groupValue:
                                                "filtervalue",
                                                onChanged: (value) {
                                                  print(value);
                                                  //  obj.filterChange(value);
                                                },
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                          : Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10)),
                        elevation: 10,
                        shadowColor: MyThemeData.onSurface,
                        child: Container(
                          height: height!,
                          width: width! * 0.4,
                          decoration: BoxDecoration(
                            color: MyThemeData.surfaceVarient,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: height! * 0.07,
                                  width: width,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "Sort by",
                                        style: TextStyle(
                                            fontSize: width! * 0.02,
                                            color: Colors.white,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                      Container(
                                        height: height,
                                        width: width! * 0.15,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                            MyThemeData.outline,
                                            borderRadius:
                                            BorderRadius
                                                .circular(30)),
                                        child: const Text(
                                          "Reset",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 0.02,
                                ),
                                Container(
                                  height: height! * 0.12,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      color:
                                      MyThemeData.onBackground),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: width! * 0.05),
                                        const Text(
                                          "Newest",
                                        ),
                                        SizedBox(
                                            width: width! * 0.13),
                                        Container(
                                            height: height,
                                            width: width! * 0.1,
                                            alignment:
                                            Alignment.center,
                                            child: Radio(
                                              value: true,
                                              fillColor:
                                              MaterialStateColor
                                                  .resolveWith(
                                                      (states) =>
                                                  Colors
                                                      .green),
                                              activeColor:
                                              Colors.green,
                                              groupValue:
                                              "filtervalue",
                                              onChanged: (value) {
                                                print(value);
                                                //  obj.filterChange(value);
                                              },
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 0.02,
                                ),
                                //////////////////
                                Container(
                                  height: height! * 0.12,
                                  width: width,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: width! * 0.05),
                                        const Text(
                                          "Easiest",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width! * 0.13,
                                        ),
                                        Container(
                                          height: height,
                                          width: width! * 0.11,
                                          alignment:
                                          Alignment.center,
                                          child: Radio(
                                            value: true,
                                            fillColor:
                                            MaterialStateColor
                                                .resolveWith(
                                                  (states) =>
                                              Colors.white,
                                            ),
                                            activeColor:
                                            Colors.white,
                                            groupValue:
                                            "filtervalue",
                                            onChanged: (value) {
                                              print(value);
                                              //  obj.filterChange(value);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height! * 0.12,
                                  width: width,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: width! * 0.05),
                                        const Text(
                                          "Hardest",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width! * 0.13,
                                        ),
                                        Container(
                                          height: height,
                                          width: width! * 0.1,
                                          alignment:
                                          Alignment.center,
                                          child: Radio(
                                            value: true,
                                            fillColor:
                                            MaterialStateColor
                                                .resolveWith(
                                                  (states) =>
                                              Colors.white,
                                            ),
                                            activeColor:
                                            Colors.white,
                                            groupValue:
                                            "filtervalue",
                                            onChanged: (value) {
                                              print(value);
                                              //  obj.filterChange(value);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Container(
                                  height: height! * 0.12,
                                  width: width,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: width! * 0.05),
                                        const Text(
                                          "Shortest",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width! * 0.13,
                                        ),
                                        Container(
                                          height: height,
                                          width: width! * 0.09,
                                          alignment:
                                          Alignment.center,
                                          child: Radio(
                                            value: true,
                                            fillColor:
                                            MaterialStateColor
                                                .resolveWith(
                                                  (states) =>
                                              Colors.white,
                                            ),
                                            activeColor:
                                            Colors.white,
                                            groupValue:
                                            "filtervalue",
                                            onChanged: (value) {
                                              print(value);
                                              //  obj.filterChange(value);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height! * 0.12,
                                  width: width,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: width! * 0.05),
                                        const Text(
                                          "longest",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width! * 0.13,
                                        ),
                                        Container(
                                          height: height,
                                          width: width! * 0.105,
                                          alignment:
                                          Alignment.center,
                                          child: Radio(
                                            value: true,
                                            fillColor:
                                            MaterialStateColor
                                                .resolveWith(
                                                  (states) =>
                                              Colors.white,
                                            ),
                                            activeColor:
                                            Colors.white,
                                            groupValue:
                                            "filtervalue",
                                            onChanged: (value) {
                                              print(value);
                                              //  obj.filterChange(value);
                                            },
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
                    ),
                  )
                      : const SizedBox(),

                  ///////////sort
                  obj.isSortOpen
                      ? Align(
                    alignment: Alignment.centerRight,
                    child: orientation == Orientation.portrait
                        ? Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      shadowColor: MyThemeData.onSurface,
                      child: Container(
                        height: height! * 0.6,
                        width: width! * 0.6,
                        decoration: BoxDecoration(
                            color: MyThemeData.surfaceVarient,
                            borderRadius:
                            BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height! * 0.05,
                                width: width,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Filters",
                                      style: TextStyle(
                                          fontSize: width! * 0.05,
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                    Container(
                                      height: height,
                                      width: width! * 0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color:
                                          MyThemeData.outline,
                                          borderRadius:
                                          BorderRadius.circular(
                                              30)),
                                      child: const Text(
                                        "clear",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.03,
                              ),
                              Container(
                                height: height! * 0.06,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    color:
                                    MyThemeData.onBackground),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      const Icon(Icons.history),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Length",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.03,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "15-30 min",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.03,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.01,
                              ),
                              //////////////////
                              SizedBox(
                                height: height! * 0.06,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.person_3_outlined,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Instructor",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.03,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "Charlotte Aldridge",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.02,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.04,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.01,
                              ),
                              SizedBox(
                                height: height! * 0.06,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.fitness_center,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Class Type",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.03,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "Strength",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.02,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.04,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.01,
                              ),
                              SizedBox(
                                height: height! * 0.06,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.language,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Class language",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.03,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "English",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.02,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.04,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.01,
                              ),
                              SizedBox(
                                height: height! * 0.06,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.speed,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Difficulty",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.03,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "Medium",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.02,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.04,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.01,
                              ),
                              SizedBox(
                                height: height! * 0.06,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.subtitles,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Subtitles",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.03,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "Available",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.02,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.04,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.01,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                        : Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      shadowColor: MyThemeData.onSurface,
                      child: Container(
                        height: height!,
                        width: width! * 0.4,
                        decoration: BoxDecoration(
                          color: MyThemeData.surfaceVarient,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: height! * 0.07,
                                width: width,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Filters",
                                      style: TextStyle(
                                          fontSize: width! * 0.02,
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                    Container(
                                      height: height,
                                      width: width! * 0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color:
                                          MyThemeData.outline,
                                          borderRadius:
                                          BorderRadius.circular(
                                              30)),
                                      child: const Text(
                                        "clear",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.02,
                              ),
                              Container(
                                height: height! * 0.12,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    color:
                                    MyThemeData.onBackground),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.history,
                                        size: width! * 0.03,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: height,
                                          width: width!,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                "Length",
                                                style: TextStyle(
                                                    fontSize:
                                                    width! *
                                                        0.017,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                              ),
                                              Text(
                                                "15-30 min",
                                                style: TextStyle(
                                                    fontSize:
                                                    width! *
                                                        0.012,
                                                    color: Colors
                                                        .grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.02,
                              ),
                              //////////////////
                              SizedBox(
                                height: height! * 0.12,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.person_3_outlined,
                                        size: width! * 0.03,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Instructor",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.017,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "Charlotte Aldridge",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.012,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.02,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: height! * 0.12,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.fitness_center,
                                        size: width! * 0.03,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Class type",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.017,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "Strength",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.012,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.02,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: height! * 0.12,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.language,
                                        size: width! * 0.03,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Class language",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.017,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "English",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.012,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.02,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: height! * 0.12,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.speed,
                                        size: width! * 0.03,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Difficulty",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.017,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "Medium",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.012,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.02,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.12,
                                width: width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.subtitles,
                                        size: width! * 0.03,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            height: height,
                                            width: width!,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Subtitles",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.017,
                                                      color: MyThemeData
                                                          .onSurface,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                  "Available",
                                                  style: TextStyle(
                                                      fontSize:
                                                      width! *
                                                          0.012,
                                                      color: Colors
                                                          .grey),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: width! * 0.03,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: width! * 0.02,
                                        color:
                                        MyThemeData.onSurface,
                                      ),
                                      SizedBox(
                                        width: width! * 0.05,
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
                  )
                      : const SizedBox(),

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
                          borderRadius: BorderRadius.circular(10)),
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
                              height: width * 0.02,
                            ),
                            Container(
                              height:  orientation==Orientation.portrait? height * 0.35:width*0.35,
                              width: orientation==Orientation.portrait?width:height,
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //   fit: BoxFit.cover,
                                //   image: AssetImage(Staticdata
                                //       .challengemodel!.image
                                //       .toString()),
                                // ),
                                  color: MyThemeData.surfaceVarient,
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              child: TrainingCoverVideo(
                                  playListModel: obj.playListModel),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: orientation==Orientation.portrait?height * 0.33:width*0.33,
                                width: orientation==Orientation.portrait?width * 0.65:height*0.65,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      obj.playListModel.videoName!,
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
                                          height: orientation==Orientation.portrait?height * 0.045:width*0.045,
                                          width: orientation==Orientation.portrait?width * 0.3:height*0.3,
                                          decoration: BoxDecoration(
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
                                        obj.addtofavourite(
                                            obj.playListModel);
                                      },
                                      child: Center(
                                        child: Container(
                                          height:orientation==Orientation.portrait? height * 0.045:width*0.045,
                                          width: orientation==Orientation.portrait?width * 0.45:height*0.045,
                                          decoration: BoxDecoration(
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
                                                    .heart_broken_outlined,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                "Add to favorites",
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
                          borderRadius: BorderRadius.circular(20)),
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
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(Staticdata
                                    .challengemodel!.image
                                    .toString()),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: height * 0.63,
                                width: width * 0.35,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Staticdata
                                          .challengemodel!.name
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.026,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                    Text(
                                      '${Staticdata.challengemodel!.min} | intensity ***',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      
                                      Staticdata.challengemodel!
                                          .descriptiomn
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Center(
                                      child: InkWell(
                                        onTap: () {
                                          DashBoardController
                                              .my.index = 8;
                                          DashBoardController.my
                                              .update();

                                          DashBoardController
                                              .my.index = 3;
                                        },
                                        child: Container(
                                          height: height * 0.08,
                                          width: width * 0.25,
                                          decoration: BoxDecoration(
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
                                    Center(
                                      child: Container(
                                        height: height * 0.08,
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(
                                              50),
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
                                              "Add to favorites",
                                              style: TextStyle(
                                                color: Colors.grey,
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
                          ],
                        ),
                      ),
                    ),
                  )
                      : const SizedBox()
                ],
              ),
            );
          });
        }));
  }
}

class TrainingVideoPlayer extends StatefulWidget {
  final PlayListModel playListModel;

  const TrainingVideoPlayer({super.key, required this.playListModel});

  @override
  _TrainingVideoPlayerState createState() => _TrainingVideoPlayerState();
}

class _TrainingVideoPlayerState extends State<TrainingVideoPlayer> {
  VideoPlayerController? _videoPlayerController;
  Future<void>? _initializeVideoPlayerFuture;
  bool _isVideoPlaying = false;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    Get.put(Home01Controller());
    Get.put(TrainingController());
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

  @override
  void dispose() {
    _videoPlayerController!.dispose();
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
                          TrainingController.to
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

class TrainingCoverVideo extends StatefulWidget {
  final PlayListModel playListModel;

  const TrainingCoverVideo({super.key, required this.playListModel});

  @override
  _TrainingCoverVideoState createState() => _TrainingCoverVideoState();
}

class _TrainingCoverVideoState extends State<TrainingCoverVideo> {
  VideoPlayerController? _videoPlayerController;
  Future<void>? _initializeVideoPlayerFuture;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    Get.put(Home01Controller());
    Get.put(TrainingController());
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.playListModel.videoURL!));
    _initializeVideoPlayerFuture =
        _videoPlayerController!.initialize().then((_) {
          setState(
                  () {}); // Ensure the player is initialized before calling setState
        });
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
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
              child: VideoPlayer(
                _videoPlayerController!,
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



