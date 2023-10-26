import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../generated/assets.dart';
import '../../endpoint/data/data_respons/data_pembayaran.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang/controllers/hutang_controller.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../../modules/pembayaran/controllers/pembayaran_controller.dart';
import '../../routes/app_pages.dart';
import '../color/appcolor.dart';
  class PembayaranList extends StatelessWidget {
  final DataPembayaran items;

  const PembayaranList(
  {super.key,required this.items});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PembayaranController());
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
              Text(items.namaPerusahaan!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () async {
                  Get.toNamed(Routes.PEMBAYARAN_DETAIL,parameters: { "pbf" : items.kodePerusahaanPbf ?? ''}, arguments: items);
                },
                child:Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.contentColorBlue1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Detail', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(items.foto!
                ),
                radius: 40,
              ),
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
                          width: 90,
                          child : Text('Terbayar')
                      ),
                      Text(': Rp.'),
                      Text(items.totalHarga!, style: TextStyle(color: Colors.green),)
                    ],),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    SizedBox(
                        width: 90,
                        child : Text('Jumlah PO')
                    ),
                    Text(': '),
                    Text(items.jumPesan!.toString())
                  ],),
                ],),
            ],)
        ],),
    );
  }
}