import 'package:get/get.dart';

import '../controllers/konfirmasi_detail_controller.dart';

class KonfirmasiDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonfirmasiDetailController>(
      () => KonfirmasiDetailController(),
    );
  }
}
