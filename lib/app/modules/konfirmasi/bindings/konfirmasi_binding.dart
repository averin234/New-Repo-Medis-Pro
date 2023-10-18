import 'package:get/get.dart';

import '../controllers/konfirmasi_controller.dart';

class KonfirmasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonfirmasiController>(
      () => KonfirmasiController(),
    );
  }
}
