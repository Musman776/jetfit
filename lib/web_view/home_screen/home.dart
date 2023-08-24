import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/models/admin_model.dart';
import 'package:jetfit/utilis/static_data.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/web_view/home_screen/dashboard_screen/dashboard_screen.dart';
import 'package:jetfit/web_view/home_screen/manage_catagory/manage_catagory.dart';
import 'package:jetfit/web_view/home_screen/manage_favourite/manage_favourite.dart';
import 'package:jetfit/web_view/home_screen/manage_pavement/manage_pavement.dart';
import 'package:jetfit/web_view/home_screen/manage_profile/manage_profile_screen.dart';
import 'package:jetfit/web_view/home_screen/manage_users/manage_users.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:jetfit/web_view/home_screen/video_screen/addvideo/addvideo.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  var height, width;

  bool addctagorypage = false;
  bool addvideopage = false;
  bool managectagorypage = false;
  bool manageuserpage = false;
  bool manageprofilepage = false;
  bool manageFavouriteepage = false;
  bool managepavementpage = false;
  bool dashboard = false;
  bool feedback = false;

  void getAdminModel() async {
    print("object ${Staticdata.uid}");
    await FirebaseFirestore.instance
        .collection('Admin')
        // .doc(Staticdata.uid)
        .doc(Staticdata.uid)
        .get()
        .then((value) {
      setState(() {
        Staticdata.adminmodel = AdminwebModel.fromMap(value.data()!);
        print("object  ${Staticdata.adminmodel}");
      });
    });
  }

  ExpandedTileController? videocontroller;
  ExpandedTileController? manageuserscontroller;
  ExpandedTileController? profilecontroller;
  ExpandedTileController? _paymentcontroller;
  ExpandedTileController? feedbackcontroller;

  void falseALL() {
    setState(() {
      addctagorypage = false;
      managectagorypage = false;
      manageuserpage = false;
      manageprofilepage = false;
      managepavementpage = false;
      dashboard = false;
      manageFavouriteepage = false;
      addvideopage = false;
      feedback = false;
    });
  }

  @override
  void initState() {
    dashboard = true;
    // manageFavouriteepage = true;
    getAdminModel();
    _paymentcontroller = ExpandedTileController();
    videocontroller = ExpandedTileController();
    profilecontroller = ExpandedTileController();
    manageuserscontroller = ExpandedTileController();
    feedbackcontroller = ExpandedTileController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: height,
                    width: width * 0.15,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(12, 0),
                      ),
                    ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.02),
                        GestureDetector(
                          onTap: () {
                            falseALL();
                            setState(() {
                              dashboard = true;
                            });
                          },
                          child: Center(
                            child: Container(
                              height: height * 0.05,
                              width: width * 0.12,
                              decoration: BoxDecoration(
                                  color: MyThemeData.background,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Container(
                                    height: height,
                                    width: width * 0.08,
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                      child: Text(
                                        "Dashboard",
                                        maxLines: 1,
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: width * 0.01,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.08),
                        Expanded(
                          flex: 20,
                          child: SizedBox(
                            height: height,
                            width: width,
                            child: ListView(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ExpandedTile(
                                    controller: videocontroller!,
                                    leading: Icon(
                                      Icons.video_collection_sharp,
                                      color: MyThemeData.background,
                                      size: 20,
                                    ),
                                    title: Text(
                                      "Videos",
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: Container(
                                      child: Column(
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              falseALL();
                                              addvideopage = true;
                                              setState(() {});
                                            },
                                            child: Container(
                                                height: height * 0.05,
                                                width: width,
                                                decoration: BoxDecoration(
                                                    color:
                                                        MyThemeData.background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "Add Video",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: width * 0.01,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              falseALL();
                                              addctagorypage = true;
                                              setState(() {});
                                            },
                                            child: Container(
                                                height: height * 0.05,
                                                width: width,
                                                decoration: BoxDecoration(
                                                    color:
                                                        MyThemeData.background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "Add Playlist",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: width * 0.01,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              falseALL();
                                              setState(() {
                                                managectagorypage = true;
                                              });
                                            },
                                            child: Container(
                                                height: height * 0.05,
                                                width: width,
                                                decoration: BoxDecoration(
                                                    color:
                                                        MyThemeData.background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "Manage Category",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: width * 0.01,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    falseALL();
                                    setState(() {
                                      managectagorypage = true;
                                    });
                                  },
                                  child: Container(
                                      height: height * 0.05,
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: MyThemeData.background,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Manage Category",
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: width * 0.01,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ExpandedTile(
                                    controller: manageuserscontroller!,
                                    leading: Image(
                                      height: height * 0.03,
                                      image: const AssetImage(
                                          'images/feeusers.png'),
                                    ),
                                    title: Text(
                                      "Users",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    content: Container(
                                      child: Column(
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              falseALL();
                                              setState(() {
                                                manageuserpage = true;
                                              });
                                            },
                                            child: Container(
                                                height: height * 0.05,
                                                width: width,
                                                decoration: BoxDecoration(
                                                    color:
                                                        MyThemeData.background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "Manage Users",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: width * 0.01,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              falseALL();
                                              setState(() {
                                                manageFavouriteepage = true;
                                              });
                                            },
                                            child: Container(
                                                height: height * 0.05,
                                                width: width,
                                                decoration: BoxDecoration(
                                                    color:
                                                        MyThemeData.background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "Manage Favourites",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: width * 0.01,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                /////////////////////////////Payment///////////////////////////////////////
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ExpandedTile(
                                    controller: _paymentcontroller!,
                                    leading: Image(
                                      height: height * 0.03,
                                      image: const AssetImage(
                                          'images/credit-card.png'),
                                    ),
                                    title: Text(
                                      "Payment",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    content: Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          falseALL();
                                          setState(() {
                                            managepavementpage = true;
                                          });
                                        },
                                        child: Container(
                                            height: height * 0.05,
                                            width: width,
                                            decoration: BoxDecoration(
                                                color: MyThemeData.background,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                "Manage Pavement",
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: width * 0.01,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ExpandedTile(
                                    controller: feedbackcontroller!,
                                    leading: Icon(Icons.feedback_outlined),
                                    title: Text(
                                      "Feedback",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    content: Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          falseALL();
                                          setState(() {
                                            feedback = true;
                                          });
                                        },
                                        child: Container(
                                            height: height * 0.05,
                                            width: width,
                                            decoration: BoxDecoration(
                                                color: MyThemeData.background,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                "Feedback Profile",
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: width * 0.01,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
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
                Expanded(
                  flex: 20,
                  child: Container(
                    height: height,
                    color: Colors.blue[50],
                    child: addctagorypage == true
                        ? const AddcategoryScreen()
                        : managectagorypage == true
                            ? const ManagecategoryScreen()
                            : manageuserpage == true
                                ? const MangeUsersScreen()
                                : manageprofilepage == true
                                    ? const MangeProfileScreen()
                                    : dashboard == true
                                        ? const DashBoardScreen()
                                        : manageFavouriteepage == true
                                            ? const ManageFavourite()
                                            : managepavementpage == true
                                                ? const ManagePavementScreen()
                                                : feedback == true
                                                    ? const ManagePavementScreen()
                                                    : addvideopage == true
                                                        ? const AddVideo()
                                                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
