import 'package:get/get.dart';

import '../controllers/complete_page_controller.dart';

class CompletePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompletePageController>(
      () => CompletePageController(),
    );
  }
}
