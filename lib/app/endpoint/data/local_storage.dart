

import 'package:get_storage/get_storage.dart';
import 'package:medispro/app/endpoint/data/publics.dart';


class LocalStorages {
  static GetStorage boxToken = GetStorage('token-medispro');
  static Future<void> setToken(String token) async {
    await boxToken.write('token', token);
    Publics.controller.getToken.value = LocalStorages.getToken;
    return;
  }

  static String get getToken => boxToken.listenable.value['token'] ?? '';

  static Future<void> get deleteToken async {
    await boxToken.remove('token');
  Publics.controller.getToken.value = LocalStorages.getToken;}
}
