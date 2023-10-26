import 'package:get/get.dart';

import '../../../endpoint/data/data_respons/data_acc.dart';
import '../../../endpoint/data/publics.dart';

class HutangDetailController extends GetxController {
  //TODO: Implement HutangDetailController
  final pbf = Get.parameters['pbf'] as String;
  final items = Get.arguments as DataAcc;
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
