import 'package:get/get.dart';
import 'package:jetfit/models/user_model.dart';
import 'package:jetfit/utilis/static_data.dart';
import 'package:jetfit/utilis/utilis.dart';

import '../web_view/home_screen/dashboard_screen/dashboard_controller.dart';

class DashBoardController extends GetxController {
  static DashBoardController get my => Get.find();
  bool isIconclick = false;
  int index = 0;

  Future getusermodel(
    String uid,
  ) async {
    Staticdata.uid = uid;
    firebaseFirestore.collection("User").doc(uid).get().then((value) {
      if (value.data() == null) {
        showtoast("Invalid Signin !");
      } else {
        Staticdata.userModel = UserModel.fromMap(value.data()!);
        print(" Staticdata.userModel ${Staticdata.userModel}");
      }
    });
  }
}
