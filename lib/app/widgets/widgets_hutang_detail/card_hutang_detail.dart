import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../endpoint/data/data_respons/data_acc.dart';
import '../../endpoint/data/data_respons/json_hutang.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang_detail/controllers/hutang_detail_controller.dart';

class CardHutangDetail extends GetView<HutangDetailController> {
  const CardHutangDetail({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = controller.items;
    return  Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      margin: EdgeInsets.only(top: 30, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 70,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Periode'),
              Text('PBF'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Desember 2023'),
              Row(children: [
                Text('', textAlign: TextAlign.center),
                Text(items.namaPerusahaan!, textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
              ],
              ),
            ],
          ),
          Divider(
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tagihan Terbayar', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Jumlah Tagihan', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Text('Rp. ',),
                  Text(items.totalBayar!, style: TextStyle(color: Colors.green),),
                  ],
                ),
                Row(children: [
                  Text('Rp. ', textAlign: TextAlign.center),
                  Text(items.totalHarga!, textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
                ],
                ),
              ],
            ),
          ),
          Divider(
          ),
        ],
      ),
    );
  }
}
