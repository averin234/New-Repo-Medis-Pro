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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
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
          Text('PT Averin Informatika', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.contentColorBlue1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Detail', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            children: [
            CircleAvatar(
              backgroundImage: AssetImage(Assets.imagesDownload),
              radius: 40,
            ),
            SizedBox(
              width: 10,),
             Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(
                    width: 90,
                  child : Text('Hutang')
                  ),
                  Text(': Rp.'),
                  Text('1.000.000')
                ],),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(
                      width: 90,
                      child : Text('Sudah Bayar ')
                  ),
                  Text(': Rp.'),
                  Text('1.000.000')
                ],),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(
                      width: 90,
                      child : Text('Jumlah PO')
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