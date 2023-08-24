import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/models/user_model.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ManageUserController extends GetxController {
  static ManageUserController get my => Get.find();
  TextEditingController searchusercontroller = TextEditingController();
  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  final dropdownController = DropdownController();
  List<CoolDropdownItem<String>> dropdownItems = [];
  List<CoolDropdownItem<String>> firstitem = [];

  String? imageURL;
  String name = '';
  XFile? profileImage;

  Uint8List? imagebytes;
  bool imageloading = false;
  bool updateLoading = false;
  bool is_edit_user_click = false;
  String? image;
  UserModel? userModel;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String? selectedvalue;
  List<String> menuItems = [
    "free user",
    "premium user",
  ];

  void deleteUser(String userID, context) async {
    Reference refrence =
        FirebaseStorage.instance.ref().child("UserProfile/$userID");
    await refrence.delete();

    await firebaseFirestore.collection("User").doc(userID).delete();
    Navigator.pop(context);
    showtoast("deleted");
  }

  void edituserclick(UserModel model) async {
    profileImage = null;
    update();
    dropdownItems.clear();

    for (var i = 0; i < menuItems.length; i++) {
      dropdownItems.add(
        CoolDropdownItem<String>(label: menuItems[i], value: menuItems[i]),
      );
    }
    firstitem.clear();
    firstitem
        .addAll(dropdownItems.where((element) => element.value == model.role));

    is_edit_user_click = true;
    userModel = model;
    usernamecontroller.text = model.name!;
    useremailcontroller.text = model.email!;
    image = model.imageURL;
    selectedvalue = model.role;

    update();
  }

  void updateuser(String userID) async {
    updateLoading = true;
    update();

    if (imageloading == true) {
      showtoast("Uploading in progress");
      updateLoading = false;
      update();
    } else {
      await firebaseFirestore.collection("User").doc(userID).update(
        {
          'name': usernamecontroller.text,
          'email': useremailcontroller.text,
          'role': selectedvalue,
        },
      );
      showtoast("successfully saved");
      updateLoading = false;
      is_edit_user_click = false;
      update();
    }
  }

  void pickImage(UserModel model) async {
    imageloading = true;
    update();
    profileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (profileImage != null) {
      imagebytes = await profileImage!.readAsBytes();
      updateprofilepicture(model);
    } else {
      imageloading = false;
      update();
    }
  }

  void updateprofilepicture(UserModel model) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    Reference reference = storage.ref().child("UserProfile/${model.id}");

    UploadTask uploadTask = reference.putData(imagebytes!);

    await uploadTask.whenComplete(() => null);

    String imageUrl = await reference.getDownloadURL();

    await FirebaseFirestore.instance.collection('User').doc(model.id).set(
      {
        'imageURL': imageUrl,
      },
      SetOptions(merge: true),
    );

    showtoast("prfile updated successfully");
    imageloading = false;
    is_edit_user_click = false;
    update();
  }

  void deletepic(UserModel model, context) async {
    updateLoading = true;
    update();
    if (model.imageURL == null && profileImage == null) {
      showtoast("Already deleted");
      updateLoading = false;
      update();
      Navigator.pop(context);
    } else {
      profileImage = null;
      update();
      Reference refrence =
          FirebaseStorage.instance.ref().child("UserProfile/${model.id}");
      await refrence.delete();

      await FirebaseFirestore.instance.collection('User').doc(model.id).set(
        {
          'imageURL': null,
        },
        SetOptions(merge: true),
      );

      showtoast("Deleted Succesfully");
      updateLoading = false;
      Navigator.pop(context);
      update();
    }
  }
}
