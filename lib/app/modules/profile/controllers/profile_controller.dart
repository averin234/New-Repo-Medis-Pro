import 'package:get/get.dart';
import 'package:medispro/app/endpoint/data/local_storage.dart';

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

  Future<void> get logout async => await LocalStorages.deleteToken;
}
