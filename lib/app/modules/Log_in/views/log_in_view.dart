import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_dimond/app/routes/app_pages.dart';
import 'package:test_dimond/color_constant.dart';
import 'package:test_dimond/sizeConstant.dart';
import 'package:test_dimond/text_field.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn '),
        backgroundColor: appTheme.primaryTheme,
        centerTitle: true,
      ),
      body: Container(
        height: MySize.screenHeight,
        width: MySize.screenWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Space.height(150),
                  Center(
                      child: Text(
                    "Log In",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appTheme.primaryTheme,
                        fontSize: 25),
                  )),
                  Space.height(50),
                  getTextField(
                      textEditingController: controller.mailController.value,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: appTheme.primaryTheme,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      labelText: "Email",
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Email";
                        }
                        return null;
                      },
                      hintText: "Enter Email here"),
                  SizedBox(
                    height: MySize.getHeight(40),
                  ),
                  getTextField(
                    labelText: "Password",
                    textEditingController: controller.passwordController.value,
                    validation: (val) {
                      if (val!.isEmpty) {
                        return "Please enter password";
                      } else if (val.length < 6) {
                        return "Digits must be greater than 6 character";
                      }
                      return null;
                    },
                  ),
                  Space.height(50),
                  GestureDetector(
                    onTap: () {
                      controller.logIn(controller.mailController.value.text,
                          controller.passwordController.value.text);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: appTheme.primaryTheme,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Space.height(30),
                  GestureDetector(
                      onTap: () {
                        Get.offAndToNamed(Routes.SINGUP_PAGE);
                      },
                      child: Center(
                          child: Text(
                        "Sing Up?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: appTheme.primaryTheme),
                      ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
