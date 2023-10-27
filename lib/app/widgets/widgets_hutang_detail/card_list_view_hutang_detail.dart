import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../generated/assets.dart';
import '../../endpoint/data/data_respons/acc_detail.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang/controllers/hutang_controller.dart';
import '../../modules/hutang_detail/controllers/hutang_detail_controller.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../color/appcolor.dart';
import '../widgets_hutang/list_shammer_hutang.dart';
import 'list_shammer_hutang_detail.dart';

class ListUtangDetail extends GetView<HutangDetailController> {
  ListUtangDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<acc_detail>(
      future: API.accdetail(kode_perusahaan_pbf: controller.pbf),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SingleChildScrollView(child:
            Column(children: [
                ListshimmerHutangDetail(),
                ListshimmerHutangDetail(),
                ListshimmerHutangDetail(),
                ListshimmerHutangDetail(),
            ]),);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final namaPerusahaan = snapshot.data!..dataAccDetail; // Ambil data hutang dari objek respons.
            return Column(children: snapshot.data!.dataAccDetail!.map((e) {
              final totalHarga = e!.totalHarga; // Ambil data hutang dari objek respons.
              final totalBayar = e!.totalBayar; // Ambil data bayar dari objek respons.
              final noInvoice = e!.noInvoice; // Ambil data bayar dari objek respons.
              final tglInvoice = e!.tglInvoice; // Ambil data bayar dari objek respons.
              final tglJt = e!.tglJt; // Ambil data bayar dari objek respons.
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
                        color: Colors.red.shade500,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            Icon(Icons.warning_rounded, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Column(children: [
                              Text('Hutang Sudah Jatuh Tempo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text('Pada : '+'$tglInvoice', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                        Text('No. Invoice', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        Text(' : ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        Text('$noInvoice ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 90,
                                    child : Text('Tanggal PO')
                                ),
                                Text(': '),
                                Text('$tglJt'),
                              ],),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              SizedBox(
                                  width: 90,
                                  child : Text('Umur')
                              ),
                              Text(': '),
                              Text('$tglJt')
                            ],),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              SizedBox(
                                  width: 90,
                                  child : Text('Tagihan')
                              ),
                              Text(': Rp.'),
                              Text('$totalHarga'+',00')
                            ],),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              SizedBox(
                                  width: 90,
                                  child : Text('Terbayar')
                              ),
                              Text(': Rp.'),
                              Text('$totalBayar'+',00')
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