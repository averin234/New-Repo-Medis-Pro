import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../endpoint/data/data_respons/data_acc.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';

class CardKonfirmasi extends GetView<KonfirmasiController> {
  const CardKonfirmasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<data_acc>(
      future: API.acc(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final totalHutang = snapshot.data!.totalHutang; // Ambil data hutang dari objek respons.
            final totalBayar = snapshot.data!.totalBayar; // Ambil data bayar dari objek respons.
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
                  Text('Data Listing ACC Pembayaran'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Bedasarkan Disributor '),
                      Text('Desember 2019',
                          style: TextStyle(fontWeight: FontWeight
                              .bold)),
                    ],
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
                        Text('$totalHutang', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                        Text('$totalBayar', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
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