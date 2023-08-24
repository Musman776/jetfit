import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/view/widgets/textformfield.dart';
import 'package:jetfit/view/widgets/web_button.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_controller.dart';
import 'package:jetfit/web_view/home_screen/video_screen/addvideo/add_video_controller.dart';
import 'package:jetfit/web_view/home_screen/video_screen/video_player.dart';
import 'package:video_player/video_player.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  GlobalKey<FormState> videoformKey = GlobalKey<FormState>();
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyThemeData.background,
      body: GetBuilder<AddVideoController>(initState: (state) {
        Get.put(AddVideoController());
        AddVideoController.my.videotypedropdownItems.clear();
        AddVideoController.my.dropdownItems.clear();
        AddVideoController.my.difficultydropdownItems.clear();
        AddVideoController.my.classtypedropdownItems.clear();
        AddVideoController.my.videolanguagedropdownItems.clear();
        for (var i = 0; i < AddVideoController.my.menuItems.length; i++) {
          AddVideoController.my.dropdownItems.add(
            CoolDropdownItem<String>(
                label: AddVideoController.my.menuItems[i],
                value: AddVideoController.my.menuItems[i]),
          );
        }

        for (var i = 0; i < AddVideoController.my.videotypeItems.length; i++) {
          AddVideoController.my.videotypedropdownItems.add(
            CoolDropdownItem<String>(
                label: AddVideoController.my.videotypeItems[i],
                value: AddVideoController.my.videotypeItems[i]),
          );
        }

        for (var i = 0;
            i < AddVideoController.my.difficultymenuItems.length;
            i++) {
          AddVideoController.my.difficultydropdownItems.add(
            CoolDropdownItem<String>(
                label: AddVideoController.my.difficultymenuItems[i],
                value: AddVideoController.my.difficultymenuItems[i]),
          );
        }
        for (var i = 0;
            i < AddVideoController.my.classtypemenuItems.length;
            i++) {
          AddVideoController.my.classtypedropdownItems.add(
            CoolDropdownItem<String>(
                label: AddVideoController.my.classtypemenuItems[i],
                value: AddVideoController.my.classtypemenuItems[i]),
          );
        }

        for (var i = 0;
            i < AddVideoController.my.videolanguagemenuItems.length;
            i++) {
          AddVideoController.my.videolanguagedropdownItems.add(
            CoolDropdownItem<String>(
                label: AddVideoController.my.videolanguagemenuItems[i],
                value: AddVideoController.my.videolanguagemenuItems[i]),
          );
        }

        // AddVideoController.my.initstatefunctions();
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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ADD NEW VIDEO",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: height * 0.85,
                    width: width,
                    child: Form(
                      key: videoformKey,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                              child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.1),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: height * 0.04,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: height * 0.03,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                obj.pickVideo();
                                              },
                                              child: obj.videofile == null
                                                  ? Container(
                                                      width: width * 0.25,
                                                      height: height * 0.18,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Image(
                                                            height:
                                                                height * 0.1,
                                                            width: width * 0.2,
                                                            image: const AssetImage(
                                                                'images/upload.png'),
                                                          ),
                                                          lableTextname(
                                                            "upload Video",
                                                          ),
                                                        ],
                                                      ))
                                                  : obj.playlistloading == true
                                                      ? Container(
                                                          width: width * 0.25,
                                                          height: height * 0.18,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child:
                                                                SpinkitFlutter
                                                                    .spinkit,
                                                          ),
                                                        )
                                                      : Center(
                                                          child: Container(
                                                            width: width * 0.25,
                                                            height:
                                                                height * 0.18,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1),
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    Colors.grey,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: obj.videoooourl ==
                                                                      null
                                                                  ? SizedBox()
                                                                  : VideoPlayerWidget(
                                                                      videoURl: obj
                                                                          .videoooourl!,
                                                                      videoID: obj
                                                                          .videoID!),
                                                            ),
                                                          ),
                                                        )),
                                          lableTextname("Category Type"),
                                          CoolDropdown<String>(
                                            controller: obj.dropdownController,
                                            dropdownList: obj.dropdownItems,
                                            defaultItem:
                                                obj.dropdownItems.first,
                                            isMarquee: true,
                                            dropdownTriangleOptions:
                                                const DropdownTriangleOptions(),
                                            onChange: (a) {
                                              obj.selectedvalue = a;

                                              obj.update();
                                              obj.dropdownController.close();
                                            },
                                            resultOptions: ResultOptions(
                                              width: width * 0.25,
                                              boxDecoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 2,
                                                ),
                                              ),
                                              openBoxDecoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color:
                                                        MyThemeData.background),
                                              ),
                                              textOverflow: TextOverflow.fade,
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              render: ResultRender.all,
                                              icon: SizedBox(
                                                width: 10,
                                                height: 10,
                                                child: CustomPaint(
                                                  painter: DropdownArrowPainter(
                                                      color: MyThemeData
                                                          .background),
                                                ),
                                              ),
                                            ),
                                            dropdownOptions: DropdownOptions(
                                              width: width * 0.25,
                                              align: DropdownAlign.center,
                                            ),
                                            dropdownItemOptions:
                                                DropdownItemOptions(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              selectedBoxDecoration:
                                                  BoxDecoration(
                                                color: MyThemeData.background
                                                    .withOpacity(0.6),
                                              ),
                                              selectedTextStyle:
                                                  const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          lableTextname("Video Type"),
                                          CoolDropdown<String>(
                                            controller: obj.videotypeController,
                                            dropdownList:
                                                obj.videotypedropdownItems,
                                            defaultItem: obj
                                                .videotypedropdownItems.first,
                                            isMarquee: true,
                                            dropdownTriangleOptions:
                                                const DropdownTriangleOptions(),
                                            onChange: (a) {
                                              obj.videotypevalue = a;

                                              obj.update();
                                              obj.videotypeController.close();
                                            },
                                            resultOptions: ResultOptions(
                                              width: width * 0.25,
                                              boxDecoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 2,
                                                ),
                                              ),
                                              openBoxDecoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color:
                                                        MyThemeData.background),
                                              ),
                                              textOverflow: TextOverflow.fade,
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              render: ResultRender.all,
                                              icon: SizedBox(
                                                width: 10,
                                                height: 10,
                                                child: CustomPaint(
                                                  painter: DropdownArrowPainter(
                                                      color: MyThemeData
                                                          .background),
                                                ),
                                              ),
                                            ),
                                            dropdownOptions: DropdownOptions(
                                              width: width * 0.25,
                                              align: DropdownAlign.center,
                                            ),
                                            dropdownItemOptions:
                                                DropdownItemOptions(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              selectedBoxDecoration:
                                                  BoxDecoration(
                                                color: MyThemeData.background
                                                    .withOpacity(0.6),
                                              ),
                                              selectedTextStyle:
                                                  const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          lableTextname("Set the filter tags"),
                                          SizedBox(
                                            width: width * 0.25,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                lableTextname("Difficulty"),
                                                CoolDropdown<String>(
                                                  controller:
                                                      obj.dificultyController,
                                                  dropdownList: obj
                                                      .difficultydropdownItems,
                                                  defaultItem: obj
                                                      .difficultydropdownItems
                                                      .first,
                                                  isMarquee: true,
                                                  dropdownTriangleOptions:
                                                      const DropdownTriangleOptions(),
                                                  onChange: (a) {
                                                    obj.difficultyselectedvalue =
                                                        a;
                                                    obj.update();
                                                    obj.dificultyController
                                                        .close();
                                                  },
                                                  resultOptions: ResultOptions(
                                                    width: width * 0.15,
                                                    boxDecoration:
                                                        BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    openBoxDecoration:
                                                        BoxDecoration(
                                                      border: Border.all(
                                                          width: 2,
                                                          color: MyThemeData
                                                              .background),
                                                    ),
                                                    textOverflow:
                                                        TextOverflow.fade,
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    render: ResultRender.all,
                                                    icon: SizedBox(
                                                      width: 10,
                                                      height: 10,
                                                      child: CustomPaint(
                                                        painter:
                                                            DropdownArrowPainter(
                                                                color: MyThemeData
                                                                    .background),
                                                      ),
                                                    ),
                                                  ),
                                                  dropdownOptions:
                                                      DropdownOptions(
                                                    width: width * 0.15,
                                                    align: DropdownAlign.center,
                                                  ),
                                                  dropdownItemOptions:
                                                      DropdownItemOptions(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    selectedBoxDecoration:
                                                        BoxDecoration(
                                                      color: MyThemeData
                                                          .background
                                                          .withOpacity(0.6),
                                                    ),
                                                    selectedTextStyle:
                                                        const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          SizedBox(
                                            width: width * 0.25,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                lableTextname("Class Type"),
                                                CoolDropdown<String>(
                                                  controller:
                                                      obj.classtypeController,
                                                  dropdownList: obj
                                                      .classtypedropdownItems,
                                                  defaultItem: obj
                                                      .classtypedropdownItems
                                                      .first,
                                                  isMarquee: true,
                                                  dropdownTriangleOptions:
                                                      const DropdownTriangleOptions(),
                                                  onChange: (a) {
                                                    obj.classtypeselectedvalue =
                                                        a;

                                                    obj.update();
                                                    obj.classtypeController
                                                        .close();
                                                  },
                                                  resultOptions: ResultOptions(
                                                    width: width * 0.15,
                                                    boxDecoration:
                                                        BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    openBoxDecoration:
                                                        BoxDecoration(
                                                      border: Border.all(
                                                          width: 2,
                                                          color: MyThemeData
                                                              .background),
                                                    ),
                                                    textOverflow:
                                                        TextOverflow.fade,
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    render: ResultRender.all,
                                                    icon: SizedBox(
                                                      width: 10,
                                                      height: 10,
                                                      child: CustomPaint(
                                                        painter:
                                                            DropdownArrowPainter(
                                                                color: MyThemeData
                                                                    .background),
                                                      ),
                                                    ),
                                                  ),
                                                  dropdownOptions:
                                                      DropdownOptions(
                                                    width: width * 0.15,
                                                    align: DropdownAlign.center,
                                                  ),
                                                  dropdownItemOptions:
                                                      DropdownItemOptions(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    selectedBoxDecoration:
                                                        BoxDecoration(
                                                      color: MyThemeData
                                                          .background
                                                          .withOpacity(0.6),
                                                    ),
                                                    selectedTextStyle:
                                                        const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          SizedBox(
                                            width: width * 0.25,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                lableTextname("Instructor"),
                                                CoolDropdown<String>(
                                                  controller:
                                                      obj.instructorController,
                                                  dropdownList: obj
                                                      .instructordropdownItems,
                                                  defaultItem: obj
                                                      .instructordropdownItems
                                                      .first,
                                                  isMarquee: true,
                                                  dropdownTriangleOptions:
                                                      const DropdownTriangleOptions(),
                                                  onChange: (a) {
                                                    obj.instructorselectedvalue =
                                                        a;

                                                    obj.update();
                                                    obj.instructorController
                                                        .close();
                                                  },
                                                  resultOptions: ResultOptions(
                                                    width: width * 0.15,
                                                    boxDecoration:
                                                        BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    openBoxDecoration:
                                                        BoxDecoration(
                                                      border: Border.all(
                                                          width: 2,
                                                          color: MyThemeData
                                                              .background),
                                                    ),
                                                    textOverflow:
                                                        TextOverflow.fade,
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    render: ResultRender.all,
                                                    icon: SizedBox(
                                                      width: 10,
                                                      height: 10,
                                                      child: CustomPaint(
                                                        painter:
                                                            DropdownArrowPainter(
                                                                color: MyThemeData
                                                                    .background),
                                                      ),
                                                    ),
                                                  ),
                                                  dropdownOptions:
                                                      DropdownOptions(
                                                    width: width * 0.15,
                                                    align: DropdownAlign.center,
                                                  ),
                                                  dropdownItemOptions:
                                                      DropdownItemOptions(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    selectedBoxDecoration:
                                                        BoxDecoration(
                                                      color: MyThemeData
                                                          .background
                                                          .withOpacity(0.6),
                                                    ),
                                                    selectedTextStyle:
                                                        const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          SizedBox(
                                            width: width * 0.25,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                lableTextname("Video Language"),
                                                CoolDropdown<String>(
                                                  controller: obj
                                                      .videolanguageController,
                                                  dropdownList: obj
                                                      .videolanguagedropdownItems,
                                                  defaultItem: obj
                                                      .videolanguagedropdownItems
                                                      .first,
                                                  isMarquee: true,
                                                  dropdownTriangleOptions:
                                                      const DropdownTriangleOptions(),
                                                  onChange: (a) {
                                                    obj.videolanguageselectedvalue =
                                                        a;
                                                    obj.update();
                                                    obj.videolanguageController
                                                        .close();
                                                  },
                                                  resultOptions: ResultOptions(
                                                    width: width * 0.15,
                                                    boxDecoration:
                                                        BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    openBoxDecoration:
                                                        BoxDecoration(
                                                      border: Border.all(
                                                          width: 2,
                                                          color: MyThemeData
                                                              .background),
                                                    ),
                                                    textOverflow:
                                                        TextOverflow.fade,
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    render: ResultRender.all,
                                                    icon: SizedBox(
                                                      width: 10,
                                                      height: 10,
                                                      child: CustomPaint(
                                                        painter:
                                                            DropdownArrowPainter(
                                                                color: MyThemeData
                                                                    .background),
                                                      ),
                                                    ),
                                                  ),
                                                  dropdownOptions:
                                                      DropdownOptions(
                                                    width: width * 0.15,
                                                    align: DropdownAlign.center,
                                                  ),
                                                  dropdownItemOptions:
                                                      DropdownItemOptions(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    selectedBoxDecoration:
                                                        BoxDecoration(
                                                      color: MyThemeData
                                                          .background
                                                          .withOpacity(0.6),
                                                    ),
                                                    selectedTextStyle:
                                                        const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.05,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          lableTextname("Video Name"),
                                          SizedBox(
                                            width: width * 0.25,
                                            child: Textformfield(
                                              controller:
                                                  obj.videonamecontroller,
                                              abscureText: false,
                                              validation: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Video name';
                                                }
                                                return null; // input is valid
                                              },
                                              keyboardtype: TextInputType.name,
                                            ),
                                          ),
                                          lableTextname("Video Description"),
                                          SizedBox(
                                            width: width * 0.25,
                                            child: Textformfield(
                                              maxline: 4,
                                              controller: obj
                                                  .videodescriptioncontroller,
                                              abscureText: false,
                                              validation: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Video Description';
                                                }
                                                return null; // input is valid
                                              },
                                              keyboardtype: TextInputType.name,
                                            ),
                                          ),
                                          lableTextname(
                                              "Duration timeline for video"),
                                          SizedBox(
                                            width: width * 0.25,
                                            child: Textformfield(
                                              controller: obj
                                                  .categorydurationtimelinecontroller,
                                              abscureText: false,
                                              validation: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Duration';
                                                }
                                                return null; // input is valid
                                              },
                                              keyboardtype: TextInputType.name,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.1,
                                          ),
                                          WebButton(
                                            onPressed: () {
                                              if (obj.videofile != null &&
                                                  videoformKey.currentState!
                                                      .validate() &&
                                                  obj.playlistloading ==
                                                      false) {
                                                obj.uploadplaylistToDB(
                                                    obj.videoooourl!,
                                                    obj.videoID!);
                                                obj.update();
                                              } else {
                                                showtoast("fulfill all fields");
                                              }
                                            },
                                            text: 'Upload Video',
                                            color: MyThemeData.background,
                                            width: width * 0.25,
                                          ),
                                          SizedBox(
                                            height: height * 0.06,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                //////////////////////////////
                              ],
                            ),
                          )),
                          obj.uploadplaylistloading == true
                              ? Expanded(
                                  child: Container(
                                    width: width,
                                    height: height,
                                    color: Colors.black.withOpacity(0.1),
                                    child: Center(
                                      child: SpinkitFlutter.spinkit,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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

class VideoPlayerWidget extends StatefulWidget {
  final String videoURl;
  final String videoID;

  const VideoPlayerWidget(
      {super.key, required this.videoURl, required this.videoID});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _videoPlayerController;
  Future<void>? _initializeVideoPlayerFuture;
  bool _isVideoPlaying = false;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // void updateseconds() async {
  //   await firebaseFirestore.collection("videos").doc(widget.videoID).update({
  //     'duration':
  //         '${_videoPlayerController!.value.duration.inMinutes}:${(_videoPlayerController!.value.duration.inSeconds % 60).toString().padLeft(2, '0')}'
  //   });
  //   print(
  //       "seconds   : '${_videoPlayerController!.value.duration.inMinutes}:${(_videoPlayerController!.value.duration.inSeconds % 60).toString().padLeft(2, '0')}'");
  // }

  @override
  void initState() {
    Get.put(AddCtagoryController());
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoURl));
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // updateseconds();
              return AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(_videoPlayerController!),
                    if (!_isVideoPlaying)
                      Center(
                        child: InkWell(
                          onTap: () {
                            AddCtagoryController.my.isvideoplayclick = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerScreen(
                                      videooo: widget.videoURl),
                                ));
                            AddCtagoryController.my.update();
                          },
                          child: const Icon(
                            Icons.play_arrow,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            } else {
              return SizedBox(
                width: width * 0.1,
                height: height * 0.12,
                child: Center(
                  child: SpinkitFlutter.spinkit,
                ),
              );
            }
          }),
    );
  }
}
