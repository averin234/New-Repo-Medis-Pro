import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../modules/profile/controllers/profile_controller.dart';
import '../../routes/app_pages.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);
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
              SizedBox(
                height: 10,
              ),
            ],
          ),
          confirm: InkWell(
            onTap:controller.logout,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue
              ),
              child : Center(
                child : Text('Keluar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        );
      },
      // controller.logout,
      child : Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.only(
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
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
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
