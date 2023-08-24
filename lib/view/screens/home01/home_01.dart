import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jetfit/controllers/dahboard_controller.dart';
import 'package:jetfit/utilis/static_data.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/view/screens/auth/login_screen.dart';
import 'package:jetfit/view/challenge/challenge_screen.dart';
import 'package:jetfit/view/screens/video_player.dart';
import 'package:jetfit/web_view/home_screen/manage_profile/manage_profile_controller.dart';
import 'package:video_player/video_player.dart';

import 'package:jetfit/view/screens/home01/home01_controller.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';
import 'package:shimmer/shimmer.dart';

class Home01Screen extends StatefulWidget {
  const Home01Screen({super.key});

  @override
  State<Home01Screen> createState() => _Home01ScreenState();
}

class _Home01ScreenState extends State<Home01Screen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var height, width;
  @override
  void initState() {
    Get.put(DashBoardController());
    Get.put(Home01Controller());
    Home01Controller.my.getcatagories();
    Home01Controller.my.getVisit();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyThemeData.background,
      body: OrientationBuilder(builder: (context, orientation) {
        Home01Controller.my.getcatagories();
        return GetBuilder<Home01Controller>(builder: (obj) {
          return orientation == Orientation.portrait
              ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.07),
                obj.value == null
                    ? Center(
                  child: Container(
                      height: height * 0.27,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IntroductionVideoPlayer()),
                )
                    : Center(
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      height: height * 0.27,
                      decoration: BoxDecoration(
                        color: const Color(0xffF9FAFB),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: width * 0.95,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: height * 0.37,
                            width: width * 0.5,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                const Text(
                                  "My J.F.amily presents ",
                                ),
                                Text(
                                  "Acrobatic Games & Artistic Family Tutorials ",
                                  style: TextStyle(
                                    color: MyThemeData.error30,
                                    fontSize: width * 0.045,
                                  ),
                                ),
                                const Text(
                                  "Die Meisterklasse für gegenseitiges Vartrauen+Balance+Teamkraft führt in die...",
                                ),
                                InkWell(
                                  onTap: () {
                                    obj.value = null;
                                    obj.update();
                                  },
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                      BorderRadius.circular(50),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'images/home/pause.png'),
                                        ),
                                        Text(
                                          "Start Intro",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.56,
                            width: width * 0.35,
                            child: const Image(
                              image: AssetImage(
                                'images/home/persons.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Staticdata.uid == null
                    ? Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.05,
                  ),
                  child: Text(
                    "Learn Fun Skills",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                    : SizedBox(),
                Staticdata.uid == null
                    ? SizedBox(
                  height:
                  height * 0.16, // Adjust the height as needed
                  child: StreamBuilder<QuerySnapshot>(
                      stream: firebaseFirestore
                          .collection("category")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data == null
                              ? Center(
                            child:
                            WhiteSpinkitFlutter.spinkit,
                          )
                              : snapshot.data!.docs.isEmpty
                              ? const Center(
                              child: Text("No Catagories"))
                              : InkWell(
                            onTap: () {
                              showtoast(
                                  "Open your new Profile");
                            },
                            child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius
                                      .circular(10),
                                ),
                                child: ListView.builder(
                                    scrollDirection:
                                    Axis.horizontal,
                                    itemCount: snapshot
                                        .data!
                                        .docs
                                        .length,
                                    itemBuilder:
                                        (context, index) {
                                      CategoryModel
                                      model =
                                      CategoryModel(
                                        categoryDescription:
                                        snapshot
                                            .data!
                                            .docs[
                                        index]
                                            .get(
                                            "categoryDescription"),
                                        categoryID: snapshot
                                            .data!
                                            .docs[index]
                                            .get(
                                            "categoryID"),
                                        categoryName: snapshot
                                            .data!
                                            .docs[index]
                                            .get(
                                            "categoryName"),
                                        categoryType: snapshot
                                            .data!
                                            .docs[index]
                                            .get(
                                            "categoryType"),
                                        thumbnailimageURL:
                                        snapshot
                                            .data!
                                            .docs[
                                        index]
                                            .get(
                                            "thumbnailimageURL"),
                                        categoryTimeline:
                                        snapshot
                                            .data!
                                            .docs[
                                        index]
                                            .get(
                                            "categoryTimeline"),
                                      );

                                      return Padding(
                                        padding:
                                        const EdgeInsets
                                            .all(8.0),
                                        child: Stack(
                                          children: [
                                            Card(
                                              elevation:
                                              5,
                                              shadowColor:
                                              MyThemeData
                                                  .onSurface,
                                              shape:
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                              ),
                                              child:
                                              Container(
                                                height:
                                                height *
                                                    0.15,
                                                width:
                                                width *
                                                    0.7,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                                child: _buildShimmer(
                                                    height: height *
                                                        0.15,
                                                    width:
                                                    width * 0.7),
                                              ),
                                            ),
                                            Card(
                                              elevation:
                                              5,
                                              shadowColor:
                                              MyThemeData
                                                  .onSurface,
                                              color: Colors
                                                  .transparent,
                                              shape:
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                              ),
                                              child:
                                              Container(
                                                height:
                                                height *
                                                    0.15,
                                                width:
                                                width *
                                                    0.7,
                                                decoration:
                                                BoxDecoration(
                                                  border: Border.all(
                                                      width:
                                                      2,
                                                      color:
                                                      Colors.transparent),
                                                  color: Colors
                                                      .transparent,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  image:
                                                  DecorationImage(
                                                    fit: BoxFit
                                                        .cover,
                                                    image: NetworkImage(model
                                                        .thumbnailimageURL
                                                        .toString()),
                                                  ),
                                                ),
                                                foregroundDecoration:
                                                BoxDecoration(
                                                  color: Colors
                                                      .black38,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child:
                                              Container(
                                                height:
                                                height *
                                                    0.15,
                                                width:
                                                width *
                                                    0.7,
                                                child:
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(12.0),
                                                  child:
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        model.categoryName.toString(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: width * 0.04,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        model.categoryDescription.toString(),
                                                        style: const TextStyle(
                                                          color: Colors.white60,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    })),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Center(
                            child: WhiteSpinkitFlutter.spinkit,
                          );
                        }
                      }),
                )
                    : SizedBox(),
                Staticdata.uid == null
                    ? SizedBox()
                    : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width * 0.05),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Staticdata.uid == null
                    ? SizedBox(
                  height: height * 0.1,
                )
                    : SizedBox(),
                Staticdata.uid == null
                    ? Center(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const LoginAppScreen(),
                          ));
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Open your new Profile',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
                    : SizedBox(),
                Staticdata.uid == null
                    ? SizedBox()
                    : SizedBox(
                  height:
                  height * 0.16, // Adjust the height as needed
                  child: StreamBuilder<QuerySnapshot>(
                      stream: firebaseFirestore
                          .collection("category")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data == null
                              ? Center(
                            child:
                            WhiteSpinkitFlutter.spinkit,
                          )
                              : snapshot.data!.docs.isEmpty
                              ? const Center(
                              child: Text("No Catagories"))
                              : Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(
                                    10),
                              ),
                              child: ListView.builder(
                                  scrollDirection:
                                  Axis.horizontal,
                                  itemCount: snapshot
                                      .data!.docs.length,
                                  itemBuilder:
                                      (context, index) {
                                    CategoryModel model =
                                    CategoryModel(
                                      categoryDescription:
                                      snapshot.data!
                                          .docs[index]
                                          .get(
                                          "categoryDescription"),
                                      categoryID: snapshot
                                          .data!.docs[index]
                                          .get(
                                          "categoryID"),
                                      categoryName: snapshot
                                          .data!.docs[index]
                                          .get(
                                          "categoryName"),
                                      categoryType: snapshot
                                          .data!.docs[index]
                                          .get(
                                          "categoryType"),
                                      thumbnailimageURL:
                                      snapshot.data!
                                          .docs[index]
                                          .get(
                                          "thumbnailimageURL"),
                                      categoryTimeline: snapshot
                                          .data!.docs[index]
                                          .get(
                                          "categoryTimeline"),
                                    );

                                    return Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          obj.catindex =
                                              index;
                                          obj.onCategoryTap(
                                              model
                                                  .categoryID!);
                                          obj.update();
                                        },
                                        child: Stack(
                                          children: [
                                            Card(
                                              elevation: 5,
                                              shadowColor:
                                              MyThemeData
                                                  .onSurface,
                                              shape:
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                              ),
                                              child:
                                              Container(
                                                height:
                                                height *
                                                    0.15,
                                                width:
                                                width *
                                                    0.7,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                ),
                                                child: _buildShimmer(
                                                    height: height *
                                                        0.15,
                                                    width: width *
                                                        0.7),
                                              ),
                                            ),
                                            Card(
                                              elevation: 5,
                                              shadowColor:
                                              MyThemeData
                                                  .onSurface,
                                              color: Colors
                                                  .transparent,
                                              shape:
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                              ),
                                              child:
                                              Container(
                                                height:
                                                height *
                                                    0.15,
                                                width:
                                                width *
                                                    0.7,
                                                decoration:
                                                BoxDecoration(
                                                  border: Border.all(
                                                      width:
                                                      2,
                                                      color: obj.catindex == index
                                                          ? Colors.white
                                                          : Colors.transparent),
                                                  color: Colors
                                                      .transparent,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                  image:
                                                  DecorationImage(
                                                    fit: BoxFit
                                                        .cover,
                                                    image: NetworkImage(model
                                                        .thumbnailimageURL
                                                        .toString()),
                                                  ),
                                                ),
                                                foregroundDecoration:
                                                BoxDecoration(
                                                  color: Colors
                                                      .black38,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child:
                                              Container(
                                                height:
                                                height *
                                                    0.15,
                                                width:
                                                width *
                                                    0.7,
                                                child:
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .all(
                                                      12.0),
                                                  child:
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        model.categoryName.toString(),
                                                        style:
                                                        TextStyle(
                                                          color: Colors.white,
                                                          fontSize: width * 0.04,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        model.categoryDescription.toString(),
                                                        style:
                                                        const TextStyle(
                                                          color: Colors.white60,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }));
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Center(
                            child: WhiteSpinkitFlutter.spinkit,
                          );
                        }
                      }),
                ),
                Staticdata.uid == null
                    ? SizedBox()
                    : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width * 0.05),
                  child: Text(
                    "Recomended for you",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Staticdata.uid == null
                    ? SizedBox()
                    : StreamBuilder<QuerySnapshot>(
                    stream: obj.playlistSnapshot,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data == null
                            ? Container(
                          height: height * 0.2,
                          child: Center(
                            child: WhiteSpinkitFlutter.spinkit,
                          ),
                        )
                            : snapshot.data!.docs.isEmpty
                            ? const Center(
                            child: Text(
                              "No Playlist",
                              style: TextStyle(
                                  color: Colors.white),
                            ))
                            : Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.05),
                          child: GridView.builder(
                            key: UniqueKey(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount:
                            snapshot.data!.docs.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 3,
                            ),
                            itemBuilder: (context, index) {
                              PlayListModel playListModel =
                              PlayListModel(
                                classType: snapshot
                                    .data!.docs[index]
                                    .get("classType"),
                                categoryID: snapshot
                                    .data!.docs[index]
                                    .get("categoryID"),
                                dificulty: snapshot
                                    .data!.docs[index]
                                    .get("dificulty"),
                                duration: snapshot
                                    .data!.docs[index]
                                    .get("duration"),
                                instructor: snapshot
                                    .data!.docs[index]
                                    .get("instructor"),
                                videoDescription: snapshot
                                    .data!.docs[index]
                                    .get(
                                    "videoDescription"),
                                videoID: snapshot
                                    .data!.docs[index]
                                    .get("videoID"),
                                videoLanguage: snapshot
                                    .data!.docs[index]
                                    .get("videoLanguage"),
                                videoName: snapshot
                                    .data!.docs[index]
                                    .get("videoName"),
                                videoURL: snapshot
                                    .data!.docs[index]
                                    .get("videoURL"),
                                viewers: snapshot
                                    .data!.docs[index]
                                    .get("viewers"),
                              );
                              return SizedBox(
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
                                      shadowColor:
                                      MyThemeData
                                          .onSurface,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10)),
                                      child: Container(
                                        height:
                                        height! * 0.13,
                                        width: width,
                                        decoration:
                                        BoxDecoration(
                                          color: MyThemeData
                                              .background,
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10),
                                        ),
                                        child: Home01VideoPlayer(
                                            playListModel:
                                            playListModel),
                                      ),
                                    ),
                                    Text(
                                      playListModel
                                          .videoName!,
                                      style: const TextStyle(
                                          color: Colors
                                              .white,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 3),
                                      child: Text(
                                        '${playListModel.duration} | intensity *',
                                        style: TextStyle(
                                            color: MyThemeData
                                                .onSurface),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Container(
                          height: height * 0.2,
                          child: Center(
                            child: WhiteSpinkitFlutter.spinkit,
                          ),
                        );
                      }
                    }),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          )
              : Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width * 0.03,
                    ),
                    child: obj.value == null
                        ? Center(
                      child: Container(
                          height: height * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IntroductionVideoPlayer()),
                    )
                        : Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        height: height * 0.6,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9FAFB),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: height * 0.6,
                              width: width * 0.35,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  const Text(
                                    "My J.F.amily presents ",
                                  ),
                                  Text(
                                    "Acrobatic Games & Artistic Family Tutorials ",
                                    style: TextStyle(
                                      color: MyThemeData.error30,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                  const Text(
                                    "Die Meisterklasse für gegenseitiges Vartrauen+Balance+Teamkraft führt in die...",
                                  ),
                                  InkWell(
                                    onTap: () {
                                      obj.value = null;
                                      obj.update();
                                    },
                                    child: Container(
                                      height: height * 0.09,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
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
                                                'images/home/pause.png'),
                                          ),
                                          Text(
                                            "Start Intro",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.56,
                              width: width * 0.4,
                              child: const Image(
                                image: AssetImage(
                                    'images/home/persons.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Staticdata.uid == null
                      ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                        horizontal: width * 0.04),
                    child: Text(
                      "Learn Fun Skills",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.027,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                      : SizedBox(),
                  ///////////////

                  Staticdata.uid == null
                      ? Container(
                    height: height * 0.3,
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                        horizontal: width * 0.02),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: obj.categoriesStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data == null
                                ? Container(
                              width: width,
                              height: height,
                              color: Colors.black
                                  .withOpacity(0.1),
                              child: Center(
                                child: SpinkitFlutter.spinkit,
                              ),
                            )
                                : snapshot.data!.docs.isEmpty
                                ? const Center(
                                child:
                                Text("No Catagories"))
                                : Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10),
                                ),
                                child: ListView.builder(
                                    scrollDirection:
                                    Axis.horizontal,
                                    itemCount: snapshot
                                        .data!.docs.length,
                                    itemBuilder:
                                        (context, index) {
                                      CategoryModel model =
                                      CategoryModel(
                                        categoryDescription:
                                        snapshot.data!
                                            .docs[index]
                                            .get(
                                            "categoryDescription"),
                                        categoryID: snapshot
                                            .data!
                                            .docs[index]
                                            .get(
                                            "categoryID"),
                                        categoryName: snapshot
                                            .data!
                                            .docs[index]
                                            .get(
                                            "categoryName"),
                                        categoryType: snapshot
                                            .data!
                                            .docs[index]
                                            .get(
                                            "categoryType"),
                                        thumbnailimageURL:
                                        snapshot.data!
                                            .docs[index]
                                            .get(
                                            "thumbnailimageURL"),
                                        categoryTimeline:
                                        snapshot.data!
                                            .docs[index]
                                            .get(
                                            "categoryTimeline"),
                                      );

                                      return Padding(
                                        padding:
                                        const EdgeInsets
                                            .all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            showtoast(
                                                "Open your new Profile");
                                          },
                                          child: Stack(
                                            children: [
                                              Card(
                                                elevation:
                                                5,
                                                shadowColor:
                                                MyThemeData
                                                    .onSurface,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                ),
                                                child:
                                                Container(
                                                  height:
                                                  height *
                                                      0.4,
                                                  width:
                                                  width *
                                                      0.4,
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                  ),
                                                  child:
                                                  _buildShimmer(
                                                    height: height *
                                                        0.4,
                                                    width: width *
                                                        0.4,
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                elevation:
                                                5,
                                                shadowColor:
                                                MyThemeData
                                                    .onSurface,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                ),
                                                child:
                                                Container(
                                                  height:
                                                  height *
                                                      0.4,
                                                  width:
                                                  width *
                                                      0.4,
                                                  decoration:
                                                  BoxDecoration(
                                                    border: Border.all(
                                                        width:
                                                        2,
                                                        color:
                                                        Colors.transparent),
                                                    color: Colors
                                                        .transparent,
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    image:
                                                    DecorationImage(
                                                      fit: BoxFit
                                                          .cover,
                                                      image: NetworkImage(model
                                                          .thumbnailimageURL
                                                          .toString()),
                                                    ),
                                                  ),
                                                  foregroundDecoration:
                                                  BoxDecoration(
                                                    color: Colors
                                                        .black38,
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child:
                                                Container(
                                                  height:
                                                  height *
                                                      0.4,
                                                  width:
                                                  width *
                                                      0.4,
                                                  child:
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(12.0),
                                                    child:
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model.categoryName.toString(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: width * 0.023,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        Text(
                                                          model.categoryDescription.toString(),
                                                          style: const TextStyle(
                                                            color: Colors.white60,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Container(
                              width: width,
                              height: height,
                              color: Colors.black.withOpacity(0.1),
                              child: Center(
                                child: SpinkitFlutter.spinkit,
                              ),
                            );
                          }
                        }),
                  )
                      : SizedBox(),
                  Staticdata.uid == null
                      ? SizedBox()
                      : Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width * 0.05,
                    ),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.027,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Staticdata.uid == null
                      ? SizedBox()
                      : Container(
                    height: height * 0.3,
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                        horizontal: width * 0.02),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: obj.categoriesStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data == null
                                ? Container(
                              width: width,
                              height: height,
                              color: Colors.black
                                  .withOpacity(0.1),
                              child: Center(
                                child: SpinkitFlutter.spinkit,
                              ),
                            )
                                : snapshot.data!.docs.isEmpty
                                ? const Center(
                                child:
                                Text("No Catagories"))
                                : Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10),
                                ),
                                child: ListView.builder(
                                    scrollDirection:
                                    Axis.horizontal,
                                    itemCount: snapshot
                                        .data!.docs.length,
                                    itemBuilder:
                                        (context, index) {
                                      CategoryModel model =
                                      CategoryModel(
                                        categoryDescription:
                                        snapshot.data!
                                            .docs[index]
                                            .get(
                                            "categoryDescription"),
                                        categoryID: snapshot
                                            .data!
                                            .docs[index]
                                            .get(
                                            "categoryID"),
                                        categoryName: snapshot
                                            .data!
                                            .docs[index]
                                            .get(
                                            "categoryName"),
                                        categoryType: snapshot
                                            .data!
                                            .docs[index]
                                            .get(
                                            "categoryType"),
                                        thumbnailimageURL:
                                        snapshot.data!
                                            .docs[index]
                                            .get(
                                            "thumbnailimageURL"),
                                        categoryTimeline:
                                        snapshot.data!
                                            .docs[index]
                                            .get(
                                            "categoryTimeline"),
                                      );

                                      return Padding(
                                        padding:
                                        const EdgeInsets
                                            .all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            obj.catindex =
                                                index;
                                            obj.onCategoryTap(
                                                model
                                                    .categoryID!);
                                            obj.update();
                                          },
                                          child: Stack(
                                            children: [
                                              Card(
                                                elevation:
                                                5,
                                                shadowColor:
                                                MyThemeData
                                                    .onSurface,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                ),
                                                child:
                                                Container(
                                                  height:
                                                  height *
                                                      0.4,
                                                  width:
                                                  width *
                                                      0.4,
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                  ),
                                                  child:
                                                  _buildShimmer(
                                                    height: height *
                                                        0.4,
                                                    width: width *
                                                        0.4,
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                elevation:
                                                5,
                                                shadowColor:
                                                MyThemeData
                                                    .onSurface,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                ),
                                                child:
                                                Container(
                                                  height:
                                                  height *
                                                      0.4,
                                                  width:
                                                  width *
                                                      0.4,
                                                  decoration:
                                                  BoxDecoration(
                                                    border: Border.all(
                                                        width:
                                                        2,
                                                        color: obj.catindex == index
                                                            ? Colors.white
                                                            : Colors.transparent),
                                                    color: Colors
                                                        .transparent,
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    image:
                                                    DecorationImage(
                                                      fit: BoxFit
                                                          .cover,
                                                      image: NetworkImage(model
                                                          .thumbnailimageURL
                                                          .toString()),
                                                    ),
                                                  ),
                                                  foregroundDecoration:
                                                  BoxDecoration(
                                                    color: Colors
                                                        .black38,
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child:
                                                Container(
                                                  height:
                                                  height *
                                                      0.4,
                                                  width:
                                                  width *
                                                      0.4,
                                                  child:
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(12.0),
                                                    child:
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model.categoryName.toString(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: width * 0.023,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        Text(
                                                          model.categoryDescription.toString(),
                                                          style: const TextStyle(
                                                            color: Colors.white60,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Container(
                              width: width,
                              height: height,
                              color: Colors.black.withOpacity(0.1),
                              child: Center(
                                child: SpinkitFlutter.spinkit,
                              ),
                            );
                          }
                        }),
                  ),

                  Staticdata.uid == null
                      ? SizedBox(
                    height: height * 0.05,
                  )
                      : SizedBox(),
                  Staticdata.uid == null
                      ? Center(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const LoginAppScreen(),
                            ));
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Open your new Profile',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                      : SizedBox(),
                  Staticdata.uid == null
                      ? SizedBox(
                    height: height * 0.05,
                  )
                      : SizedBox(),
                  Staticdata.uid == null
                      ? SizedBox()
                      : Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                        horizontal: width * 0.05),
                    child: Text(
                      "Recomended for you",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.027,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Staticdata.uid == null
                      ? SizedBox()
                      : Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                        horizontal: width * 0.05),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: obj.playlistSnapshot,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data == null
                                ? Center(
                              child:
                              WhiteSpinkitFlutter.spinkit,
                            )
                                : snapshot.data!.docs.isEmpty
                                ? const Center(
                                child: Text("No Playlist"))
                                : GridView.builder(
                              key: UniqueKey(),
                              shrinkWrap: true,
                              primary: false,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 27,
                                  mainAxisSpacing: 1,
                                  crossAxisCount: 3,
                              ),
                              itemCount: snapshot
                                  .data!.docs.length,
                              itemBuilder:
                                  (BuildContext context,
                                  index) {
                                PlayListModel
                                playListModel =
                                PlayListModel(
                                  classType: snapshot
                                      .data!.docs[index]
                                      .get("classType"),
                                  categoryID: snapshot
                                      .data!.docs[index]
                                      .get("categoryID"),
                                  dificulty: snapshot
                                      .data!.docs[index]
                                      .get("dificulty"),
                                  duration: snapshot
                                      .data!.docs[index]
                                      .get("duration"),
                                  instructor: snapshot
                                      .data!.docs[index]
                                      .get("instructor"),
                                  videoDescription: snapshot
                                      .data!.docs[index]
                                      .get(
                                      "videoDescription"),
                                  videoID: snapshot
                                      .data!.docs[index]
                                      .get("videoID"),
                                  videoLanguage: snapshot
                                      .data!.docs[index]
                                      .get(
                                      "videoLanguage"),
                                  videoName: snapshot
                                      .data!.docs[index]
                                      .get("videoName"),
                                  videoURL: snapshot
                                      .data!.docs[index]
                                      .get("videoURL"),
                                  viewers: snapshot
                                      .data!.docs[index]
                                      .get("viewers"),
                                );
                                return Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Card(
                                      elevation: 5,
                                      shadowColor:
                                      MyThemeData
                                          .onSurface,
                                      shape:
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                      ),
                                      child: Container(
                                        height: height! *
                                            0.27,
                                        width:
                                        width! * 0.5,
                                        decoration:
                                        BoxDecoration(
                                          color: MyThemeData
                                              .background,
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10),
                                        ),
                                        child: Home01VideoPlayer(
                                            playListModel:
                                            playListModel),
                                      ),
                                    ),
                                    Text(
                                      playListModel
                                          .videoName!,
                                      style: const TextStyle(
                                          color: Colors
                                              .white,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    Text(
                                      '${playListModel.duration} | intensity *',
                                      style:
                                      const TextStyle(
                                        color:
                                        Colors.grey,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Center(
                              child: WhiteSpinkitFlutter.spinkit,
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                ],
              ),
            ),
          );
        });
      }),
    );
  }

  Widget _buildShimmer({required height, required width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[100]!,
      child: Container(
        // height: height * 0.4,
        // width: width * 0.3,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.4, 0.5, 0.6],
            colors: [
              Colors.grey[200]!,
              Colors.grey[300]!,
              Colors.grey[200]!,
            ],
          ),
        ),
      ),
    );
  }
}

class Home01VideoPlayer extends StatefulWidget {
  final PlayListModel playListModel;
  final bool? isIcon;

  const Home01VideoPlayer({super.key, required this.playListModel,this.isIcon=true});

  @override
  _Home01VideoPlayerState createState() => _Home01VideoPlayerState();
}

class _Home01VideoPlayerState extends State<Home01VideoPlayer> {
  VideoPlayerController? _videoPlayerController;
  Future<void>? _initializeVideoPlayerFuture;
  bool _isVideoPlaying = false;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    Get.put(Home01Controller());
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

  void _disposeControllers() {
    _videoPlayerController!.dispose();
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
                          print('object');
                          Home01Controller.my.videoview(
                            widget.playListModel.categoryID!,
                            widget.playListModel.videoID!,
                            Staticdata.uid!,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChallengeScreen(
                                videoModal: widget.playListModel,
                              ),
                            ),
                          );
                        },
                        child:
                        widget.isIcon==true
                        ?Icon(
                          Icons.play_arrow,
                          size: 50,
                          color: Colors.white,
                        )
                            :SizedBox()
                      ),
                    ),
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

class HomeVideoPlayerScreen extends StatefulWidget {
  final PlayListModel videooo;

  const HomeVideoPlayerScreen({super.key, required this.videooo});

  @override
  State<HomeVideoPlayerScreen> createState() => _HomeVideoPlayerScreenState();
}

class _HomeVideoPlayerScreenState extends State<HomeVideoPlayerScreen> {
  VideoPlayerController? videoplayerController;
  Future<void>? _initializeVideoPlayerFuture;
  ChewieController? chewieController;

  @override
  void initState() {
    videoplayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videooo.videoURL!));
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

  void _disposeControllers() {
    videoplayerController!.dispose();
    chewieController!.dispose();
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
    return WillPopScope(
        onWillPop: () async {
          var pop = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home01Screen(),
              ));
          return pop!;
        },
        child: Scaffold(
          backgroundColor: MyThemeData.background,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text(
              "${widget.videooo.videoName}".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: MyThemeData.background,
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: MyThemeData.background,
                  child: Center(
                    child: FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio:
                            videoplayerController!.value.aspectRatio,
                            child: Chewie(controller: chewieController!),
                          );
                        } else {
                          return Center(
                            child: WhiteSpinkitFlutter.spinkit,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class IntroductionVideoPlayer extends StatefulWidget {
  const IntroductionVideoPlayer({super.key});

  @override
  State<IntroductionVideoPlayer> createState() =>
      _IntroductionVideoPlayerState();
}

class _IntroductionVideoPlayerState extends State<IntroductionVideoPlayer> {
  VideoPlayerController? videoplayerController;
  Future<void>? _initializeVideoPlayerFuture;
  VideoModel? model;
  bool isclick = false;
  String? time;
  Future<VideoModel> introductionvideo() async {
    await FirebaseFirestore.instance
        .collection("introvideo")
        .doc('1')
        .get()
        .then((value) {
      setState(() {
        model = VideoModel.fromMap(value.data()!);
        print("model $model");
      });
    });
    return model!;
  }

  void _disposeControllers() {
    videoplayerController?.dispose();
  }

  @override
  void initState() {
    Get.put(DashBoardController());
    Get.put(Home01Controller());
    introductionvideo().then((value) {
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

              if (videoplayerController!.value.position >=
                  videoplayerController!.value.duration) {
                Home01Controller.my.setVisit();
              }
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

  var height, width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: AspectRatio(
                      aspectRatio: videoplayerController!.value.aspectRatio,
                      child: VideoPlayer(videoplayerController!),
                    ),
                  ),
                ),
                isclick == false
                    ? SizedBox()
                    : Expanded(
                  child: Container(
                    height: height,
                    width: width,
                    color: MyThemeData.background.withOpacity(0.3),
                  ),
                ),
                isclick == false
                    ? SizedBox()
                    : Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: VideoProgressIndicator(
                      videoplayerController!,
                      allowScrubbing: true,
                    ),
                  ),
                ),
                isclick == false
                    ? SizedBox()
                    : Center(
                  child: IconButton(
                    icon: Icon(
                      videoplayerController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() {
                        if (videoplayerController!.value.isPlaying) {
                          videoplayerController!.pause();
                        } else {
                          videoplayerController!.play();
                        }
                      });
                    },
                  ),
                ),
                isclick == false
                    ? SizedBox()
                    : Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      time.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: WhiteSpinkitFlutter.spinkit);
        }
      },
    );
  }
}
