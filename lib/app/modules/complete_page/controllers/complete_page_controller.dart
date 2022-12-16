import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class CompletePageController extends GetxController {
  //TODO: Implement CompletePageController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Stream<QuerySnapshot> getEntry({required String uuId, required String type}) {
    return FirebaseFirestore.instance
        .collection("complete")
        .doc(uuId)
        .collection("complete")
        .where(
          "type",
          isEqualTo: type,
        )
        .snapshots();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
