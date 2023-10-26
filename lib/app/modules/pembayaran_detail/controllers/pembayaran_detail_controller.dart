import 'package:get/get.dart';

import '../../../endpoint/data/data_respons/bayar_detail.dart';

class PembayaranDetailController extends GetxController {
  //TODO: Implement PembayaranDetailController
  final pbf = Get.parameters['pbf'] as String;
  final count = 0.obs;
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

  void increment() => count.value++;
}
