import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../endpoint/data/data_respons/acc_detail.dart';
import '../../endpoint/data/data_respons/data_acc.dart';
import '../../endpoint/data/data_respons/json_hutang.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../../modules/konfirmasi_detail/controllers/konfirmasi_detail_controller.dart';
import '../color/appcolor.dart';

class CardKonfirmasiDetail extends GetView<KonfirmasiDetailController> {
  const CardKonfirmasiDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int countOne = 0;
    int countNull = 0;
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
          FutureBuilder<acc_detail>(
            future: API.accdetail(kode_perusahaan_pbf: controller.pbf),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 90,
                        height: 20,
                        padding: EdgeInsets.only(left: 10, right: 20, top: 0, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shammerColor,
                        ),
                        child: Center(
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 90,
                        height: 20,
                        padding: EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shammerColor,
                        ),
                        child: Center(
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.data != null) {
                  final dataAccDetail = snapshot.data!.dataAccDetail;

                  // Iterasi melalui dataAccDetail dan hitung jumlah "1" dan "null"
                  dataAccDetail?.forEach((e) {
                    final status = e.status;
                    if (status == "1") {
                      countOne++;
                    } else if (status == null) {
                      countNull++;
                    }
                  });
                  return Container(
                    margin: EdgeInsets.only(right: 30, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$countNull', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        Text('$countOne', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                } else {
                  return Text('Tidak ada data');
                }
              }
            },
          ),
          Divider(
          ),
        ],
      ),
    );
  }
}