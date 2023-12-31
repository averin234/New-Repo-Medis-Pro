import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../endpoint/data/data_respons/bayar_detail.dart';
import '../../endpoint/data/data_respons/data_acc.dart';
import '../../endpoint/data/data_respons/data_pembayaran.dart';
import '../../endpoint/data/data_respons/json_hutang.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang_detail/controllers/hutang_detail_controller.dart';
import '../../modules/pembayaran_detail/controllers/pembayaran_detail_controller.dart';
import '../color/appcolor.dart';

class CardPembayaranDetail extends GetView<PembayaranDetailController> {
  const CardPembayaranDetail({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = controller.items;
    var now = DateTime.now();
    var formattedMonth = DateFormat.MMMM().format(DateTime.now());
    int currentYear = DateTime.now().year;
    return FutureBuilder<bayar_detail>(
      future: API.bayardetail(kode_perusahaan_pbf: controller.pbf),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
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
                    Container(
                      width: 90,
                      height: 20,
                      padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.shammerColor,
                      ),
                      child: Center(
                      ),
                    ),
                    Row(children: [
                      Text('Rp. ', textAlign: TextAlign.center),
                      Container(
                        width: 90,
                        height: 20,
                        padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shammerColor,
                        ),
                        child: Center(
                        ),
                      ),
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
                      Container(
                        width: 90,
                        height: 20,
                        padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shammerColor,
                        ),
                        child: Center(
                        ),
                      ),
                      Row(children: [
                        Text('Rp. ', textAlign: TextAlign.center),
                        Container(
                          width: 90,
                          height: 20,
                          padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.shammerColor,
                          ),
                          child: Center(
                          ),
                        ),
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
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final jumlahParsial = snapshot.data!.jumlahParsial; // Ambil data hutang dari objek respons.
            final jumlahLunas = snapshot.data!.jumlahLunas; // Ambil data bayar dari objek respons.
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
                      Text('Tagihan Terbayar', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Jumlah Tagihan', style: TextStyle(fontWeight: FontWeight.bold),),
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
                        Text('$jumlahParsial', textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
                        Text('$jumlahLunas', textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
                      ],
                    ),
                  ),

                  Divider(
                  ),
                ],
              ),
            );
          } else {
            return Text('Tidak ada data');
          }
        }
      },
    );
  }
}
