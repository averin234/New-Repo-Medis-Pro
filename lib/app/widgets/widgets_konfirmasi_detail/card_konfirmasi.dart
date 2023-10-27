import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../endpoint/data/data_respons/data_acc.dart';
import '../../endpoint/data/data_respons/json_hutang.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../../modules/konfirmasi_detail/controllers/konfirmasi_detail_controller.dart';

class CardKonfirmasiDetail extends GetView<KonfirmasiDetailController> {
  const CardKonfirmasiDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = controller.items;
    var now = DateTime.now();
    var formattedMonth = DateFormat.MMMM().format(DateTime.now());
    int currentYear = DateTime.now().year;
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
              Text('Periode', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('PBF', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$formattedMonth' + ' $currentYear'),
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
              Text('Menunggu Konfirmasi',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Sudah Konfirmasi',
                style: TextStyle(fontWeight: FontWeight
                    .bold),),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(right: 30, left: 30),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text('$totalHutang', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                // Text('$totalBayar', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
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