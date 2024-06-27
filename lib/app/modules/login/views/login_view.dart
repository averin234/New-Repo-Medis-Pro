import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/widgets_login/card_form_login.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView( child:
      Column(
        children: [
          LoginForm(),
        ],
        ),
      ),
    );
  }
}
