import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_dimond/color_constant.dart';
import 'package:test_dimond/sizeConstant.dart';
import 'package:test_dimond/text_field.dart';

import '../controllers/add_deta_controller.dart';

class AddDetaView extends GetView<AddDetaController> {
  const AddDetaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Add Data"),
            elevation: 0,
            backgroundColor: appTheme.primaryTheme,
          ),
          body: Container(
            height: MySize.screenHeight,
            width: MySize.screenWidth,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                          child: Form(
                              key: controller.formKey,
                              child: Column(children: [
                                Space.height(20),
                                getDropDownTextField(
                                  controller: controller.selectClass,
                                  hintText: "Purchase/Sale",
                                  validation: (val) {
                                    if (val!.isEmpty) {
                                      return "Please Select Option";
                                    }
                                    return null;
                                  },
                                  list: const [
                                    DropDownValueModel(
                                        name: 'Purchase', value: "Purchase"),
                                    DropDownValueModel(
                                      name: 'Sale',
                                      value: "Sale",
                                    ),
                                  ],
                                ),
                                Space.height(20),
                                getTextField(
                                    labelText: "Enter Carat",
                                    textInputType: TextInputType.number,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please Enter carat";
                                      }
                                      return null;
                                    },
                                    textEditingController:
                                        controller.cacaratController.value),
                                Space.height(20),
                                getTextField(
                                    labelText: "Enter Carat/price",
                                    textInputType: TextInputType.number,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please Enter carat/price";
                                      }
                                      return null;
                                    },
                                    textEditingController: controller
                                        .cacaratpriceController.value),
                                Space.height(20),
                                getTextField(
                                    labelText: "discount",
                                    textInputType: TextInputType.number,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please Enter discount";
                                      }
                                      return null;
                                    },
                                    textEditingController:
                                        controller.discountcontroller.value),
                                Space.height(20),
                                getTextField(
                                    labelText: "Enter dalal",
                                    textInputType: TextInputType.text,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please Enter dalal";
                                      }
                                      return null;
                                    },
                                    textEditingController:
                                        controller.dalalController.value),
                                Space.height(20),
                                getTextField(
                                    labelText: "Enter Party",
                                    textInputType: TextInputType.text,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please Enter Party";
                                      }
                                      return null;
                                    },
                                    textEditingController:
                                        controller.partycontroller.value),
                                Space.height(40),
                                GestureDetector(
                                  onTap: () {
                                    if (controller.isFromPurchase) {
                                      controller.UpdateDetailsToFirestore();
                                    } else {
                                      controller.postDetailsToFirestore();
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Center(child: Text("Submit")),
                                    decoration: BoxDecoration(
                                        color: appTheme.primaryTheme,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                )
                              ])))),
                ],
              ),
            ),
          )),
    );
  }
}

Widget getDropDownTextField(
    {required SingleValueDropDownController? controller,
    required List<DropDownValueModel> list,
    ValueSetter? onChange,
    Widget? prefix,
    double borderRadius = 200,
    FormFieldValidator<String>? validation,
    required String hintText}) {
  return DropDownTextField(
    // initialValue: "name4",
    controller: controller,
    clearOption: false,
    enableSearch: false,
    validator: validation,
    textFieldDecoration: InputDecoration(
      contentPadding: EdgeInsets.only(
        left: 20,
        top: 18,
        right: 0,
        bottom: 18,
      ),
      // fillColor: appTheme.textGrayColor,
      prefixIcon: prefix,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      filled: true,

      labelStyle: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: appTheme.primaryTheme,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      border: const OutlineInputBorder(),
    ),
    // dropDownItemCount: 6,
    dropDownList: list,
    onChanged: onChange,
  );
}
