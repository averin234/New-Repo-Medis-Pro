import 'package:get/get.dart';

import '../../../endpoint/data/data_respons/bayar_detail.dart';
import '../../../endpoint/data/data_respons/data_pembayaran.dart';

class PembayaranDetailController extends GetxController {
  //TODO: Implement PembayaranDetailController
  final pbf = Get.parameters['pbf'] as String;
  final count = 0.obs;
  final items = Get.arguments as DataPembayaran;
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
