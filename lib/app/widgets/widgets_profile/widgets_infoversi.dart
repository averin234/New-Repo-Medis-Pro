import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../modules/profile/controllers/profile_controller.dart';

class InfoVersion extends StatelessWidget {
  const InfoVersion({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Versi Aplikasi ${controller.packageName}')
      ],
    ),
    );
  }
}
