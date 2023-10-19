import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../color/appcolor.dart';

class KonfirmasiCard extends GetView<KonfirmasiController> {
  const KonfirmasiCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child : Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text('Data Listing ACC Pembayaran'),
          Text('Berdasarkan Distributor March 2019'),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text('Menunggu Konfirmasi'),
            SizedBox(
              width: 10,
            ),
            Text('Sudah Konfirmasi'),
          ],),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('10.000',style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: 100,
              ),
              Text('20.000',style: TextStyle(fontWeight: FontWeight.bold)),
            ],),
          SizedBox(
            height: 20,
          ),
        ],),
    );
  }
}