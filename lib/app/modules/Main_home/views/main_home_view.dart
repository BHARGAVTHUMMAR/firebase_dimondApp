import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_dimond/app/routes/app_pages.dart';
import 'package:test_dimond/color_constant.dart';

import '../controllers/main_home_controller.dart';

class MainHomeView extends GetView<MainHomeController> {
  const MainHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainHomeController>(
      init: MainHomeController(),
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.toNamed(Routes.ADD_DETA);
              },
              child: Icon(Icons.add),
              elevation: 0,
              backgroundColor: appTheme.primaryTheme),
        );
      },
    );
  }
}
