import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/models/user_model.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/view/widgets/textformfield.dart';
import 'package:jetfit/view/widgets/web_button.dart';
import 'package:jetfit/web_view/home_screen/manage_catagory/video_players.dart';
import 'package:jetfit/web_view/home_screen/manage_favourite/manage_favourite_controller.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';
import 'package:get/get.dart';

class ManageFavourite extends StatefulWidget {
  const ManageFavourite({super.key});

  @override
  State<ManageFavourite> createState() => _ManageFavouriteState();
}

class _ManageFavouriteState extends State<ManageFavourite> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyThemeData.background,
      body: GetBuilder<ManageFAvouriteController>(initState: (state) {
        Get.put(ManageFAvouriteController());
        ManageFAvouriteController.my.is_edit_favourite_click = false;
      }, builder: (obj) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: width * 0.05),
                  width: width,
                  height: height * 0.1,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "MANAGE FAVOURITES",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.08),
              child: Align(
                alignment: Alignment.center,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: width,
                    height: height * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.01, top: height * 0.03),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Text(
                                  'Users',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: MyThemeData.background,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width * 0.5,
                                ),
                                SizedBox(
                                  width: width * 0.16,
                                  child: Textformfield(
                                    hinttext: "Search User",
                                    controller: obj.searchusercontroller,
                                    abscureText: false,
                                    onChanged: (value) {
                                      obj.name = value;
                                      obj.update();
                                    },
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: MyThemeData.greyColor,
                                    ),
                                    keyboardtype: TextInputType.name,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.025, top: height * 0.03),
                            child: Row(
                              children: [
                                lableTextname("No"),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                lableTextname("Profile"),
                                SizedBox(
                                  width: width * 0.19,
                                ),
                                lableTextname("Email"),
                                SizedBox(
                                  width: width * 0.175,
                                ),
                                lableTextname("Role"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: width,
                              height: height,
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: obj.firebaseFirestore
                                      .collection('User')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: SpinkitFlutter.spinkit,
                                      );
                                    } else if (snapshot.hasData) {
                                      return ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          UserModel model = UserModel(
                                            email: snapshot.data!.docs[index]
                                                .get("email"),
                                            id: snapshot.data!.docs[index]
                                                .get("id"),
                                            imageURL: snapshot.data!.docs[index]
                                                .get("imageURL"),
                                            name: snapshot.data!.docs[index]
                                                .get("name"),
                                            password: snapshot.data!.docs[index]
                                                .get("password"),
                                            role: snapshot.data!.docs[index]
                                                .get("role"),
                                            status: snapshot.data!.docs[index]
                                                .get("status"),
                                          );

                                          if (obj.name.isEmpty ||
                                              obj.name == '') {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  //////////////// viewer image
                                                  SizedBox(
                                                    width: width,
                                                    height: height * 0.09,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: width * 0.05,
                                                          child: Text(
                                                            '${index + 1}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: MyThemeData
                                                                    .background,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.grey,
                                                            image: model.imageURL ==
                                                                    null
                                                                ? const DecorationImage(
                                                                    image:
                                                                        AssetImage(
                                                                      "images/profile-user.png",
                                                                    ),
                                                                  )
                                                                : DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image:
                                                                        NetworkImage(
                                                                      model
                                                                          .imageURL!,
                                                                    ),
                                                                  ),
                                                          ),
                                                          width: width * 0.06,
                                                          height: height * 0.06,
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.01,
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.17,
                                                          child: Text(
                                                            model.name!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: MyThemeData
                                                                    .background,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.2,
                                                          child: Text(
                                                            model.email!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: MyThemeData
                                                                    .background,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.09,
                                                          child: Text(
                                                            model.role!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: MyThemeData
                                                                    .background,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.02,
                                                        ),
                                                        WebButton(
                                                            text:
                                                                "Manage Favourite",
                                                            color: MyThemeData
                                                                .background,
                                                            onPressed: () {
                                                              obj.manageFavouritetap(
                                                                  model);
                                                            },
                                                            width:
                                                                width * 0.13),
                                                        SizedBox(
                                                          width: width * 0.015,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else if (obj.name
                                              .toLowerCase()
                                              .contains(
                                                  model.name!.toLowerCase())) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  //////////////// viewer image
                                                  SizedBox(
                                                    width: width,
                                                    height: height * 0.09,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: width * 0.05,
                                                          child: Text(
                                                            '${index + 1}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: MyThemeData
                                                                    .background,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.grey,
                                                            image: model.imageURL ==
                                                                    null
                                                                ? const DecorationImage(
                                                                    image:
                                                                        AssetImage(
                                                                      "images/profile-user.png",
                                                                    ),
                                                                  )
                                                                : DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image:
                                                                        NetworkImage(
                                                                      model
                                                                          .imageURL!,
                                                                    ),
                                                                  ),
                                                          ),
                                                          width: width * 0.06,
                                                          height: height * 0.06,
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.01,
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.17,
                                                          child: Text(
                                                            model.name!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: MyThemeData
                                                                    .background,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.2,
                                                          child: Text(
                                                            model.email!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: MyThemeData
                                                                    .background,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.09,
                                                          child: Text(
                                                            model.role!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: MyThemeData
                                                                    .background,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.02,
                                                        ),
                                                        WebButton(
                                                            text:
                                                                "Manage Favourite",
                                                            color: MyThemeData
                                                                .background,
                                                            onPressed: () {
                                                              obj.manageFavouritetap(
                                                                  model);
                                                            },
                                                            width:
                                                                width * 0.13),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Container();
                                          }
                                        },
                                      );
                                    } else {
                                      return const Center(
                                          child: Text('No Users'));
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

///////////////////////////////////////////
            obj.is_edit_favourite_click == true
                ? StreamBuilder<QuerySnapshot>(
                    stream: obj.firebaseFirestore
                        .collection("Favourite")
                        .doc(obj.userModel!.id)
                        .collection("UserFavourites")
                        .snapshots(),
                    builder: (context, snapshot) {
                      return Padding(
                        padding: EdgeInsets.only(top: height * 0.08),
                        child: Align(
                          alignment: Alignment.center,
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: width,
                              height: height * 0.85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.01),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 0.01,
                                          top: height * 0.03),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              obj.is_edit_favourite_click =
                                                  false;
                                              obj.update();
                                            },
                                            icon: Icon(
                                              Icons.arrow_back_ios_new,
                                              color: MyThemeData.background,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          SizedBox(
                                            width: width * 0.3,
                                            child: Text(
                                              '${obj.userModel!.name}\'s Favourites',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: MyThemeData.background,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.25,
                                          ),
                                          SizedBox(
                                            width: width * 0.16,
                                            child: Textformfield(
                                              onChanged: (value) {
                                                obj.name = value;
                                                obj.update();
                                              },
                                              hinttext: "Search Video",
                                              controller:
                                                  obj.searchusercontroller,
                                              abscureText: false,
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color: MyThemeData.greyColor,
                                              ),
                                              keyboardtype: TextInputType.name,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: width,
                                        height: height * 0.4,
                                        child: snapshot.hasData
                                            ? snapshot.data != null
                                                ? snapshot.data!.docs.isEmpty
                                                    ? const Center(
                                                        child: Text("No video"),
                                                      )
                                                    : ListView.builder(
                                                        itemCount: snapshot
                                                            .data!.docs.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          FavouriteModel model =
                                                              FavouriteModel(
                                                            favID: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get("favID"),
                                                            duration: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get(
                                                                    "duration"),
                                                            classType: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get(
                                                                    "classType"),
                                                            dificulty: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get(
                                                                    "dificulty"),
                                                            instructor: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get(
                                                                    "instructor"),
                                                            videoLanguage: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get(
                                                                    "videoLanguage"),
                                                            categoryID: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get(
                                                                    "categoryID"),
                                                            videoDescription:
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        "videoDescription"),
                                                            videoID: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get("videoID"),
                                                            videoName: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get(
                                                                    "videoName"),
                                                            videoURL: snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get(
                                                                    "videoURL"),
                                                          );

                                                          if (obj.name
                                                                  .isEmpty ||
                                                              obj.name == '') {
                                                            return FavouritePlaylistPlayer(
                                                              model: model,
                                                            );
                                                          } else if (obj.name
                                                              .toLowerCase()
                                                              .contains(model
                                                                  .videoName!
                                                                  .toLowerCase())) {
                                                            return FavouritePlaylistPlayer(
                                                              model: model,
                                                            );
                                                          } else {
                                                            return Container();
                                                          }
                                                        },
                                                      )
                                                : Center(
                                                    child:
                                                        SpinkitFlutter.spinkit,
                                                  )
                                            : Center(
                                                child: SpinkitFlutter.spinkit,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : const SizedBox(),
          ],
        );
      }),
    );
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
}
