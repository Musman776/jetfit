import 'dart:typed_data';

import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/models/instructor_mdel.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class AddCtagoryController extends GetxController {
  static AddCtagoryController get my => Get.find();
  TextEditingController categorynamecontroller = TextEditingController();
  TextEditingController categorydurationtimelinecontroller =
      TextEditingController();

  TextEditingController videodurationtimelinecontroller =
      TextEditingController();
  TextEditingController videonamecontroller = TextEditingController();
  TextEditingController categorydescriptioncontroller = TextEditingController();
  TextEditingController videodescriptioncontroller = TextEditingController();
  TextEditingController categorydayscontroller = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  bool isaddvideoclick = false;
  VideoPlayerController? videoplayerController;
  String? playlistID;
  ChewieController? chewieController;
  final dropdownController = DropdownController();
  final dificultyController = DropdownController();
  final classtypeController = DropdownController();
  final instructorController = DropdownController();
  final videolanguageController = DropdownController();
  final typeController = DropdownController();
  List<CoolDropdownItem<String>> dropdownItems = [];
  List<CoolDropdownItem<String>> difficultydropdownItems = [];
  List<CoolDropdownItem<String>> classtypedropdownItems = [];
  List<CoolDropdownItem<String>> instructordropdownItems = [];
  List<CoolDropdownItem<String>> videolanguagedropdownItems = [];
  List<CoolDropdownItem<String>> typedropdownItems = [];
  bool playlistloading = false;
  bool uploadplaylistloading = false;
  bool categoryloading = false;
  bool isvideoplayclick = true;
  List<String> instructormenuItems = [];

  Future<Uint8List>? thumbnailFuture;

  XFile? videofile;
  String? videoooourl;

  List<String> typeitems = [
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
  String? typeselectedvalue = "Public";
  String? difficultyselectedvalue = "Easy";
  String? classtypeselectedvalue = "Solo";
  String? instructorselectedvalue = "John";
  String? videolanguageselectedvalue = "German";

  void changeisaddvideoclick(bool value) {
    isaddvideoclick = value;
    update();
  }

  void nulluploadvideo() {
    changeisaddvideoclick(false);
    playlistloading = false;
    uploadplaylistloading = false;
    videodescriptioncontroller.clear();
    videonamecontroller.clear();
    if (videofile != null) {
      videofile = null;
    }
    update();
  }

  // void changedropdownselectedvalue(String value, String selectedValue) {
  //   selectedValue = value;
  //   update();
  // }

  String? categoryId;

  void uploadcategoryToDB(String imageUrl, String id) async {
    categoryId = id;
    CategoryModel model = CategoryModel(
      categoryDescription: categorydescriptioncontroller.text,
      categoryID: id,
      categoryName: categorynamecontroller.text,
      playlistType: typeselectedvalue,
      categoryType: selectedvalue,
      thumbnailimageURL: imageUrl,
      categoryTimeline: categorydurationtimelinecontroller.text,
    );
    await firebaseFirestore.collection("category").doc(id).set(model.toMap());
    categoryloading = false;
    update();
    showtoast("category added succesfully");
  }

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
    getinstructorfromdb();
    typedropdownItems.clear();
    dropdownItems.clear();
    categorynamecontroller.clear();
    categorydescriptioncontroller.clear();
    categorydescriptioncontroller.clear();
    categorydurationtimelinecontroller.clear();
    categoryId = null;
    isaddvideoclick = false;
    thumbnailImage = null;
    categoryloading = false;
    playlistloading = false;
    videofile = null;

    for (var i = 0; i < menuItems.length; i++) {
      dropdownItems.add(
        CoolDropdownItem<String>(label: menuItems[i], value: menuItems[i]),
      );
    }
    for (var i = 0; i < typeitems.length; i++) {
      typedropdownItems.add(
        CoolDropdownItem<String>(label: typeitems[i], value: typeitems[i]),
      );
    }
    for (var i = 0; i < difficultymenuItems.length; i++) {
      difficultydropdownItems.add(
        CoolDropdownItem<String>(
            label: difficultymenuItems[i], value: difficultymenuItems[i]),
      );
    }
    for (var i = 0; i < classtypemenuItems.length; i++) {
      classtypedropdownItems.add(
        CoolDropdownItem<String>(
            label: classtypemenuItems[i], value: classtypemenuItems[i]),
      );
    }

    for (var i = 0; i < videolanguagemenuItems.length; i++) {
      videolanguagedropdownItems.add(
        CoolDropdownItem<String>(
            label: videolanguagemenuItems[i], value: videolanguagemenuItems[i]),
      );
    }
  }

  void uploadplaylistToDB(String videoUrl) async {
    uploadplaylistloading = true;
    update();
    PlayListModel model = PlayListModel(
      classType: classtypeselectedvalue,
      dificulty: difficultyselectedvalue,
      duration: '',
      instructor: instructorselectedvalue,
      videoLanguage: videolanguageselectedvalue,
      categoryID: categoryId,
      videoDescription: videodescriptioncontroller.text,
      videoID: playlistID,
      videoName: videonamecontroller.text,
      videoURL: videoUrl,
    );
    await firebaseFirestore
        .collection("category")
        .doc(categoryId)
        .collection("playlist")
        .doc(playlistID)
        .set(model.toMap());
    showtoast("Sucess");
    uploadplaylistloading = false;
    isaddvideoclick = false;
    videofile = null;

    update();
  }

  // Future<void>? initializeVideoPlayerFuture;
  // void initvideoplayer(String url) async {
  //   videoplayerController = VideoPlayerController.networkUrl(Uri.parse(url));
  //   initializeVideoPlayerFuture = videoplayerController!.initialize();
  //   update();
  // }

///////////////////////////////////////
  FirebaseStorage storage = FirebaseStorage.instance;

  ///
  Future<String> uploadVideo(Uint8List unitlist) async {
    String pillly = const Uuid().v4();
    playlistID = pillly;
    Reference storageRef =
        storage.ref().child('category/$categoryId/playlist/$playlistID');
    TaskSnapshot uploadTask = await storageRef.putData(unitlist);
    String url = await uploadTask.ref.getDownloadURL();
    playlistloading = false;
    update();
    return url;
  }

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

  /////////////////////////////////////////
  XFile? thumbnailImage;
  Uint8List? imagebytes;

  void pickImage() async {
    thumbnailImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
    if (thumbnailImage != null) {
      imagebytes = await thumbnailImage!.readAsBytes();
      update();
    }
  }

  void uploadImage(XFile image) async {
    var bytes = await image.readAsBytes();

    String categoryid = const Uuid().v4();
    categoryloading = true;
    update();
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageRef =
        storage.ref().child('category/$categoryid/thumbnailimage$categoryid');
    var uploadTask = await storageRef.putData(bytes);
    await uploadTask.ref.getDownloadURL().then((value) {
      uploadcategoryToDB(value, categoryid);
    });
  }

  void deletevideo(String catID, String playlistID, context) async {
    Reference storageRef =
        storage.ref().child('category/$catID/playlist/$playlistID');
    await storageRef.delete();

    await firebaseFirestore
        .collection("category")
        .doc(catID)
        .collection("playlist")
        .doc(playlistID)
        .delete();
    showtoast("deleted");
    Navigator.pop(context);
  }

  void floatingactionfunction() {
    if (categoryId != null && thumbnailImage != null) {
      videodescriptioncontroller.clear();
      videonamecontroller.clear();
      changeisaddvideoclick(true);
      if (videofile != null) {
        videofile = null;
      }
      playlistloading = false;
      update();
    } else {
      showtoast("Please Save category");
    }
  }
}
