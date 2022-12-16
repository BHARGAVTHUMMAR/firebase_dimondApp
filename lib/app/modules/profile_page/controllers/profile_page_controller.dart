import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_dimond/app/routes/app_pages.dart';
import 'package:test_dimond/constent.dart';
import 'package:test_dimond/main.dart';

class ProfilePageController extends GetxController {
  String name = "demo";
  @override
  void onInit() {
    super.onInit();
  }

  void signOut() {
    FirebaseAuth.instance.signOut().then((value) {
      box.erase();
      box.write(StringConstants.IsLogIn, false);
      Get.offAndToNamed(Routes.LOG_IN);
    });
    User? user = FirebaseAuth.instance.currentUser;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
