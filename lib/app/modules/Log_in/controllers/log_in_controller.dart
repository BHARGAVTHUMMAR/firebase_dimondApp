import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_dimond/app/routes/app_pages.dart';
import 'package:test_dimond/constent.dart';
import 'package:test_dimond/main.dart';

class LogInController extends GetxController {
  Rx<TextEditingController> mailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  FocusNode mailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? errorMessage;
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  void logIn(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        await auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  print(uid.user!.email),
                  box.write(StringConstants.uuid, uid.user!.uid),
                  //getdata from databse
                  FirebaseFirestore.instance
                      .collection('users')
                      .get()
                      .then((value) {
                    box.write(StringConstants.IsLogIn, true);
                    Get.offAndToNamed(Routes.HOME);
                  }),
                  Fluttertoast.showToast(msg: "Login Successful"),
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid.user!.uid)
                      .update({"Password": password})
                      .then((_) => Get.offAndToNamed(Routes.HOME))
                      .catchError((error) => print('Update failed: $error')),
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
        print(error.message);
      }
    }
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
