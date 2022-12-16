import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_dimond/constent.dart';
import 'package:test_dimond/sizeConstant.dart';

import '../../../../main.dart';

class AddDetaController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late SingleValueDropDownController selectClass;
  Rx<TextEditingController> cacaratController = TextEditingController().obs;
  Rx<TextEditingController> dalalController = TextEditingController().obs;
  Rx<TextEditingController> partycontroller = TextEditingController().obs;
  Rx<TextEditingController> discountcontroller = TextEditingController().obs;
  Rx<TextEditingController> cacaratpriceController =
      TextEditingController().obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  bool isFromPurchase = false;
  String id = "";
  String updateId = "";
  var EditData;
  @override
  void onInit() {
    selectClass = SingleValueDropDownController();
    if (!isNullEmptyOrFalse(Get.arguments)) {
      isFromPurchase = Get.arguments[StringConstants.isFromPurchase];
      if (!isNullEmptyOrFalse(isFromPurchase)) {
        EditData = Get.arguments[StringConstants.editData];
        if (!isNullEmptyOrFalse(EditData)) {
          cacaratController.value.text = EditData["carat"];
          discountcontroller.value.text = EditData["discount"];
          cacaratpriceController.value.text = EditData["caratprice"];
          partycontroller.value.text = EditData["PartyName"];
          dalalController.value.text = EditData["DalalName"];
          updateId = EditData["uuid"];
          selectClass.dropDownValue = DropDownValueModel(
              name: EditData["type"], value: EditData["type"]);
        }
      }
    }

    super.onInit();
  }

  void postDetailsToFirestore() async {
    if (formKey.currentState!.validate()) {
      try {
        String uuid = box.read(StringConstants.uuid);
        id = FirebaseFirestore.instance
            .collection("Pending")
            .doc(uuid)
            .collection("Pending")
            .doc()
            .id;
        box.write(StringConstants.updateid, id);
        await firebaseFirestore
            .collection("Pending")
            .doc(uuid)
            .collection("Pending")
            .doc(id)
            .set({
          "carat": cacaratController.value.text,
          "caratprice": cacaratpriceController.value.text,
          "PartyName": partycontroller.value.text,
          "discount": discountcontroller.value.text,
          "DalalName": dalalController.value.text,
          "type": selectClass.dropDownValue!.value,
          "uuid": id,
        }).then((value) {
          Fluttertoast.showToast(msg: "Data Add successful");
          Get.back();
        }).catchError((e) {
          print("Error:-" + e.toString());
        });
      } on FirebaseAuthException catch (error) {}
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

  void UpdateDetailsToFirestore() async {
    if (formKey.currentState!.validate()) {
      try {
        String uuid = box.read(StringConstants.uuid);
        await firebaseFirestore
            .collection("Pending")
            .doc(uuid)
            .collection("Pending")
            .doc(updateId)
            .update({
          "carat": cacaratController.value.text,
          "caratprice": cacaratpriceController.value.text,
          "PartyName": partycontroller.value.text,
          "discount": discountcontroller.value.text,
          "DalalName": dalalController.value.text,
          "type": selectClass.dropDownValue!.value,
        }).then((value) {
          Fluttertoast.showToast(msg: "Data Update successful");
          Get.back();
        }).catchError((e) {
          print("Error:-" + e.toString());
        });
      } on FirebaseAuthException catch (error) {}
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
}
