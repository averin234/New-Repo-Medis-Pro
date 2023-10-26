import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../generated/assets.dart';
import '../../endpoint/data/data_respons/data_pembayaran.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../../modules/pembayaran/controllers/pembayaran_controller.dart';
import '../color/appcolor.dart';

class PembayaranList extends GetView<PembayaranController> {
  const PembayaranList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<data_pembayaran>(
      future: API.pembayaran(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final pembayaran = snapshot.data!..dataPembayaran; // Ambil data hutang dari objek respons.
            return Column(children: snapshot.data!.dataPembayaran!.map((e) {
              final namapersu = e!.namaPerusahaan; // Ambil data hutang dari objek respons.
              final fotopt = e!.foto; // Ambil data hutang dari objek respons.
              final totalHarga = e!.totalHarga; // Ambil data hutang dari objek respons.
              final jumPesan = e!.jumPesan; // Ambil data bayar dari objek respons.
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
                        Text('$namapersu', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                          backgroundImage: NetworkImage('$fotopt'
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
                                Text('$totalHarga', style: TextStyle(color: Colors.green),)
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
                              Text('$jumPesan')
                            ],),
                          ],),
                      ],)
                  ],),
              );},
            ).toList(),);

          } else {
            return Text('Tidak ada data');
          }
        }
      },
    );
  }
}