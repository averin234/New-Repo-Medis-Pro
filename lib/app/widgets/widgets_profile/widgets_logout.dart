import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../modules/profile/controllers/profile_controller.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: 'Logout Dari Aplikasi',
          content: Column(
            children: [
              Image.asset(
                Assets.imagesLogout,
                gaplessPlayback: true,
                fit: BoxFit.fitHeight,
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          confirm: InkWell(
            onTap:controller.logout,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue
              ),
              child : const Center(
                child : Text('Keluar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        );
      },
      // controller.logout,
      child : Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 70,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
