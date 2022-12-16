import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_dimond/app/modules/Main_home/views/main_home_view.dart';
import 'package:test_dimond/app/modules/Pending_page/views/pending_page_view.dart';
import 'package:test_dimond/app/modules/complete_page/views/complete_page_view.dart';
import 'package:test_dimond/app/modules/profile_page/views/profile_page_view.dart';
import 'package:test_dimond/color_constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            key: controller.bottomNavigationKey.value,
            index: 0,
            height: 60,
            items: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.home,
                    color: controller.page.value == 0
                        ? Color.fromARGB(255, 255, 255, 255)
                        : appTheme.primaryTheme),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.padding_outlined,
                    color: controller.page.value == 1
                        ? Color.fromARGB(255, 255, 255, 255)
                        : appTheme.primaryTheme),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.incomplete_circle,
                    color: controller.page.value == 2
                        ? Color.fromARGB(255, 255, 255, 255)
                        : appTheme.primaryTheme),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.person_search_sharp,
                    color: controller.page.value == 3
                        ? Color.fromARGB(255, 255, 255, 255)
                        : appTheme.primaryTheme),
              ),
            ],
            color: Color.fromARGB(255, 245, 245, 245),
            buttonBackgroundColor: appTheme.primaryTheme,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            onTap: (index) {
              controller.page.value = index;
            },
            letIndexChange: (index) => true,
          ),
          body: [
            MainHomeView(),
            PendingPageView(),
            CompletePageView(),
            ProfilePageView()
          ].elementAt(controller.page.value));
    });
  }
}
