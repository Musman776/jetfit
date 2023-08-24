import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VideoSearchController extends GetxController {
  static VideoSearchController get instance => Get.find();

  TextEditingController searchController = TextEditingController();

  String name = '';
}
