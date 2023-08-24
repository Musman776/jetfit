import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jetfit/controllers/training_controller.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/view/screens/home01/home_01.dart';
import 'package:jetfit/view/screens/search/search_controller.dart';
import 'package:jetfit/view/screens/trainigng_screen.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';

class VideoSearchScreen extends StatefulWidget {
  const VideoSearchScreen({super.key});

  @override
  State<VideoSearchScreen> createState() => _VideoSearchScreenState();
}

class _VideoSearchScreenState extends State<VideoSearchScreen> {
  var height, width;
  final controller = Get.put(VideoSearchController());
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyThemeData.background,
        body: OrientationBuilder(builder: (context, orientation) {
          return GetBuilder<VideoSearchController>(
            initState: (state) {},
            builder: (controller) {
              return orientation == Orientation.portrait
                  ? portraitMode(orientation)
                  : landscapeMode(orientation);
            },
          );
        }),
      ),
    );
  }

  portraitMode(orientation) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          textFormField(
            hinttext: 'search here',
            controller: controller.searchController,
            keyboardtype: TextInputType.text,
            prefixIcon: Icon(Icons.search),
            abscureText: false,
            onChanged: (value) {
              controller.name = value;
              controller.update();
            },
          ),
          FutureBuilder<List<PlayListModel>>(
            future: TrainingController().fetchplaylistmodel(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<PlayListModel> filteredList = [];

                if (controller.name.isEmpty || controller.name == '') {
                  filteredList = snapshot.data!;
                } else {
                  for (PlayListModel model in snapshot.data!) {
                    if (model.videoName!.toLowerCase().contains(
                        controller.searchController.text.toLowerCase())) {
                      filteredList.add(model);
                    }
                  }
                }

                if (filteredList.isEmpty) {
                  return Expanded(
                    child: Center(child: const Text("No videos")),
                  );
                }

                return Expanded(
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: GridView.builder(
                      itemCount: filteredList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 3,
                      ),
                      itemBuilder: (context, index) {
                        PlayListModel playListModel = filteredList[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeVideoPlayerScreen(
                                  videooo: playListModel,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: height,
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 5,
                                  color: MyThemeData.background,
                                  shadowColor: MyThemeData.onSurface,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: height! * 0.13,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TrainingVideoPlayer(
                                        playListModel: playListModel),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    playListModel.videoName!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(color: MyThemeData.onSurface),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Expanded(child: Text('Error: ${snapshot.error}'));
              } else {
                return Expanded(
                  child: Center(
                    child: WhiteSpinkitFlutter.spinkit,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }

  landscapeMode(orientation) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.03),
      width: width,
      height: height,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.1, top: height * 0.01),
            child: textFormField(
              hinttext: 'search here',
              controller: controller.searchController,
              keyboardtype: TextInputType.text,
              prefixIcon: Icon(Icons.search),
              abscureText: false,
            ),
          ),
          FutureBuilder<List<PlayListModel>>(
              future: TrainingController().fetchplaylistmodel(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data == null
                      ? Expanded(
                          child: Center(
                          child: WhiteSpinkitFlutter.spinkit,
                        ))
                      : snapshot.data!.isEmpty
                          ? Expanded(
                              child: const Center(child: Text("No videos")),
                            )
                          : Expanded(
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: Padding(
                                    padding: orientation == Orientation.portrait
                                        ? const EdgeInsets.all(8.0)
                                        : EdgeInsets.only(left: width! * 0.12),
                                    child: orientation == Orientation.portrait
                                        ? GridView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing: 27,
                                              mainAxisSpacing: 1,
                                              crossAxisCount: 3,
                                            ),
                                            itemCount: snapshot.data!.length,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              PlayListModel playListModel =
                                                  PlayListModel(
                                                classType: snapshot
                                                    .data![index].classType,
                                                categoryID: snapshot
                                                    .data![index].categoryID,
                                                dificulty: snapshot
                                                    .data![index].dificulty,
                                                duration: snapshot
                                                    .data![index].duration,
                                                instructor: snapshot
                                                    .data![index].instructor,
                                                videoDescription: snapshot
                                                    .data![index]
                                                    .videoDescription,
                                                videoID: snapshot
                                                    .data![index].videoID,
                                                videoLanguage: snapshot
                                                    .data![index].videoLanguage,
                                                videoName: snapshot
                                                    .data![index].videoName,
                                                videoURL: snapshot
                                                    .data![index].videoURL,
                                                viewers: snapshot
                                                    .data![index].viewers,
                                              );
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Card(
                                                    elevation: 5,
                                                    shadowColor:
                                                        MyThemeData.onSurface,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Container(
                                                      height: height! * 0.27,
                                                      width: width! * 0.5,
                                                      decoration: BoxDecoration(
                                                        color: MyThemeData
                                                            .background,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: TrainingVideoPlayer(
                                                          playListModel:
                                                              playListModel),
                                                    ),
                                                  ),
                                                  Text(
                                                    playListModel.videoName!,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '${playListModel.duration} | intensity *',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          )
                                        : GridView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing: 27,
                                              mainAxisSpacing: 1,
                                              crossAxisCount: 3,
                                            ),
                                            itemCount: snapshot.data!.length,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              PlayListModel playListModel =
                                                  PlayListModel(
                                                classType: snapshot
                                                    .data![index].classType,
                                                categoryID: snapshot
                                                    .data![index].categoryID,
                                                dificulty: snapshot
                                                    .data![index].dificulty,
                                                duration: snapshot
                                                    .data![index].duration,
                                                instructor: snapshot
                                                    .data![index].instructor,
                                                videoDescription: snapshot
                                                    .data![index]
                                                    .videoDescription,
                                                videoID: snapshot
                                                    .data![index].videoID,
                                                videoLanguage: snapshot
                                                    .data![index].videoLanguage,
                                                videoName: snapshot
                                                    .data![index].videoName,
                                                videoURL: snapshot
                                                    .data![index].videoURL,
                                                viewers: snapshot
                                                    .data![index].viewers,
                                              );
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Card(
                                                    elevation: 5,
                                                    shadowColor:
                                                        MyThemeData.onSurface,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Container(
                                                      height: height! * 0.27,
                                                      width: width! * 0.5,
                                                      decoration: BoxDecoration(
                                                        color: MyThemeData
                                                            .background,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: TrainingVideoPlayer(
                                                          playListModel:
                                                              playListModel),
                                                    ),
                                                  ),
                                                  Text(
                                                    playListModel.videoName!,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '${playListModel.duration} | intensity *',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          )),
                              ),
                            );
                } else if (snapshot.hasError) {
                  return Expanded(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Expanded(
                    child: Center(
                      child: WhiteSpinkitFlutter.spinkit,
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}

class textFormField extends StatelessWidget {
  final String? hinttext;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardtype;
  final TextInputAction? inputaction;
  final String? Function(String?)? validation;
  final bool abscureText;
  final int? maxline;
  void Function(String)? onChanged;
  final TextEditingController? controller;
  textFormField({
    Key? key,
    this.maxline,
    this.hinttext,
    this.inputaction,
    this.onChanged,
    this.keyboardtype,
    this.prefixIcon,
    this.suffixIcon,
    this.validation,
    this.controller,
    required this.abscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: abscureText,
      onChanged: onChanged,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.black,
      keyboardType: keyboardtype,
      maxLines: maxline,
      autofocus: false,
      textInputAction: inputaction,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: const TextStyle(color: Colors.black),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 10),
        border: InputBorder.none,
        filled: true,
        prefixIcon: prefixIcon,
        suffix: suffixIcon,
        fillColor: Colors.grey.shade200,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyThemeData.background,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyThemeData.redColour,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyThemeData.redColour,
            width: 2,
          ),
        ),
      ),
      validator: validation,
    );
  }
}
