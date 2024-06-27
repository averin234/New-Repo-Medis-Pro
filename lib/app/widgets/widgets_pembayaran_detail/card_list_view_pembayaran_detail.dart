import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../endpoint/data/data_respons/bayar_detail.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/pembayaran_detail/controllers/pembayaran_detail_controller.dart';
import 'list_shammer_pembayaran_detail.dart';

class ListPembayaranDetail extends GetView<PembayaranDetailController> {
  const ListPembayaranDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bayar_detail>(
      future: API.bayardetail(kode_perusahaan_pbf: controller.pbf),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SingleChildScrollView(
            child: Column(children: [
              ListshimmerPembayaranDetail(),
              ListshimmerPembayaranDetail(),
              ListshimmerPembayaranDetail(),
              ListshimmerPembayaranDetail(),
              ListshimmerPembayaranDetail(),
            ]),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final namaPerusahaan = snapshot.data!..dataBayarDetail; // Ambil data hutang dari objek respons.
            return Column(children: snapshot.data!.dataBayarDetail!.map((e) {
              final totalHarga = e.totalHarga; // Ambil data hutang dari objek respons.
              final noInvoice = e.noInvoice; // Ambil data bayar dari objek respons.
              final tglInvoice = e.tglInvoice; // Ambil data bayar dari objek respons.
              final status = e.status; // Ambil data bayar dari objek respons.
              return  Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
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
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green.shade500,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text('No. Invoice', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                        const Text(' : ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 260,
                          child :
                        Text('$noInvoice ', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              const SizedBox(
                                  width: 90,
                                  child : Text('Tanggal Bayar')
                              ),
                              const Text(': '),
                              Text('$tglInvoice')
                            ],),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              const SizedBox(
                                  width: 90,
                                  child : Text('Jumlah')
                              ),
                              const Text(': Rp.'),
                              Text('$totalHarga')
                            ],),
                            const SizedBox(
                              height: 10,
                            ),
                          ],),
                      ],)
                  ],),
              );},
            ).toList(),);

          } else {
            return const Text('Tidak ada data');
          }
        }
      },
    );
  }
}