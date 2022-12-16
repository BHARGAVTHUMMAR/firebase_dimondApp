import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_dimond/app/routes/app_pages.dart';
import 'package:test_dimond/constent.dart';
import 'package:test_dimond/main.dart';

class SingupPageController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> mailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  String? errorMessage;
  @override
  void onInit() {
    super.onInit();
  }

  void signUp(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore(value)})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore(UserCredential user) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    box.write(StringConstants.uuid, user.user!.uid);
    await firebaseFirestore.collection("users").doc(user.user!.uid).set({
      "Name": nameController.value.text,
      "email": mailController.value.text,
      "Password": passwordController.value.text,
    }).then((value) {
      box.write(StringConstants.IsLogIn, true);
      Get.offAndToNamed(Routes.HOME);
    });
    Fluttertoast.showToast(msg: "Account created successfully");
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
