import 'package:get/get.dart';

import '../controllers/hutang_detail_controller.dart';

class HutangDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HutangDetailController>(
      () => HutangDetailController(),
    );
  }
}
