import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jetfit/web_view/auth/login_screen/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final fireStorageRef = FirebaseStorage.instance;

  CollectionReference collection =
      FirebaseFirestore.instance.collection('User');
  RxBool isLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  String profileImage = '';

  Map<String, dynamic>? userInfo;
  var selectedImage = Rx<XFile?>(null);
  var userId = '';
  String url = '';

  Future<void> getUserInfo({required String id}) async {
    isLoading.value = true;

    DocumentSnapshot<Map<String, dynamic>> snapshot = await collection
        .doc(id)
        .get() as DocumentSnapshot<Map<String, dynamic>>;
    if (snapshot.exists) {
      userInfo = snapshot.data();
      nameController.text = userInfo!['name'];
      emailController.text = userInfo!['email'];
      statusController.text = userInfo!['status'];
      roleController.text = userInfo!['role'];
      profileImage = userInfo!['imageURL'];
      update();
      print(userInfo);
      isLoading.value = false;
    } else {
      print('User not found');
    }
  }

  void getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('UserId');
    userId = id ?? '';
    getUserInfo(id: userId);

    print('UserId =======$id');
  }

  void getGalleryImage() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      selectedImage.value = pickImage;
      update();
    }
  }

  void getCameraImage() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickImage != null) {
      selectedImage.value = pickImage;
      update();
    }
  }

  void uploadImage() async {
    Reference storageref =
        FirebaseStorage.instance.ref("Images").child("$userId");
    TaskSnapshot uploadtask =
        await storageref.putFile(File(selectedImage.value!.path));
    url = await uploadtask.ref.getDownloadURL();

    await collection
        .doc(userId)
        .update({'imageURL': url})
        .then((value) => {
              Fluttertoast.showToast(msg: 'save'),
            })
        .onError((error, stackTrace) => {
              Fluttertoast.showToast(msg: 'Failed'),
            });
    Get.off(LoginScreen());
  }
}
