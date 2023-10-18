import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../widgets/card/card_konfirmasi.dart';
import '../../../widgets/card/card_list_view_konfirmasi.dart';
import '../../../widgets/chart/pie_cart.dart';
import '../../../widgets/color/appcolor.dart';
import '../controllers/konfirmasi_controller.dart';

class KonfirmasiView extends GetView<KonfirmasiController> {
  const KonfirmasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        title: const Text('Konfirmasi', style: TextStyle(color: AppColors.contentColorBlue1,)),
      ),
      body: SingleChildScrollView(
       child: Column(children: [
         KonfirmasiCard(),
         KonfirmasiList(),
         KonfirmasiList(),
         KonfirmasiList(),
         KonfirmasiList(),
         KonfirmasiList(),
         KonfirmasiList(),
         KonfirmasiList(),
       ]),
        ),
      );
  }
}


