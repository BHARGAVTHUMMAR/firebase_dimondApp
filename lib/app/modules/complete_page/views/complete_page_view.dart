import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_dimond/app/routes/app_pages.dart';
import 'package:test_dimond/color_constant.dart';
import 'package:test_dimond/constent.dart';
import 'package:test_dimond/main.dart';

import '../controllers/complete_page_controller.dart';

class CompletePageView extends GetView<CompletePageController> {
  const CompletePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompletePageController>(
      init: CompletePageController(),
      builder: (controller) {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: appTheme.primaryTheme,
                title: Text("complete"),
                bottom: TabBar(indicatorColor: Colors.white, tabs: [
                  Tab(
                    child: Text(
                      "Purchase",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Sale",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
              ),
              body: TabBarView(children: [
                StreamBuilder(
                  builder: (context, AsyncSnapshot<QuerySnapshot> data) {
                    if (data.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (data.hasError) {
                      return Text("Error");
                    } else {
                      return ListView.builder(
                        itemCount: data.data!.docs.length,
                        itemBuilder: (context, index) {
                          var Data = data.data!.docs[index];
                          return ListDataWidgets(
                            carat: Data["carat"],
                            dalalName: Data["DalalName"],
                            partyName: Data["PartyName"],
                            pricePrCarat: Data["caratprice"],
                            onTap: () {
                              Get.toNamed(Routes.ADD_DETA, arguments: {
                                StringConstants.isFromPurchase: true,
                                StringConstants.editData:
                                    data.data!.docs[index],
                              });
                            },
                          );
                        },
                      );
                    }
                  },
                  stream: controller.getEntry(
                      uuId: box.read(StringConstants.uuid), type: "Purchase"),
                ),
                StreamBuilder(
                  builder: (context, AsyncSnapshot data) {
                    if (data.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (data.hasError) {
                      return Text("Error");
                    } else {
                      return ListView.builder(
                        itemCount: data.data!.docs.length,
                        itemBuilder: (context, index) {
                          var Data = data.data!.docs[index];
                          return ListDataWidgets(
                            carat: Data["carat"],
                            dalalName: Data["DalalName"],
                            partyName: Data["PartyName"],
                            pricePrCarat: Data["caratprice"],
                            onTap: () {
                              Get.toNamed(Routes.ADD_DETA, arguments: {
                                StringConstants.isFromPurchase: true,
                                StringConstants.editData:
                                    data.data!.docs[index],
                              });
                            },
                          );
                        },
                      );
                    }
                  },
                  stream: controller.getEntry(
                      uuId: box.read(StringConstants.uuid), type: "Sale"),
                ),
              ]),
            ));
      },
    );
  }

  ListDataWidgets(
      {String? partyName,
      String? dalalName,
      String? carat,
      VoidCallback? onTap,
      String? pricePrCarat}) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: [
            Icon(Icons.diamond_sharp, size: 50),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Party name:- ${partyName}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Dalal name:- ${dalalName}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  "Carat:- ${carat}" ?? "",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  "Price per Carat:- ${pricePrCarat} ₹ " ?? "",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Icon(Icons.edit_note, size: 35),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
