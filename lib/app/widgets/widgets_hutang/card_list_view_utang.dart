import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:medispro/app/routes/app_pages.dart';

import '../../../generated/assets.dart';
import '../../endpoint/data/data_respons/acc_detail.dart';
import '../../endpoint/data/data_respons/data_acc.dart';
import '../../endpoint/data/data_respons/data_acc.dart';
import '../../endpoint/data/data_respons/json_hutang.dart';
import '../../endpoint/data/data_respons/json_hutang.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang/controllers/hutang_controller.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../color/appcolor.dart';


  class CardListViewUtang extends StatelessWidget {
  final DataAcc items;

  const CardListViewUtang(
  {super.key,required this.items});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HutangController());
    return  Container(
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
                  Get.toNamed(Routes.HUTANG_DETAIL,parameters: { "pbf" : items.kodePerusahaanPbf ?? ''}, arguments: items);

                },
                child: Container(
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
                backgroundImage: NetworkImage(items.foto!,
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
                          child : Text('Hutang')
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
                        child : Text('Sudah Bayar ')
                    ),
                    Text(': Rp.'),
                    Text(items.totalBayar!, style: TextStyle(color: Colors.green),)
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
                    Text(items.jumPesan!.toString(),)
                  ],),
                ],),
            ],)
        ],),
    );
  }
}