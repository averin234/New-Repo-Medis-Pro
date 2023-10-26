import 'package:get/get.dart';

import '../../../endpoint/data/publics.dart';

class HutangDetailController extends GetxController {
  //TODO: Implement HutangDetailController
  final data_acc = Publics.controller.getToken;
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
