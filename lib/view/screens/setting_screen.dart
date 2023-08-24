import 'package:flutter/material.dart';
import 'package:jetfit/controllers/dahboard_controller.dart';
import 'package:jetfit/controllers/setting_controller.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/view/screens/profile/profile_screen.dart';
import 'package:jetfit/view/widgets/app_setting_tabs.dart';
import 'package:jetfit/view/widgets/potrait_click_setting_tabs.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
    return GetBuilder<SettingController>(initState: (state) {
      Get.put(SettingController());
      SettingController.my.index = 0;
      SettingController.my.ispotraitmodeclick = false;
    }, builder: (obj) {
      return OrientationBuilder(builder: (context, oreentation) {
        return Container(
          height: height,
          width: width,
          color: MyThemeData.background,
          child: Container(
            height: height,
            width: width,
            color: MyThemeData.background,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      oreentation == Orientation.landscape ? 0 : width * 0.05),
              child: oreentation == Orientation.landscape
                  ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: width,
                            color: MyThemeData.background,
                          ),
                        ),
                        Container(
                          height: height,
                          width: width * 0.42,
                          color: MyThemeData.background,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.05,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Settings",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.03,
                                  ),
                                ),
                              ),
                              const Text(
                                "App settings",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.73,
                                width: width,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      //1
                                      InkWell(
                                        onTap: () {
                                          obj.index = 0;
                                          obj.update();
                                        },
                                        child: Container(
                                          height: height! * 0.11,
                                          width: width * 0.38,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: obj.index == 0
                                                  ? MyThemeData.onBackground
                                                  : MyThemeData.onBackground
                                                      .withOpacity(0.4)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: width! * 0.02,
                                                ),
                                                Text(
                                                  "Units preference",
                                                  style: TextStyle(
                                                      color: obj.index == 0
                                                          ? MyThemeData
                                                              .background
                                                          : MyThemeData
                                                              .onBackground,
                                                      fontSize: width! * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    width: width!,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        obj.unitspreferencesindex ==
                                                                0
                                                            ? "Imperial"
                                                            : "Metric",
                                                        style: TextStyle(
                                                          color: obj.index == 0
                                                              ? MyThemeData
                                                                  .background
                                                              : MyThemeData
                                                                  .onBackground,
                                                          fontSize:
                                                              width! * 0.02,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width! * 0.01,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: obj.index == 0
                                                      ? Colors.green
                                                      : MyThemeData
                                                          .onBackground,
                                                  size: width * 0.02,
                                                ),
                                                SizedBox(
                                                  width: width! * 0.03,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      //2
                                      InkWell(
                                        onTap: () {
                                          obj.index = 1;
                                          obj.update();
                                        },
                                        child: Container(
                                          height: height! * 0.11,
                                          width: width * 0.38,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: obj.index == 1
                                                  ? MyThemeData.onBackground
                                                  : MyThemeData.onBackground
                                                      .withOpacity(0.4)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: width! * 0.02,
                                                ),
                                                Text(
                                                  "Language",
                                                  style: TextStyle(
                                                      color: obj.index == 1
                                                          ? MyThemeData
                                                              .background
                                                          : MyThemeData
                                                              .onBackground,
                                                      fontSize: width! * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    width: width!,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        obj.language == 0
                                                            ? "English (US)"
                                                            : obj.language == 1
                                                                ? "English (UK)"
                                                                : obj.language ==
                                                                        2
                                                                    ? "Français"
                                                                    : obj.language ==
                                                                            3
                                                                        ? "Española"
                                                                        : obj.language ==
                                                                                4
                                                                            ? "Deutsch"
                                                                            : '',
                                                        style: TextStyle(
                                                          color: obj.index == 1
                                                              ? MyThemeData
                                                                  .background
                                                              : MyThemeData
                                                                  .onBackground,
                                                          fontSize:
                                                              width! * 0.02,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width! * 0.01,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: obj.index == 1
                                                      ? Colors.green
                                                      : MyThemeData
                                                          .onBackground,
                                                  size: width * 0.02,
                                                ),
                                                SizedBox(
                                                  width: width! * 0.03,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      //3.
                                      InkWell(
                                        onTap: () {
                                          obj.index = 2;
                                          obj.update();
                                        },
                                        child: Container(
                                          height: height! * 0.11,
                                          width: width * 0.38,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: obj.index == 2
                                                  ? MyThemeData.onBackground
                                                  : MyThemeData.onBackground
                                                      .withOpacity(0.4)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: width! * 0.02,
                                                ),
                                                Text(
                                                  "Video resolution",
                                                  style: TextStyle(
                                                      color: obj.index == 2
                                                          ? MyThemeData
                                                              .background
                                                          : MyThemeData
                                                              .onBackground,
                                                      fontSize: width! * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    width: width!,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        obj.videoresolution == 0
                                                            ? "Auto"
                                                            : obj.videoresolution ==
                                                                    1
                                                                ? "2160p 4K"
                                                                : obj.videoresolution ==
                                                                        2
                                                                    ? "1440p HD"
                                                                    : obj.videoresolution ==
                                                                            3
                                                                        ? "1080p HD"
                                                                        : obj.videoresolution ==
                                                                                4
                                                                            ? "720p"
                                                                            : obj.videoresolution == 5
                                                                                ? "480p"
                                                                                : '',
                                                        style: TextStyle(
                                                          color: obj.index == 2
                                                              ? MyThemeData
                                                                  .background
                                                              : MyThemeData
                                                                  .onBackground,
                                                          fontSize:
                                                              width! * 0.02,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width! * 0.01,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: obj.index == 2
                                                      ? Colors.green
                                                      : MyThemeData
                                                          .onBackground,
                                                  size: width * 0.02,
                                                ),
                                                SizedBox(
                                                  width: width! * 0.03,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      //4
                                      InkWell(
                                        onTap: () {
                                          obj.index = 3;
                                          obj.update();
                                        },
                                        child: Container(
                                          height: height! * 0.11,
                                          width: width * 0.38,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: obj.index == 3
                                                  ? MyThemeData.onBackground
                                                  : MyThemeData.onBackground
                                                      .withOpacity(0.4)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: width! * 0.02,
                                                ),
                                                Text(
                                                  "Subtitles",
                                                  style: TextStyle(
                                                      color: obj.index == 3
                                                          ? MyThemeData
                                                              .background
                                                          : MyThemeData
                                                              .onBackground,
                                                      fontSize: width! * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    width: width!,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        obj.subtitles == true
                                                            ? "On"
                                                            : "Off",
                                                        style: TextStyle(
                                                          color: obj.index == 3
                                                              ? MyThemeData
                                                                  .background
                                                              : MyThemeData
                                                                  .onBackground,
                                                          fontSize:
                                                              width! * 0.02,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width! * 0.01,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: obj.index == 3
                                                      ? Colors.green
                                                      : MyThemeData
                                                          .onBackground,
                                                  size: width * 0.02,
                                                ),
                                                SizedBox(
                                                  width: width! * 0.03,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          obj.index = 4;
                                          obj.update();
                                        },
                                        child: Container(
                                          height: height! * 0.11,
                                          width: width * 0.38,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: obj.index == 4
                                                  ? MyThemeData.onBackground
                                                  : MyThemeData.onBackground
                                                      .withOpacity(0.4)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: width! * 0.02,
                                                ),
                                                Text(
                                                  "Account settings",
                                                  style: TextStyle(
                                                      color: obj.index == 4
                                                          ? MyThemeData
                                                              .background
                                                          : MyThemeData
                                                              .onBackground,
                                                      fontSize: width! * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    width: width!,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        "Olivia",
                                                        style: TextStyle(
                                                          color: obj.index == 4
                                                              ? MyThemeData
                                                                  .background
                                                              : MyThemeData
                                                                  .onBackground,
                                                          fontSize:
                                                              width! * 0.02,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width! * 0.01,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: obj.index == 4
                                                      ? Colors.green
                                                      : MyThemeData
                                                          .onBackground,
                                                  size: width * 0.02,
                                                ),
                                                SizedBox(
                                                  width: width! * 0.03,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          obj.index = 5;
                                          obj.update();
                                          DashBoardController.my.index = 0;
                                          DashBoardController.my.update();
                                        },
                                        child: Container(
                                          height: height! * 0.11,
                                          width: width * 0.38,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: obj.index == 5
                                                  ? MyThemeData.onBackground
                                                  : MyThemeData.onBackground
                                                      .withOpacity(0.4)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: width! * 0.02,
                                                ),
                                                Text(
                                                  "JetFit Premium",
                                                  style: TextStyle(
                                                      color: obj.index == 5
                                                          ? MyThemeData
                                                              .background
                                                          : MyThemeData
                                                              .onBackground,
                                                      fontSize: width! * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    width: width!,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        "3 month",
                                                        style: TextStyle(
                                                          color: obj.index == 5
                                                              ? MyThemeData
                                                                  .background
                                                              : MyThemeData
                                                                  .onBackground,
                                                          fontSize:
                                                              width! * 0.02,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width! * 0.01,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: obj.index == 5
                                                      ? Colors.green
                                                      : MyThemeData
                                                          .onBackground,
                                                  size: width * 0.02,
                                                ),
                                                SizedBox(
                                                  width: width! * 0.03,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          obj.index = 6;
                                          obj.update();
                                        },
                                        child: Container(
                                          height: height! * 0.11,
                                          width: width * 0.38,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: obj.index == 6
                                                  ? MyThemeData.onBackground
                                                  : MyThemeData.onBackground
                                                      .withOpacity(0.4)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: width! * 0.02,
                                                  ),
                                                  Text(
                                                    "About JetFit",
                                                    style: TextStyle(
                                                        color: obj.index == 6
                                                            ? MyThemeData
                                                                .background
                                                            : MyThemeData
                                                                .onBackground,
                                                        fontSize: width! * 0.02,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      width: width!,
                                                      child: const Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width! * 0.01,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    color: obj.index == 6
                                                        ? Colors.green
                                                        : MyThemeData
                                                            .onBackground,
                                                    size: width * 0.02,
                                                  ),
                                                  SizedBox(
                                                    width: width! * 0.03,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
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
                        Container(
                          height: height,
                          width: width * 0.46,
                          color: Colors.black,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child: obj.index == 0
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height * 0.05,
                                      ),
                                      Text(
                                        "Units preferences",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.03,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height! * 0.73,
                                        width: width,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: height * 0.03,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  obj.unitspreferencesindex = 0;
                                                  obj.update();
                                                },
                                                child: Container(
                                                  height: height! * 0.11,
                                                  width: width * 0.38,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: MyThemeData
                                                          .onBackground
                                                          .withOpacity(0.4)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: width! * 0.02,
                                                        ),
                                                        Text(
                                                          "Imperial",
                                                          style: TextStyle(
                                                              color: MyThemeData
                                                                  .onBackground,
                                                              fontSize:
                                                                  width! * 0.02,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Expanded(
                                                          child: SizedBox(
                                                            width: width!,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width! * 0.01,
                                                        ),
                                                        obj.unitspreferencesindex ==
                                                                0
                                                            ? Icon(
                                                                Icons.check,
                                                                color: MyThemeData
                                                                    .onBackground,
                                                                size: width *
                                                                    0.03,
                                                              )
                                                            : const SizedBox(),
                                                        SizedBox(
                                                          width: width! * 0.03,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.03,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  obj.unitspreferencesindex = 1;
                                                  obj.update();
                                                },
                                                child: Container(
                                                  height: height! * 0.11,
                                                  width: width * 0.38,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: MyThemeData
                                                          .onBackground
                                                          .withOpacity(0.4)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: width! * 0.02,
                                                        ),
                                                        Text(
                                                          "Metric",
                                                          style: TextStyle(
                                                              color: MyThemeData
                                                                  .onBackground,
                                                              fontSize:
                                                                  width! * 0.02,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Expanded(
                                                          child: SizedBox(
                                                            width: width!,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width! * 0.01,
                                                        ),
                                                        obj.unitspreferencesindex ==
                                                                1
                                                            ? Icon(
                                                                Icons.check,
                                                                color: MyThemeData
                                                                    .onBackground,
                                                                size: width *
                                                                    0.03,
                                                              )
                                                            : const SizedBox(),
                                                        SizedBox(
                                                          width: width! * 0.03,
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
                                      SizedBox(
                                        height: height! * 0.01,
                                      ),
                                    ],
                                  )
                                : obj.index == 1
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: height * 0.05,
                                          ),
                                          Text(
                                            "Language",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.03,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height! * 0.73,
                                            width: width,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      obj.language = 0;
                                                      obj.update();
                                                    },
                                                    child: Container(
                                                      height: height! * 0.11,
                                                      width: width * 0.38,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: MyThemeData
                                                              .onBackground
                                                              .withOpacity(
                                                                  0.4)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.02,
                                                            ),
                                                            Text(
                                                              "English (US)",
                                                              style: TextStyle(
                                                                  color: MyThemeData
                                                                      .onBackground,
                                                                  fontSize:
                                                                      width! *
                                                                          0.02,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Expanded(
                                                              child: SizedBox(
                                                                width: width!,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.01,
                                                            ),
                                                            obj.language == 0
                                                                ? Icon(
                                                                    Icons.check,
                                                                    color: MyThemeData
                                                                        .onBackground,
                                                                    size: width *
                                                                        0.03,
                                                                  )
                                                                : const SizedBox(),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.03,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      obj.language = 1;
                                                      obj.update();
                                                    },
                                                    child: Container(
                                                      height: height! * 0.11,
                                                      width: width * 0.38,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: MyThemeData
                                                              .onBackground
                                                              .withOpacity(
                                                                  0.4)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.02,
                                                            ),
                                                            Text(
                                                              "English (UK)",
                                                              style: TextStyle(
                                                                  color: MyThemeData
                                                                      .onBackground,
                                                                  fontSize:
                                                                      width! *
                                                                          0.02,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Expanded(
                                                              child: SizedBox(
                                                                width: width!,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.01,
                                                            ),
                                                            obj.language == 1
                                                                ? Icon(
                                                                    Icons.check,
                                                                    color: MyThemeData
                                                                        .onBackground,
                                                                    size: width *
                                                                        0.03,
                                                                  )
                                                                : const SizedBox(),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.03,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      obj.language = 2;
                                                      obj.update();
                                                    },
                                                    child: Container(
                                                      height: height! * 0.11,
                                                      width: width * 0.38,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: MyThemeData
                                                              .onBackground
                                                              .withOpacity(
                                                                  0.4)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.02,
                                                            ),
                                                            Text(
                                                              "Français",
                                                              style: TextStyle(
                                                                  color: MyThemeData
                                                                      .onBackground,
                                                                  fontSize:
                                                                      width! *
                                                                          0.02,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Expanded(
                                                              child: SizedBox(
                                                                width: width!,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.01,
                                                            ),
                                                            obj.language == 2
                                                                ? Icon(
                                                                    Icons.check,
                                                                    color: MyThemeData
                                                                        .onBackground,
                                                                    size: width *
                                                                        0.03,
                                                                  )
                                                                : const SizedBox(),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.03,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      obj.language = 3;
                                                      obj.update();
                                                    },
                                                    child: Container(
                                                      height: height! * 0.11,
                                                      width: width * 0.38,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: MyThemeData
                                                              .onBackground
                                                              .withOpacity(
                                                                  0.4)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.02,
                                                            ),
                                                            Text(
                                                              "Española",
                                                              style: TextStyle(
                                                                  color: MyThemeData
                                                                      .onBackground,
                                                                  fontSize:
                                                                      width! *
                                                                          0.02,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Expanded(
                                                              child: SizedBox(
                                                                width: width!,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.01,
                                                            ),
                                                            obj.language == 3
                                                                ? Icon(
                                                                    Icons.check,
                                                                    color: MyThemeData
                                                                        .onBackground,
                                                                    size: width *
                                                                        0.03,
                                                                  )
                                                                : const SizedBox(),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.03,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      obj.language = 4;
                                                      obj.update();
                                                    },
                                                    child: Container(
                                                      height: height! * 0.11,
                                                      width: width * 0.38,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: MyThemeData
                                                              .onBackground
                                                              .withOpacity(
                                                                  0.4)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.02,
                                                            ),
                                                            Text(
                                                              "Deutsch",
                                                              style: TextStyle(
                                                                  color: MyThemeData
                                                                      .onBackground,
                                                                  fontSize:
                                                                      width! *
                                                                          0.02,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Expanded(
                                                              child: SizedBox(
                                                                width: width!,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.01,
                                                            ),
                                                            obj.language == 4
                                                                ? Icon(
                                                                    Icons.check,
                                                                    color: MyThemeData
                                                                        .onBackground,
                                                                    size: width *
                                                                        0.03,
                                                                  )
                                                                : const SizedBox(),
                                                            SizedBox(
                                                              width:
                                                                  width! * 0.03,
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
                                          SizedBox(
                                            height: height! * 0.01,
                                          ),
                                        ],
                                      )
                                    : obj.index == 2
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: height * 0.05,
                                              ),
                                              Text(
                                                "Video resolution",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.03,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height! * 0.73,
                                                width: width,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: height * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          obj.videoresolution =
                                                              0;
                                                          obj.update();
                                                        },
                                                        child: Container(
                                                          height:
                                                              height! * 0.11,
                                                          width: width * 0.38,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: MyThemeData
                                                                  .onBackground
                                                                  .withOpacity(
                                                                      0.4)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.02,
                                                                ),
                                                                Text(
                                                                  "Auto",
                                                                  style: TextStyle(
                                                                      color: MyThemeData
                                                                          .onBackground,
                                                                      fontSize:
                                                                          width! *
                                                                              0.02,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        width!,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.01,
                                                                ),
                                                                obj.videoresolution ==
                                                                        0
                                                                    ? Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: MyThemeData
                                                                            .onBackground,
                                                                        size: width *
                                                                            0.03,
                                                                      )
                                                                    : const SizedBox(),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.03,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          obj.videoresolution =
                                                              1;
                                                          obj.update();
                                                        },
                                                        child: Container(
                                                          height:
                                                              height! * 0.11,
                                                          width: width * 0.38,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: MyThemeData
                                                                  .onBackground
                                                                  .withOpacity(
                                                                      0.4)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.02,
                                                                ),
                                                                Text(
                                                                  "2160p 4K",
                                                                  style: TextStyle(
                                                                      color: MyThemeData
                                                                          .onBackground,
                                                                      fontSize:
                                                                          width! *
                                                                              0.02,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        width!,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.01,
                                                                ),
                                                                obj.videoresolution ==
                                                                        1
                                                                    ? Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: MyThemeData
                                                                            .onBackground,
                                                                        size: width *
                                                                            0.03,
                                                                      )
                                                                    : const SizedBox(),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.03,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          obj.videoresolution =
                                                              2;
                                                          obj.update();
                                                        },
                                                        child: Container(
                                                          height:
                                                              height! * 0.11,
                                                          width: width * 0.38,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: MyThemeData
                                                                  .onBackground
                                                                  .withOpacity(
                                                                      0.4)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.02,
                                                                ),
                                                                Text(
                                                                  "1440p HD",
                                                                  style: TextStyle(
                                                                      color: MyThemeData
                                                                          .onBackground,
                                                                      fontSize:
                                                                          width! *
                                                                              0.02,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        width!,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.01,
                                                                ),
                                                                obj.videoresolution ==
                                                                        2
                                                                    ? Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: MyThemeData
                                                                            .onBackground,
                                                                        size: width *
                                                                            0.03,
                                                                      )
                                                                    : const SizedBox(),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.03,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          obj.videoresolution =
                                                              3;
                                                          obj.update();
                                                        },
                                                        child: Container(
                                                          height:
                                                              height! * 0.11,
                                                          width: width * 0.38,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: MyThemeData
                                                                  .onBackground
                                                                  .withOpacity(
                                                                      0.4)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.02,
                                                                ),
                                                                Text(
                                                                  "1080p HD",
                                                                  style: TextStyle(
                                                                      color: MyThemeData
                                                                          .onBackground,
                                                                      fontSize:
                                                                          width! *
                                                                              0.02,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        width!,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.01,
                                                                ),
                                                                obj.videoresolution ==
                                                                        3
                                                                    ? Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: MyThemeData
                                                                            .onBackground,
                                                                        size: width *
                                                                            0.03,
                                                                      )
                                                                    : const SizedBox(),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.03,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          obj.videoresolution =
                                                              4;
                                                          obj.update();
                                                        },
                                                        child: Container(
                                                          height:
                                                              height! * 0.11,
                                                          width: width * 0.38,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: MyThemeData
                                                                  .onBackground
                                                                  .withOpacity(
                                                                      0.4)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.02,
                                                                ),
                                                                Text(
                                                                  "720p",
                                                                  style: TextStyle(
                                                                      color: MyThemeData
                                                                          .onBackground,
                                                                      fontSize:
                                                                          width! *
                                                                              0.02,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        width!,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.01,
                                                                ),
                                                                obj.videoresolution ==
                                                                        4
                                                                    ? Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: MyThemeData
                                                                            .onBackground,
                                                                        size: width *
                                                                            0.03,
                                                                      )
                                                                    : const SizedBox(),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.03,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          obj.videoresolution =
                                                              5;
                                                          obj.update();
                                                        },
                                                        child: Container(
                                                          height:
                                                              height! * 0.11,
                                                          width: width * 0.38,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: MyThemeData
                                                                  .onBackground
                                                                  .withOpacity(
                                                                      0.4)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.02,
                                                                ),
                                                                Text(
                                                                  "480p",
                                                                  style: TextStyle(
                                                                      color: MyThemeData
                                                                          .onBackground,
                                                                      fontSize:
                                                                          width! *
                                                                              0.02,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        width!,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.01,
                                                                ),
                                                                obj.videoresolution ==
                                                                        5
                                                                    ? Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: MyThemeData
                                                                            .onBackground,
                                                                        size: width *
                                                                            0.03,
                                                                      )
                                                                    : const SizedBox(),
                                                                SizedBox(
                                                                  width:
                                                                      width! *
                                                                          0.03,
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
                                              SizedBox(
                                                height: height! * 0.01,
                                              ),
                                            ],
                                          )
                                        : obj.index == 3
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: height * 0.05,
                                                  ),
                                                  Text(
                                                    "Subtitles",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.03,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height! * 0.73,
                                                    width: width,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                height * 0.03,
                                                          ),
                                                          Container(
                                                            height:
                                                                height! * 0.11,
                                                            width: width * 0.38,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: MyThemeData
                                                                    .onBackground
                                                                    .withOpacity(
                                                                        0.4)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                        width! *
                                                                            0.02,
                                                                  ),
                                                                  Text(
                                                                    "Subtitles",
                                                                    style: TextStyle(
                                                                        color: MyThemeData
                                                                            .onBackground,
                                                                        fontSize:
                                                                            width! *
                                                                                0.02,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          width!,
                                                                    ),
                                                                  ),
                                                                  Switch(
                                                                    // thumb color (round icon)
                                                                    activeColor:
                                                                        const Color(
                                                                            0xff005140),

                                                                    activeTrackColor:
                                                                        const Color(
                                                                            0xff48DDB8),
                                                                    inactiveThumbColor: Colors
                                                                        .blueGrey
                                                                        .shade600,
                                                                    inactiveTrackColor:
                                                                        Colors
                                                                            .grey
                                                                            .shade400,
                                                                    splashRadius:
                                                                        50.0,
                                                                    // boolean variable value
                                                                    value: obj
                                                                        .subtitles,
                                                                    // changes the state of the switch
                                                                    onChanged:
                                                                        (value) {
                                                                      obj.subtitles =
                                                                          value;
                                                                      obj.update();
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                height * 0.03,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              DashBoardController
                                                                  .my.index = 9;
                                                              DashBoardController
                                                                  .my
                                                                  .update();

                                                              DashBoardController
                                                                  .my.index = 4;
                                                            },
                                                            child: Container(
                                                              height: height! *
                                                                  0.11,
                                                              width:
                                                                  width * 0.38,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: MyThemeData
                                                                      .onBackground
                                                                      .withOpacity(
                                                                          0.4)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: width! *
                                                                          0.02,
                                                                    ),
                                                                    Text(
                                                                      "Subtitles language",
                                                                      style: TextStyle(
                                                                          color: MyThemeData
                                                                              .onBackground,
                                                                          fontSize: width! *
                                                                              0.02,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            width!,
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.centerRight,
                                                                          child:
                                                                              Text(
                                                                            obj.subtitlelanguage == 0
                                                                                ? "English (US)"
                                                                                : obj.subtitlelanguage == 1
                                                                                    ? "English (UK)"
                                                                                    : obj.subtitlelanguage == 2
                                                                                        ? "Français"
                                                                                        : obj.subtitlelanguage == 3
                                                                                            ? "Española"
                                                                                            : obj.subtitlelanguage == 4
                                                                                                ? "Deutsch"
                                                                                                : '',
                                                                            style:
                                                                                TextStyle(
                                                                              color: obj.index == 1 ? MyThemeData.background : MyThemeData.onBackground,
                                                                              fontSize: width! * 0.02,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: width! *
                                                                          0.01,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .arrow_forward_ios_outlined,
                                                                      color: MyThemeData
                                                                          .onBackground,
                                                                      size: width *
                                                                          0.02,
                                                                    ),
                                                                    SizedBox(
                                                                      width: width! *
                                                                          0.02,
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
                                                  SizedBox(
                                                    height: height! * 0.01,
                                                  ),
                                                ],
                                              )
                                            : obj.index == 4
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: height * 0.05,
                                                      ),
                                                      Text(
                                                        "Account settings",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              width * 0.03,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height! * 0.73,
                                                        width: width,
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: height *
                                                                    0.03,
                                                              ),
                                                              InkWell(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      height! *
                                                                          0.11,
                                                                  width: width *
                                                                      0.38,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: MyThemeData
                                                                          .onBackground
                                                                          .withOpacity(
                                                                              0.4)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              width! * 0.02,
                                                                        ),
                                                                        Text(
                                                                          "Olivia",
                                                                          style: TextStyle(
                                                                              color: MyThemeData.onBackground,
                                                                              fontSize: width! * 0.02,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                width!,
                                                                            child:
                                                                                Align(
                                                                              alignment: Alignment.centerRight,
                                                                              child: Text(
                                                                                "Switch account",
                                                                                style: TextStyle(
                                                                                  color: MyThemeData.onBackground,
                                                                                  fontSize: width! * 0.015,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              width! * 0.01,
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .arrow_forward_ios_outlined,
                                                                          color:
                                                                              MyThemeData.onBackground,
                                                                          size: width *
                                                                              0.02,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              width! * 0.02,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.03,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  obj.logoutfunction(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      height! *
                                                                          0.11,
                                                                  width: width *
                                                                      0.38,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: MyThemeData
                                                                          .onBackground
                                                                          .withOpacity(
                                                                              0.4)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              width! * 0.02,
                                                                        ),
                                                                        Text(
                                                                          "Log out",
                                                                          style: TextStyle(
                                                                              color: MyThemeData.onBackground,
                                                                              fontSize: width! * 0.02,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                width!,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.05,
                                                              ),
                                                              const Text(
                                                                "For more account settings like changing password or deleting account, visit www.jetf.it/account",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height! * 0.01,
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox(),
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            obj.ispotraitmodeclick = false;
                            obj.update();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.05,
                              ),
                              Text(
                                "Settings",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.05,
                                ),
                              ),
                              Container(
                                height: height * 0.03,
                              ),
                              Text(
                                "App settings",
                                style: TextStyle(
                                  fontSize: width * 0.025,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: height,
                                  width: width,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        //1
                                        InkWell(
                                          onTap: () {
                                            obj.index = 0;
                                            obj.ispotraitmodeclick = true;
                                            obj.update();
                                          },
                                          child: PotraitWidgetSettingTabs(
                                            height: height,
                                            width: width,
                                            myIndex: 0,
                                            objindex: obj.index,
                                            textconditionIndex:
                                                obj.unitspreferencesindex,
                                            text: "Units preference",
                                            value0: "Imperial",
                                            value1: "Metric",
                                            value2: '',
                                            value3: '',
                                            value4: '',
                                            value5: '',
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        //2
                                        InkWell(
                                          onTap: () {
                                            obj.index = 1;
                                            obj.ispotraitmodeclick = true;
                                            obj.update();
                                          },
                                          child: PotraitWidgetSettingTabs(
                                              height: height,
                                              myIndex: 1,
                                              objindex: obj.index,
                                              text: "Language",
                                              value0: "English (US)",
                                              value1: "English (UK)",
                                              value2: "Français",
                                              value3: "Española",
                                              value4: "Deutsch",
                                              value5: '',
                                              textconditionIndex: obj.language,
                                              width: width),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        //3.
                                        InkWell(
                                          onTap: () {
                                            obj.index = 2;
                                            obj.ispotraitmodeclick = true;
                                            obj.update();
                                          },
                                          child: PotraitWidgetSettingTabs(
                                              height: height,
                                              myIndex: 2,
                                              objindex: obj.index,
                                              text: "Video resolution",
                                              value0: "Auto",
                                              value1: "2160p 4K",
                                              value2: "1440p HD",
                                              value3: "1080p HD",
                                              value4: "720p",
                                              value5: '480p',
                                              textconditionIndex:
                                                  obj.videoresolution,
                                              width: width),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        //4
                                        InkWell(
                                          onTap: () {
                                            obj.index = 3;
                                            obj.ispotraitmodeclick = true;
                                            obj.update();
                                          },
                                          child: Container(
                                            height: height! * 0.075,
                                            width: width * 0.9,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: obj.index == 3
                                                    ? MyThemeData.onBackground
                                                    : MyThemeData.onBackground
                                                        .withOpacity(0.4)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: width! * 0.02,
                                                  ),
                                                  Text(
                                                    "Subtitles",
                                                    style: TextStyle(
                                                        color: obj.index == 3
                                                            ? MyThemeData
                                                                .background
                                                            : MyThemeData
                                                                .onBackground,
                                                        fontSize:
                                                            width! * 0.037,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      width: width!,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                          obj.subtitles == true
                                                              ? "On"
                                                              : "Off",
                                                          style: TextStyle(
                                                            color: obj.index ==
                                                                    3
                                                                ? MyThemeData
                                                                    .background
                                                                : MyThemeData
                                                                    .onBackground,
                                                            fontSize:
                                                                width! * 0.033,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width! * 0.01,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    color: obj.index == 3
                                                        ? Colors.green
                                                        : MyThemeData
                                                            .onBackground,
                                                    size: width * 0.05,
                                                  ),
                                                  SizedBox(
                                                    width: width! * 0.03,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        //5
                                        InkWell(
                                          onTap: () {
                                            obj.index = 4;
                                            obj.ispotraitmodeclick = true;
                                            obj.update();
                                          },
                                          child: PotraitWidgetSettingTabs(
                                              height: height,
                                              myIndex: 4,
                                              objindex: obj.index,
                                              text: "Account settings",
                                              value0: "Profile Mangement",
                                              value1: "Olivia",
                                              value2: "Log out",
                                              value3: "",
                                              value4: "",
                                              value5: '',
                                              textconditionIndex:
                                                  obj.accountsettings,
                                              width: width),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        //6
                                        InkWell(
                                          onTap: () {
                                            obj.index = 5;
                                            obj.ispotraitmodeclick = true;
                                            obj.update();
                                            DashBoardController.my.index = 0;
                                            DashBoardController.my.update();
                                          },
                                          child: Container(
                                            height: height! * 0.075,
                                            width: width * 0.9,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: obj.index == 5
                                                  ? MyThemeData.onBackground
                                                  : MyThemeData.onBackground
                                                      .withOpacity(0.4),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: width! * 0.02,
                                                  ),
                                                  Text(
                                                    "JetFit Premium",
                                                    style: TextStyle(
                                                        color: obj.index == 5
                                                            ? MyThemeData
                                                                .background
                                                            : MyThemeData
                                                                .onBackground,
                                                        fontSize:
                                                            width! * 0.037,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      width: width!,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                          "3 month",
                                                          style: TextStyle(
                                                            color: obj.index ==
                                                                    5
                                                                ? MyThemeData
                                                                    .background
                                                                : MyThemeData
                                                                    .onBackground,
                                                            fontSize:
                                                                width! * 0.033,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width! * 0.01,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    color: obj.index == 5
                                                        ? Colors.green
                                                        : MyThemeData
                                                            .onBackground,
                                                    size: width * 0.05,
                                                  ),
                                                  SizedBox(
                                                    width: width! * 0.03,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        //7
                                        InkWell(
                                          onTap: () {
                                            obj.index = 6;
                                            obj.update();
                                          },
                                          child: Container(
                                            height: height! * 0.075,
                                            width: width * 0.9,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: obj.index == 6
                                                    ? MyThemeData.onBackground
                                                    : MyThemeData.onBackground
                                                        .withOpacity(0.4)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: width! * 0.02,
                                                    ),
                                                    Text(
                                                      "About JetFit",
                                                      style: TextStyle(
                                                          color: obj.index == 6
                                                              ? MyThemeData
                                                                  .background
                                                              : MyThemeData
                                                                  .onBackground,
                                                          fontSize:
                                                              width! * 0.037,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: width!,
                                                        child: const Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width! * 0.01,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                      color: obj.index == 6
                                                          ? Colors.green
                                                          : MyThemeData
                                                              .onBackground,
                                                      size: width * 0.05,
                                                    ),
                                                    SizedBox(
                                                      width: width! * 0.03,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height! * 0.01,
                              ),
                            ],
                          ),
                        ),
                        obj.ispotraitmodeclick
                            ? InkWell(
                                onTap: () {
                                  obj.ispotraitmodeclick = false;
                                  obj.update();
                                },
                                child: Container(
                                  height: height,
                                  width: width,
                                  color:
                                      MyThemeData.background.withOpacity(0.3),
                                ),
                              )
                            : const SizedBox(),
                        obj.ispotraitmodeclick
                            ? Align(
                                alignment: Alignment.center,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 10,
                                  shadowColor: MyThemeData.onSurface,
                                  child: Container(
                                    height: height! * 0.6,
                                    width: width! * 0.8,
                                    decoration: BoxDecoration(
                                        color: MyThemeData.surfaceVarient,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          obj.index == 0
                                              ? Column(
                                                  children: [
                                                    Container(
                                                      height: height * 0.03,
                                                    ),
                                                    Text(
                                                      "Units preferences",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.05,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.45,
                                                      width: width,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                height * 0.03,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              obj.unitspreferencesindex =
                                                                  0;
                                                              obj.ispotraitmodeclick =
                                                                  false;
                                                              obj.update();
                                                            },
                                                            child:
                                                                IsClicksettingTabs(
                                                              height: height,
                                                              width: width,
                                                              myIndex: 0,
                                                              objconditionIndex:
                                                                  obj.unitspreferencesindex,
                                                              text: "Imperial",
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                height * 0.03,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              obj.unitspreferencesindex =
                                                                  1;
                                                              obj.ispotraitmodeclick =
                                                                  false;
                                                              obj.update();
                                                            },
                                                            child:
                                                                IsClicksettingTabs(
                                                              height: height,
                                                              width: width,
                                                              myIndex: 1,
                                                              objconditionIndex:
                                                                  obj.unitspreferencesindex,
                                                              text: "Metric",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height! * 0.01,
                                                    ),
                                                  ],
                                                )
                                              : obj.index == 1
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                          height: height * 0.03,
                                                        ),
                                                        Text(
                                                          "Language",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.05,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.5,
                                                          width: width,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.03,
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      obj.language =
                                                                          0;
                                                                      obj.ispotraitmodeclick =
                                                                          false;
                                                                      obj.update();
                                                                    },
                                                                    child: IsClicksettingTabs(
                                                                        height:
                                                                            height,
                                                                        text:
                                                                            "English (US)",
                                                                        myIndex:
                                                                            0,
                                                                        objconditionIndex: obj
                                                                            .language,
                                                                        width:
                                                                            width)),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.03,
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      obj.language =
                                                                          1;
                                                                      obj.ispotraitmodeclick =
                                                                          false;
                                                                      obj.update();
                                                                    },
                                                                    child: IsClicksettingTabs(
                                                                        height:
                                                                            height,
                                                                        text:
                                                                            "English (UK)",
                                                                        myIndex:
                                                                            1,
                                                                        objconditionIndex: obj
                                                                            .language,
                                                                        width:
                                                                            width)),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.03,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    obj.language =
                                                                        2;
                                                                    obj.ispotraitmodeclick =
                                                                        false;
                                                                    obj.update();
                                                                  },
                                                                  child: IsClicksettingTabs(
                                                                      height:
                                                                          height,
                                                                      text:
                                                                          "Français",
                                                                      myIndex:
                                                                          2,
                                                                      objconditionIndex: obj
                                                                          .language,
                                                                      width:
                                                                          width),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.03,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    obj.language =
                                                                        3;
                                                                    obj.ispotraitmodeclick =
                                                                        false;
                                                                    obj.update();
                                                                  },
                                                                  child: IsClicksettingTabs(
                                                                      height:
                                                                          height,
                                                                      text:
                                                                          "Española",
                                                                      myIndex:
                                                                          3,
                                                                      objconditionIndex: obj
                                                                          .language,
                                                                      width:
                                                                          width),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.03,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    obj.language =
                                                                        4;
                                                                    obj.ispotraitmodeclick =
                                                                        false;
                                                                    obj.update();
                                                                  },
                                                                  child: IsClicksettingTabs(
                                                                      height:
                                                                          height,
                                                                      text:
                                                                          "Deutsch",
                                                                      myIndex:
                                                                          4,
                                                                      objconditionIndex: obj
                                                                          .language,
                                                                      width:
                                                                          width),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              height! * 0.01,
                                                        ),
                                                      ],
                                                    )
                                                  : obj.index == 2
                                                      ? Column(
                                                          children: [
                                                            Container(
                                                              height:
                                                                  height * 0.03,
                                                            ),
                                                            Text(
                                                              "Video resolution",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    width *
                                                                        0.05,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.5,
                                                              width: width,
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.03,
                                                                    ),
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          obj.videoresolution =
                                                                              0;
                                                                          obj.ispotraitmodeclick =
                                                                              false;
                                                                          obj.update();
                                                                        },
                                                                        child: IsClicksettingTabs(
                                                                            height:
                                                                                height,
                                                                            text:
                                                                                "Auto",
                                                                            myIndex:
                                                                                0,
                                                                            objconditionIndex:
                                                                                obj.videoresolution,
                                                                            width: width)),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.03,
                                                                    ),
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          obj.videoresolution =
                                                                              1;
                                                                          obj.ispotraitmodeclick =
                                                                              false;
                                                                          obj.update();
                                                                        },
                                                                        child: IsClicksettingTabs(
                                                                            height:
                                                                                height,
                                                                            text:
                                                                                "2160p 4K",
                                                                            myIndex:
                                                                                1,
                                                                            objconditionIndex:
                                                                                obj.videoresolution,
                                                                            width: width)),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.03,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        obj.videoresolution =
                                                                            2;
                                                                        obj.ispotraitmodeclick =
                                                                            false;
                                                                        obj.update();
                                                                      },
                                                                      child: IsClicksettingTabs(
                                                                          height:
                                                                              height,
                                                                          text:
                                                                              "1440p HD",
                                                                          myIndex:
                                                                              2,
                                                                          objconditionIndex: obj
                                                                              .videoresolution,
                                                                          width:
                                                                              width),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.03,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        obj.videoresolution =
                                                                            3;
                                                                        obj.ispotraitmodeclick =
                                                                            false;
                                                                        obj.update();
                                                                      },
                                                                      child: IsClicksettingTabs(
                                                                          height:
                                                                              height,
                                                                          text:
                                                                              "1080p HD",
                                                                          myIndex:
                                                                              3,
                                                                          objconditionIndex: obj
                                                                              .videoresolution,
                                                                          width:
                                                                              width),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.03,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        obj.videoresolution =
                                                                            4;
                                                                        obj.ispotraitmodeclick =
                                                                            false;
                                                                        obj.update();
                                                                      },
                                                                      child: IsClicksettingTabs(
                                                                          height:
                                                                              height,
                                                                          text:
                                                                              "720p",
                                                                          myIndex:
                                                                              4,
                                                                          objconditionIndex: obj
                                                                              .videoresolution,
                                                                          width:
                                                                              width),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.03,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        obj.videoresolution =
                                                                            5;
                                                                        obj.ispotraitmodeclick =
                                                                            false;
                                                                        obj.update();
                                                                      },
                                                                      child: IsClicksettingTabs(
                                                                          height:
                                                                              height,
                                                                          text:
                                                                              "480p",
                                                                          myIndex:
                                                                              5,
                                                                          objconditionIndex: obj
                                                                              .videoresolution,
                                                                          width:
                                                                              width),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: height! *
                                                                  0.01,
                                                            ),
                                                          ],
                                                        )
                                                      : obj.index == 3
                                                          ? Column(
                                                              children: [
                                                                Container(
                                                                  height:
                                                                      height *
                                                                          0.03,
                                                                ),
                                                                Text(
                                                                  "Subtitles",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.05,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height! *
                                                                          0.4,
                                                                  width: width,
                                                                  child: Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height: height *
                                                                            0.03,
                                                                      ),
                                                                      Container(
                                                                        height: height! *
                                                                            0.06,
                                                                        width: width *
                                                                            0.7,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            color: MyThemeData.onBackground.withOpacity(0.4)),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: width! * 0.02,
                                                                              ),
                                                                              Text(
                                                                                "Subtitles",
                                                                                style: TextStyle(color: MyThemeData.onBackground, fontSize: width! * 0.04, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Expanded(
                                                                                child: SizedBox(
                                                                                  width: width!,
                                                                                ),
                                                                              ),
                                                                              Switch(
                                                                                // thumb color (round icon)
                                                                                activeColor: const Color(0xff005140),

                                                                                activeTrackColor: const Color(0xff48DDB8),
                                                                                inactiveThumbColor: Colors.blueGrey.shade600,
                                                                                inactiveTrackColor: Colors.grey.shade400,
                                                                                splashRadius: 50.0,
                                                                                // boolean variable value
                                                                                value: obj.subtitles,
                                                                                // changes the state of the switch
                                                                                onChanged: (value) {
                                                                                  obj.subtitles = value;
                                                                                  obj.update();
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: height *
                                                                            0.03,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          DashBoardController
                                                                              .my
                                                                              .index = 9;
                                                                          DashBoardController
                                                                              .my
                                                                              .update();

                                                                          DashBoardController
                                                                              .my
                                                                              .index = 4;
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              height! * 0.06,
                                                                          width:
                                                                              width * 0.7,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: MyThemeData.onBackground.withOpacity(0.4)),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: width! * 0.02,
                                                                                ),
                                                                                Text(
                                                                                  "Subtitles language",
                                                                                  style: TextStyle(color: MyThemeData.onBackground, fontSize: width! * 0.04, fontWeight: FontWeight.bold),
                                                                                ),
                                                                                Expanded(
                                                                                  child: SizedBox(
                                                                                    width: width!,
                                                                                    child: Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Text(
                                                                                        obj.subtitlelanguage == 0
                                                                                            ? "English (US)"
                                                                                            : obj.subtitlelanguage == 1
                                                                                                ? "English (UK)"
                                                                                                : obj.subtitlelanguage == 2
                                                                                                    ? "Français"
                                                                                                    : obj.subtitlelanguage == 3
                                                                                                        ? "Española"
                                                                                                        : obj.subtitlelanguage == 4
                                                                                                            ? "Deutsch"
                                                                                                            : '',
                                                                                        style: TextStyle(
                                                                                          color: obj.index == 1 ? MyThemeData.background : MyThemeData.onBackground,
                                                                                          fontSize: width! * 0.03,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: width! * 0.01,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.arrow_forward_ios_outlined,
                                                                                  color: MyThemeData.onBackground,
                                                                                  size: width * 0.05,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: width! * 0.02,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height! *
                                                                          0.01,
                                                                ),
                                                              ],
                                                            )
                                                          : obj.index == 4
                                                              ? Column(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          height *
                                                                              0.03,
                                                                    ),
                                                                    Text(
                                                                      "Account settings",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            width *
                                                                                0.05,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height! *
                                                                              0.4,
                                                                      width:
                                                                          width,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.03,
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                height! * 0.06,
                                                                            width:
                                                                                width * 0.7,
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyThemeData.onBackground.withOpacity(0.4)),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: width! * 0.02,
                                                                                  ),
                                                                                  Text(
                                                                                    "Olivia",
                                                                                    style: TextStyle(color: MyThemeData.onBackground, fontSize: width! * 0.04, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: SizedBox(
                                                                                      width: width!,
                                                                                      child: Align(
                                                                                        alignment: Alignment.centerRight,
                                                                                        child: Text(
                                                                                          "Switch account",
                                                                                          style: TextStyle(
                                                                                            color: MyThemeData.onBackground,
                                                                                            fontSize: width! * 0.032,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: width! * 0.01,
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.arrow_forward_ios_outlined,
                                                                                    color: MyThemeData.onBackground,
                                                                                    size: width * 0.03,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: width! * 0.02,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.03,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => const ProfileScreen(),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: height! * 0.06,
                                                                              width: width * 0.7,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyThemeData.onBackground.withOpacity(0.4)),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: width! * 0.02,
                                                                                    ),
                                                                                    Text(
                                                                                      "Profile",
                                                                                      style: TextStyle(color: MyThemeData.onBackground, fontSize: width! * 0.04, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: SizedBox(
                                                                                        width: width!,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.03,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              obj.logoutfunction(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: height! * 0.06,
                                                                              width: width * 0.7,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyThemeData.onBackground.withOpacity(0.4)),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: width! * 0.02,
                                                                                    ),
                                                                                    Text(
                                                                                      "Log out",
                                                                                      style: TextStyle(color: MyThemeData.onBackground, fontSize: width! * 0.04, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: SizedBox(
                                                                                        width: width!,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const Padding(
                                                                            padding:
                                                                                EdgeInsets.all(20.0),
                                                                            child:
                                                                                Text(
                                                                              "For more account settings like changing password or deleting account, visit www.jetf.it/account",
                                                                              style: TextStyle(
                                                                                color: Colors.grey,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height! *
                                                                              0.01,
                                                                    ),
                                                                  ],
                                                                )
                                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
            ),
          ),
        );
      });
    });
  }
}
