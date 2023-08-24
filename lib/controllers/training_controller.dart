import 'package:get/get.dart';
import 'package:jetfit/utilis/static_data.dart';
import 'package:jetfit/utilis/utilis.dart';
import 'package:jetfit/web_view/home_screen/dashboard_screen/dashboard_controller.dart';
import 'package:jetfit/web_view/home_screen/video_screen/add_catagory/add_catagory_model.dart';

class TrainingController extends GetxController {
  static TrainingController get to => Get.find();

  final category = [
    'Workout',
    'Series',
    'Challenges',
    'Routines'
  ];
  int index = 0;
  bool isFilterOpen = false;

  bool isclick = false;
  bool isSortOpen = false;
  String filter = "";

  changePage(int n) {
    index = n;
    update();
  }

  openFilter(bool v) {
    isFilterOpen = v;
    update();
  }

  sortFilter(bool v) {
    isSortOpen = v;
    update();
  }

  filterChange(String f) {
    filter = f;
    update();
  }

  Future<List<PlayListModel>> fetchplaylistmodel() async {
    List<PlayListModel> l = [];
    l.clear();
    l = DashboardController.to.trainingList;
    update();
    return l;
  }

  void addtofavourite(PlayListModel playListMode) async {
    print(" oiegu  ${Staticdata.uid}");
    await firebaseFirestore
        .collection("Favourite")
        .doc(Staticdata.uid)
        .collection("UserFavourites")
        .doc(playListMode.videoID)
        .set(playListModel.toMap());
    showtoast("${playListModel.videoName} added to favourite");
    isclick = false;
    update();
  }

  PlayListModel playListModel = PlayListModel();
  void videoclickModel(PlayListModel model) {
    print(" oiegu  ${Staticdata.uid}");

    playListModel = model;
    update();
    isclick = true;
    update();
  }
}
