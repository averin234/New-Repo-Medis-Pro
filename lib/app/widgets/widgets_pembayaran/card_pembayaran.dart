import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../endpoint/data/data_respons/data_pembayaran.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang/views/hutang_view.dart';
import '../../modules/pembayaran/controllers/pembayaran_controller.dart';
import '../color/appcolor.dart';

class CardPembayaran extends GetView<PembayaranController> {
  const CardPembayaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedMonth = DateFormat.MMMM().format(DateTime.now());
    int currentYear = DateTime.now().year;
    return FutureBuilder<data_pembayaran>(
      future: API.pembayaran(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                Text('Data Hutang Bedasarkan Distributor'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Per Bulan '),
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Jumlah Sudah Dibayar', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 30, left: 30),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Rp. '),
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
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final totalHutang = snapshot.data!.totalHutang;// Ambil data bayar dari objek respons.
            return  Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                  Text('Data Hutang Bedasarkan Distributor'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Per Bulan '),
                      Text('$formattedMonth' + ' $currentYear', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Jumlah Sudah Dibayar', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 30),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rp. '),
                        Text('$totalHutang'+',00', style: TextStyle(color: Colors.green),),
                      ],
                    ),
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
