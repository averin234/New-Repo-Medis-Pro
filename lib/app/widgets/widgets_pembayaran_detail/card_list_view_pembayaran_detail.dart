import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../generated/assets.dart';
import '../../endpoint/data/data_respons/acc_detail.dart';
import '../../endpoint/data/data_respons/bayar_detail.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang/controllers/hutang_controller.dart';
import '../../modules/hutang_detail/controllers/hutang_detail_controller.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../../modules/pembayaran_detail/controllers/pembayaran_detail_controller.dart';
import '../color/appcolor.dart';

class ListPembayaranDetail extends GetView<PembayaranDetailController> {
  ListPembayaranDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bayar_detail>(
      future: API.bayardetail(kode_perusahaan_pbf: controller.pbf),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final namaPerusahaan = snapshot.data!..dataBayarDetail; // Ambil data hutang dari objek respons.
            return Column(children: snapshot.data!.dataBayarDetail!.map((e) {
              final totalHarga = e!.totalHarga; // Ambil data hutang dari objek respons.
              final noInvoice = e!.noInvoice; // Ambil data bayar dari objek respons.
              final tglInvoice = e!.tglInvoice; // Ambil data bayar dari objek respons.
              final status = e!.status; // Ambil data bayar dari objek respons.
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green.shade500,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            Icon(Icons.check_circle_rounded, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                              Text('Terbayar Lunas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ],)
                          ],),
                      ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('No. Invoice', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                        Text(' : ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        Text('$noInvoice ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              SizedBox(
                                  width: 90,
                                  child : Text('Tanggal Bayar')
                              ),
                              Text(': '),
                              Text('$tglInvoice')
                            ],),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              SizedBox(
                                  width: 90,
                                  child : Text('Jumlah')
                              ),
                              Text(': Rp.'),
                              Text('$totalHarga')
                            ],),
                            SizedBox(
                              height: 10,
                            ),
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