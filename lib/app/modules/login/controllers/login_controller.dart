import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../endpoint/data/data_respons/act_login.dart';
import '../../../endpoint/data/fetch_data.dart';

class LoginController extends GetxController {
  final TextEditingController kodeUserController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final API fetchData = API();
  final count = 0.obs;
  var response = 0.obs;

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
