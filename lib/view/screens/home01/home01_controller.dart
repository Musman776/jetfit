import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home01Controller extends GetxController {
  static Home01Controller get my => Get.find();
  int? catindex;
  bool? value;
  CategoryModel? model;
  Stream<QuerySnapshot<Map<String, dynamic>>>? categoriesStream;
  void getVisit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getBool("check");
  }

  void setVisit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getBool("check");
    value = null;
    if (value == null) {
      value = false;
      update();
      prefs.setBool("check", false);
    } else if (value == false) {
      prefs.setBool("check", true);
    }
  }

  Future<void> getcatagories() async {
    categoriesStream =
        await FirebaseFirestore.instance.collection('category').snapshots();
    await FirebaseFirestore.instance.collection('category').get().then((value) {
      if (value.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> firstDocument = value.docs.first;
        CategoryModel firstCategory =
            CategoryModel.fromMap(firstDocument.data()!);
        print("First Category ID: ${firstCategory.categoryID}");
        fetchPlaylistForCategory(firstCategory.categoryID!);
      }
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? playlistSnapshot;
  Future<void> fetchPlaylistForCategory(String categoryId) async {
    playlistSnapshot = await FirebaseFirestore.instance
        .collection("category")
        .doc(categoryId)
        .collection("playlist")
        .snapshots();
    update();
  }

  void onCategoryTap(String categoryId) {
    fetchPlaylistForCategory(categoryId);
    update();
  }

  void videoview(String categoryId, String playlistId, String uid) async {
    var ref = FirebaseFirestore.instance
        .collection("category")
        .doc(categoryId)
        .collection("playlist")
        .doc(playlistId);
    print("  iuguy   ");
    var refdoc = await ref.get();
    var viewers = List<String>.from(refdoc.get('viewers') ?? []);

    int updateindex = viewers.indexWhere((element) => element == uid);
    if (updateindex != -1) {
      viewers[updateindex] = uid;
      update();
    } else {
      viewers.add(uid);
    }

    print("  iuguy   $viewers");

    await ref.update(
      {'viewers': viewers},
    );
  }
}
