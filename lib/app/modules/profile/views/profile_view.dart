import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../widgets/widgets_profile/widgets_infoapps.dart';
import '../../../widgets/widgets_profile/widgets_infoversi.dart';
import '../../../widgets/widgets_profile/widgets_logout.dart';
import '../../../widgets/widgets_profile/widgets_profile.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      Get.defaultDialog(
        title: 'Keluar dari Aplikasi',
        content: Column(
          children: [
            Image.asset(
              Assets.imagesShop,
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
          onTap: () async{
            SystemNavigator.pop();
          },
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
      return true;
    },
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child:
      Column(
        children: [
          CardProfile(),
          Disclaimer(),
          // InfoVersion(),
          Logout(),
          ],
        ),
      ),
      ),
    );
  }
}
