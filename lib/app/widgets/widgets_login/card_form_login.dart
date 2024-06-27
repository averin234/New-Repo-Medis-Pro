import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medispro/app/endpoint/data/fetch_data.dart';

import '../../endpoint/data/data_respons/act_login.dart';
import '../../modules/login/controllers/login_controller.dart';
import '../../routes/app_pages.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 70,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Form login', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 70,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              decoration: const BoxDecoration(),
              margin: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 0),
              height: 60,
              child: Column(
                children: [
                  TextField(
                    cursorColor: Colors.grey,
                    controller: controller.kodeUserController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Kode Perusahaan',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 70,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              decoration: const BoxDecoration(),
              margin: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 0),
              height: 60,
              child: Column(
                children: [
                  TextField(
                    cursorColor: Colors.grey,
                    controller: controller.usernameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'User Name',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 70,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              decoration: const BoxDecoration(),
              margin: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
              height: 60,
              child: Column(
                children: [
                  TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    cursorColor: Colors.grey,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.send_rounded,
              color: Colors.green,
              size: 20.0,
            ),
            label: const Text('Login'),
            onPressed: () async {
              if (controller.passwordController.text.isNotEmpty && controller.passwordController.text.isNotEmpty) {
                act_login aksesPX = await API.login(
                  kodeUser: controller.kodeUserController.text,
                  username: controller.usernameController.text,
                  password: controller.passwordController.text,
                );

                if (aksesPX.code == 200) {
                  if (aksesPX.kodePerusahaan != null) {
                    // Jika kode_perusahaan ada dalam respons dan bukan null, navigasi ke HOME
                    Get.offAllNamed(Routes.HOME);
                  }
                }
              } else {
                Get.snackbar('404', 'Username dan Password harus diisi');
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
