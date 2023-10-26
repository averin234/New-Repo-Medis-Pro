import 'package:get/get.dart';

import '../controllers/pembayaran_detail_controller.dart';

class PembayaranDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranDetailController>(
      () => PembayaranDetailController(),
    );
  }
}
