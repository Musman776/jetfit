import 'package:get/get.dart';
import 'package:jetfit/utilis/static_data.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';

import '../web_view/home_screen/dashboard_screen/dashboard_controller.dart';

class FavouriteController extends GetxController {
  static FavouriteController get my => Get.find();
  bool isclick = false;

  void removetofavourite(PlayListModel playListMode) async {
    print(" oiegu  ${Staticdata.uid}");
    await firebaseFirestore
        .collection("Favourite")
        .doc(Staticdata.uid)
        .collection("UserFavourites")
        .doc(playListMode.videoID)
        .delete();
    showtoast("${playListModel.videoName} remove from favourite");
    isclick = false;
    update();
  }

  PlayListModel playListModel = PlayListModel();
  void videoclickModel(PlayListModel model) {
    playListModel = model;
    update();
    isclick = true;
    update();
  }
}
