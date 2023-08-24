import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jetfit/models/instructor_mdel.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class AddVideoController extends GetxController {
  static AddVideoController get my => Get.find();
  TextEditingController categorydurationtimelinecontroller =
      TextEditingController();
  bool playlistloading = false;

  TextEditingController videonamecontroller = TextEditingController();
  TextEditingController videodescriptioncontroller = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  bool isaddvideoclick = false;
  VideoPlayerController? videoplayerController;
  bool uploadplaylistloading = false;
  String? videoID;
  XFile? videofile;

  final dropdownController = DropdownController();
  final dificultyController = DropdownController();
  final classtypeController = DropdownController();
  final instructorController = DropdownController();
  final videolanguageController = DropdownController();
  final videotypeController = DropdownController();
  List<CoolDropdownItem<String>> dropdownItems = [];
  List<CoolDropdownItem<String>> videotypedropdownItems = [];
  List<CoolDropdownItem<String>> difficultydropdownItems = [];
  List<CoolDropdownItem<String>> classtypedropdownItems = [];
  List<CoolDropdownItem<String>> instructordropdownItems = [];
  List<CoolDropdownItem<String>> videolanguagedropdownItems = [];
  bool categoryloading = false;
  bool isvideoplayclick = true;

  List<String> instructormenuItems = [];

  List<String> videotypeItems = [
    "Public",
    "Premium",
    "Exclusive",
  ];
  List<String> menuItems = [
    "Workout",
    "Challenges",
    "Routines",
    "Series",
  ];
  List<String> difficultymenuItems = [
    "Easy",
    "Hard",
    "Medium",
  ];
  List<String> classtypemenuItems = [
    "Solo",
    "Duo",
    "Group",
  ];

  List<String> videolanguagemenuItems = [
    "German",
    "English",
    "Russian",
  ];
  String? selectedvalue = "Workout";
  String? difficultyselectedvalue = "Easy";
  String? videotypevalue = "Public";
  String? classtypeselectedvalue = "Solo";
  String? instructorselectedvalue = 'john';
  String? videolanguageselectedvalue = "German";

  List<InstructorModel> instructormodellist = [];
  void getinstructorfromdb() async {
    instructormenuItems.clear();
    instructormodellist.clear();

    await firebaseFirestore.collection("instructors").get().then((value) {
      for (var element in value.docs) {
        InstructorModel model = InstructorModel.fromMap(element.data());

        instructormodellist.add(model);
        // print("list ${instructormodellist.length}");
      }

      for (var n in instructormodellist) {
        instructormenuItems.add(n.name!);
        update();
      }

      for (var i = 0; i < instructormenuItems.length; i++) {
        instructordropdownItems.add(
          CoolDropdownItem<String>(
              label: instructormenuItems[i], value: instructormenuItems[i]),
        );
      }
      print("instructormenuItems ${instructordropdownItems.length}");
    });
  }

  void initstatefunctions() {
    categorydurationtimelinecontroller.clear();
    videodescriptioncontroller.clear();
    videonamecontroller.clear();
    isaddvideoclick = false;
    categoryloading = false;
    playlistloading = false;
    videofile = null;
  }

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadVideo(Uint8List unitlist) async {
    videoID = const Uuid().v4();

    Reference storageRef = storage.ref().child('video/$videoID');
    TaskSnapshot uploadTask = await storageRef.putData(unitlist);
    String url = await uploadTask.ref.getDownloadURL();
    playlistloading = false;
    update();
    return url;
  }

  String? videoooourl;

  void pickVideo() async {
    videofile = null;
    playlistloading = true;
    update();
    videofile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    update();
    if (videofile != null) {
      var videoBytes = await videofile!.readAsBytes();
      videoooourl = await uploadVideo(videoBytes);

      update();
    } else {
      print("falsseeeeeee");
      playlistloading = false;
      update();
    }
  }

  void uploadplaylistToDB(String videoUrl, String videoID) async {
    uploadplaylistloading = true;
    update();
    VideossModel model = VideossModel(
      videotype: videotypevalue,
      viewers: null,
      classType: classtypeselectedvalue,
      dificulty: difficultyselectedvalue,
      duration: categorydurationtimelinecontroller.text,
      instructor: instructorselectedvalue,
      videoLanguage: videolanguageselectedvalue,
      catagorytpe: selectedvalue,
      videoDescription: videodescriptioncontroller.text,
      videoID: videoID,
      videoName: videonamecontroller.text,
      videoURL: videoUrl,
    );
    await firebaseFirestore
        .collection("videos")
        .doc(videoID)
        .set(model.toMap());
    showtoast("Sucess");
    uploadplaylistloading = false;

    categorydurationtimelinecontroller.clear();
    videodescriptioncontroller.clear();
    videonamecontroller.clear();
    isaddvideoclick = false;
    categoryloading = false;
    playlistloading = false;
    videofile = null;

    update();
  }
}
