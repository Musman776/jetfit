import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChallengeController extends GetxController{
  static ChallengeController get instance => Get.find();

  Rx<PickedFile> pickedImage = PickedFile('').obs;
  Rx<PickedFile> pickedVideo = PickedFile('').obs;
}