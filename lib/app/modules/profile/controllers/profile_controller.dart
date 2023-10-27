import 'package:get/get.dart';
import 'package:medispro/app/endpoint/data/local_storage.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
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

  void logout() async {await LocalStorages.deleteToken; Get.offAllNamed(Routes.LOGIN);}

}
