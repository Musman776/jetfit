import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/models/user_model.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:get/get.dart';

class ManageFAvouriteController extends GetxController {
  static ManageFAvouriteController get my => Get.find();
  TextEditingController searchusercontroller = TextEditingController();

  String name = '';

  bool is_edit_favourite_click = false;
  UserModel? userModel;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void deleteUser(String userID, String favID, context) async {
    await firebaseFirestore
        .collection("Favourite")
        .doc(userID)
        .collection("UserFavourites")
        .doc(favID)
        .delete();
    Navigator.pop(context);
    showtoast("deleted");
  }

  void manageFavouritetap(UserModel model) async {
    is_edit_favourite_click = true;
    userModel = model;
    name = '';
    searchusercontroller.clear();
    update();
  }
}
