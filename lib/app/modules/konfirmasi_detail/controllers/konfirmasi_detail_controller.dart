import 'package:get/get.dart';

import '../../../endpoint/data/data_respons/data_acc.dart';

class KonfirmasiDetailController extends GetxController {
  //TODO: Implement KonfirmasiDetailController
  final pbf = Get.parameters['pbf'] as String;
  final items = Get.arguments as DataAcc;
  // final jumlah = Get.arguments as DataAccDetail;
  final count = 0.obs;



  void increment() => count.value++;
}
