import 'package:get/get.dart';

import '../controllers/add_deta_controller.dart';

class AddDetaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDetaController>(
      () => AddDetaController(),
    );
  }
}
