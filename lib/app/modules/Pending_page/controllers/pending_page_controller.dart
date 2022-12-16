import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_dimond/constent.dart';
import 'package:test_dimond/main.dart';

class PendingPageController extends GetxController {
  String id = "";
  String carat = "";
  String dalalName = "";
  String partyName = "";
  String pricePrCarat = "";
  String type = "";
  String discount = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void completeDetailsToFirestore() async {
    try {
      String uuid = box.read(StringConstants.uuid);
      String updateId = await FirebaseFirestore.instance
          .collection("complete")
          .doc(uuid)
          .collection("complete")
          .doc()
          .id;
      removeData();
      await FirebaseFirestore.instance
          .collection("complete")
          .doc(uuid)
          .collection("complete")
          .doc(updateId)
          .set({
        "carat": carat,
        "caratprice": pricePrCarat,
        "PartyName": partyName,
        "discount": discount,
        "DalalName": dalalName,
        "type": type,
        "uuid": updateId,
      }).then((value) {
        Fluttertoast.showToast(msg: "Data complete successful");
        Get.back();
      }).catchError((e) {
        print("Error:-" + e.toString());
      });
    } on FirebaseAuthException catch (error) {}

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {
      super.onClose();
    }
  }

  void removeData() async {
    try {
      String uuid = box.read(StringConstants.uuid);
      await FirebaseFirestore.instance
          .collection("Pending")
          .doc(uuid)
          .collection("Pending")
          .doc(id)
          .delete()
          .whenComplete(() => print('Note item deleted from the database'))
          .catchError((e) {
        print("Error:-" + e.toString());
      });
    } on FirebaseAuthException catch (error) {}

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {
      super.onClose();
    }
  }

  Stream<QuerySnapshot> getEntry({required String uuId, required String type}) {
    return FirebaseFirestore.instance
        .collection("Pending")
        .doc(uuId)
        .collection("Pending")
        .where(
          "type",
          isEqualTo: type,
        )
        .snapshots();
  }
}
