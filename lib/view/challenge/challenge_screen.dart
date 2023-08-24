import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/view/screens/home01/home_01.dart';
import 'package:jetfit/view/screens/video_player.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';

class ChallengeScreen extends StatefulWidget {
  final PlayListModel? videoModal;

  const ChallengeScreen({
    this.videoModal,
    super.key,
  });

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  var height, width;
  XFile? _pickedImage;
  XFile? _pickedVideo;

  @override
  Widget build(BuildContext context) {
    print("Scafflold rebuild ====================");
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          height: height,
          width: width,
          color: MyThemeData.background,
          child: orientation == Orientation.portrait
              ? Stack(
                  children: [
                    Container(
                      height: height,
                      width: width,
                      child: Home01VideoPlayer(
                          isIcon: false, playListModel: widget.videoModal!),
                    ),
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.65),
                            Colors.black.withOpacity(0.65),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.85),
                            Colors.black.withOpacity(0.9),
                            MyThemeData.background,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: height * 0.4,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.1),
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.videoModal!.classType.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      widget.videoModal!.videoName.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.06,
                                      ),
                                    ),
                                    Text(
                                      widget.videoModal!.videoDescription
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            widget.videoModal!.duration
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            widget.videoModal!.dificulty
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            widget.videoModal!.instructor
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: width * 0.4,
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Text(
                                    //         "Days",
                                    //         style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: width * 0.025,
                                    //         ),
                                    //       ),
                                    //       Text(
                                    //         "Intensity",
                                    //         style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: width * 0.025,
                                    //         ),
                                    //       ),
                                    //       Text(
                                    //         "Minutes per day",
                                    //         style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: width * 0.025,
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      VideoPlayerScreen(
                                                          videooo: widget
                                                              .videoModal!),
                                                ));
                                          },
                                          child: Container(
                                            height: height * 0.05,
                                            width: width * 0.35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image(
                                                  image: AssetImage(
                                                      'images/training/play_arrow_24px.png'),
                                                ),
                                                Text(
                                                  "Start session",
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      MyThemeData.surface,
                                                  title: Text('Feedback',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  content: StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                showModalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: <Widget>[
                                                                        ListTile(
                                                                          leading:
                                                                              Icon(Icons.image),
                                                                          title:
                                                                              Text('Pick Image'),
                                                                          onTap:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                            final pickedImage =
                                                                                await ImagePicker().pickImage(source: ImageSource.gallery);
                                                                            setState(() {
                                                                              _pickedImage = pickedImage;
                                                                              _pickedVideo = null;
                                                                            });
                                                                          },
                                                                        ),
                                                                        ListTile(
                                                                          leading:
                                                                              Icon(Icons.video_library),
                                                                          title:
                                                                              Text('Pick Video'),
                                                                          onTap:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                            final pickedVideo =
                                                                                await ImagePicker().pickVideo(source: ImageSource.gallery);
                                                                            setState(() {
                                                                              _pickedVideo = pickedVideo;
                                                                              _pickedImage = null;
                                                                            });
                                                                          },
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: _pickedImage !=
                                                                      null
                                                                  ? CircleAvatar(
                                                                      backgroundColor:
                                                                          MyThemeData
                                                                              .primary80,
                                                                      radius:
                                                                          50,
                                                                      backgroundImage:
                                                                          FileImage(
                                                                              File(_pickedImage!.path)),
                                                                    )
                                                                  : _pickedVideo !=
                                                                          null
                                                                      ? CircleAvatar(
                                                                          backgroundColor:
                                                                              MyThemeData.primary80,
                                                                          radius:
                                                                              50,
                                                                          child:
                                                                              Icon(Icons.play_arrow),
                                                                        )
                                                                      : CircleAvatar(
                                                                          backgroundColor:
                                                                              MyThemeData.primary80,
                                                                          radius:
                                                                              50,
                                                                          child:
                                                                              Icon(Icons.photo_camera),
                                                                        ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.05,
                                                            ),
                                                            TextFormField(
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    width *
                                                                        0.033,
                                                              ),
                                                              autofillHints: const [
                                                                AutofillHints
                                                                    .name
                                                              ],
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: true,
                                                                fillColor:
                                                                    MyThemeData
                                                                        .background,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2),
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                  ),
                                                                ),
                                                                hintText:
                                                                    'Title',
                                                                hintStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      width *
                                                                          0.033,
                                                                ),
                                                              ),
                                                              validator:
                                                                  (String? v) {
                                                                if (v!
                                                                    .isEmpty) {
                                                                  return 'Please enter your E-mail';
                                                                }
                                                                return null;
                                                              },
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.05,
                                                            ),
                                                            TextFormField(
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .done,
                                                              maxLines: 5,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    width *
                                                                        0.033,
                                                              ),
                                                              autofillHints: const [
                                                                AutofillHints
                                                                    .name
                                                              ],
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: true,
                                                                fillColor:
                                                                    MyThemeData
                                                                        .background,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2),
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                  ),
                                                                ),
                                                                hintText:
                                                                    'Description',
                                                                hintStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      width *
                                                                          0.033,
                                                                ),
                                                              ),
                                                              validator:
                                                                  (String? v) {
                                                                if (v!
                                                                    .isEmpty) {
                                                                  return 'Required Field';
                                                                }
                                                                return null;
                                                              },
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(); // Close the dialog
                                                      },
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text('Add'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: height * 0.05,
                                            width: width * 0.35,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
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
                                        )
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     const Text(
                                    //       "Weekly plan",
                                    //       style: TextStyle(
                                    //         color: Colors.grey,
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       width: width * 0.01,
                                    //     ),
                                    //     const Image(
                                    //       image: AssetImage(
                                    //           'images/training/arrowback.png'),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: height,
                        width: width,
                        color: MyThemeData.background,
                        child: Stack(
                          children: [
                            Container(
                              height: height,
                              width: width,
                              child: Home01VideoPlayer(
                                  isIcon: false,
                                  playListModel: widget.videoModal!),
                            ),
                            Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  transform: GradientRotation(-35),
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.black.withOpacity(0.65),
                                    Colors.black.withOpacity(0.75),
                                    Colors.black.withOpacity(0.8),
                                    Colors.black.withOpacity(0.9),
                                    Colors.black.withOpacity(0.95),
                                    MyThemeData.background,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: width * 0.15,
                                  top: height * 0.12,
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: height * 0.75,
                                    width: width * 0.6,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.videoModal!.classType
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          widget.videoModal!.videoName
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.035,
                                          ),
                                        ),
                                        Text(
                                          widget.videoModal!.videoDescription
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: width * 0.02,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.22,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                widget.videoModal!.duration
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.02,
                                                ),
                                              ),
                                              Text(
                                                widget.videoModal!.dificulty
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.02,
                                                ),
                                              ),
                                              Text(
                                                widget.videoModal!.instructor
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.02,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: width * 0.27,
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Text(
                                        //         "Days",
                                        //         style: TextStyle(
                                        //           fontSize: width * 0.015,
                                        //           color: Colors.white,
                                        //         ),
                                        //       ),
                                        //       Text(
                                        //         "Intensity",
                                        //         style: TextStyle(
                                        //           fontSize: width * 0.015,
                                        //           color: Colors.white,
                                        //         ),
                                        //       ),
                                        //       Text(
                                        //         "Minutes per day",
                                        //         style: TextStyle(
                                        //           fontSize: width * 0.015,
                                        //           color: Colors.white,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          VideoPlayerScreen(
                                                              videooo: widget
                                                                  .videoModal!),
                                                    ));
                                              },
                                              child: Container(
                                                height: height * 0.09,
                                                width: width * 0.15,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
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
                                                          'images/training/play_arrow_24px.png'),
                                                    ),
                                                    Text(
                                                      "Start session",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.03,
                                            ),
                                            Container(
                                              height: height * 0.09,
                                              width: width * 0.2,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
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
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     const Text(
                                        //       "Weekly plan",
                                        //       style: TextStyle(
                                        //         color: Colors.grey,
                                        //       ),
                                        //     ),
                                        //     SizedBox(
                                        //       width: width * 0.01,
                                        //     ),
                                        //     const Image(
                                        //       image: AssetImage(
                                        //           'images/training/arrowback.png'),
                                        //     ),
                                        //   ],
                                        // ),
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
                  ],
                ),
        );
      }),
    );
  }

  void _showImagePickerBottomSheet(BuildContext context) {}
}
