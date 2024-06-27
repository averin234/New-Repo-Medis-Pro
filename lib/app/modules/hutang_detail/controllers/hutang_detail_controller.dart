import 'package:get/get.dart';

import '../../../endpoint/data/data_respons/data_acc.dart';

class HutangDetailController extends GetxController {
  //TODO: Implement HutangDetailController
  final pbf = Get.parameters['pbf'] as String;
  final items = Get.arguments as DataAcc;
  final count = 0.obs;



  void increment() => count.value++;
}
