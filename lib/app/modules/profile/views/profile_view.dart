import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/widgets_profile/widgets_infoapps.dart';
import '../../../widgets/widgets_profile/widgets_profile.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}
