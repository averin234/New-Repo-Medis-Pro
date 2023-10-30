import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../generated/assets.dart';
import '../../endpoint/data/data_respons/acc_detail.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../../modules/konfirmasi_detail/controllers/konfirmasi_detail_controller.dart';
import '../color/appcolor.dart';
import 'list_shammer_konfirmasi_detail.dart';

class ListKonfirmasiDetail extends GetView<KonfirmasiDetailController> {
  const ListKonfirmasiDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<acc_detail>(
      future: API.accdetail(kode_perusahaan_pbf: controller.pbf),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SingleChildScrollView(
            child: Column(children: [
              ListshimmerKonfirmasiDetail(),
              ListshimmerKonfirmasiDetail(),
              ListshimmerKonfirmasiDetail(),
              ListshimmerKonfirmasiDetail(),
              ListshimmerKonfirmasiDetail(),
            ]),
          );
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
                    Row(
                      children: [
                        SizedBox(
                          width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 110,
                                    child : Text('Tanggal Invoice')
                                ),
                                Text(': '),
                                Text('$tglInvoice')
                              ],),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              SizedBox(
                                  width: 110,
                                  child : Text('Jatuh Tempo ')
                              ),
                              Text(': '),
                              Text('$tglJt')
                            ],),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              SizedBox(
                                  width: 110,
                                  child : Text('Jumlah Hutang')
                              ),
                              Text(': Rp.'),
                              Text('$totalBayar'+',00')
                            ],),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              SizedBox(
                                  width: 110,
                                  child : Text('Jumalah Bayar')
                              ),
                              Text(': Rp.'),
                              Text('$totalHarga'+',00')
                            ],),
                            SizedBox(
                              height: 10,
                            ),

                          ],),
                      ],),
                    InkWell(
                      onTap: (status == null) ? () async {

                      } : null,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: (status == "1") ? Colors.green.shade500 : Colors.blue.shade500,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              (status == "1") ? 'Sudah Terkonfirmasi' : 'Konfirmasi',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
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