import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:medispro/app/endpoint/data/local_storage.dart';
import 'package:package_info/package_info.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final _packageName = ''.obs;
  String get packageName => _packageName.value;

  late final DeviceInfoPlugin deviceInfo;

  @override
  void onInit() async {
    super.onInit();

    deviceInfo = DeviceInfoPlugin();
    final androidInfo = (GetPlatform.isAndroid)
        ? await deviceInfo.androidInfo
        : AndroidDeviceInfo;
    final packageInfo = (GetPlatform.isAndroid)
        ? await PackageInfo.fromPlatform()
        : PackageInfo(
      appName: '',
      packageName: '',
      version: '',
      buildNumber: '',
    );
    _packageName.value = packageInfo.version;
  }
  final count = 0.obs;
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
