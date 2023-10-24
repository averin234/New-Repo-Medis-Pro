import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../generated/assets.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../color/appcolor.dart';

class KonfirmasiList extends GetView<KonfirmasiController> {
  const KonfirmasiList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                Text('No. Invoice', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text(' : ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text('009/9876/2022 ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Konfirmasi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            children: [
            SizedBox(
              width: 10,),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(
                    width: 110,
                  child : Text('Tanggal Invoice')
                  ),
                  Text(': '),
                  Text('23/08/2023')
                ],),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(
                      width: 110,
                      child : Text('Jatuh Tempo ')
                  ),
                  Text(': '),
                  Text('23/09/2023')
                ],),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(
                      width: 110,
                      child : Text('Jumlah Hutang')
                  ),
                  Text(': Rp.'),
                  Text('1.000.000')
                ],),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(
                      width: 110,
                      child : Text('Jumalah Bayar')
                  ),
                  Text(': Rp.'),
                  Text('1.000.000')
                ],),
            ],),
          ],)
        ],),
    );
  }
}