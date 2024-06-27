import 'package:get/get.dart';

import '../../../endpoint/data/data_respons/data_pembayaran.dart';

class PembayaranDetailController extends GetxController {
  //TODO: Implement PembayaranDetailController
  final pbf = Get.parameters['pbf'] as String;
  final count = 0.obs;
  final items = Get.arguments as DataPembayaran;



  void increment() => count.value++;
}
