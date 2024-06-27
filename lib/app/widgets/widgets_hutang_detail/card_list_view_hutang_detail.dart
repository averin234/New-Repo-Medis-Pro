import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../endpoint/data/data_respons/acc_detail.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang_detail/controllers/hutang_detail_controller.dart';
import 'list_shammer_hutang_detail.dart';

class ListUtangDetail extends GetView<HutangDetailController> {
  const ListUtangDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<acc_detail>(
      future: API.accdetail(kode_perusahaan_pbf: controller.pbf),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SingleChildScrollView(child:
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
              final totalHarga = e.totalHarga; // Ambil data hutang dari objek respons.
              final totalBayar = e.totalBayar; // Ambil data bayar dari objek respons.
              final noInvoice = e.noInvoice; // Ambil data bayar dari objek respons.
              final tglInvoice = e.tglInvoice; // Ambil data bayar dari objek respons.
              final tglJt = e.tglJt; // Ambil data bayar dari objek respons.
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
                        color: Colors.red.shade500,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            const Icon(Icons.warning_rounded, color: Colors.white),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(children: [
                              const Text('Hutang Sudah Jatuh Tempo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text('Pada : ''$tglInvoice', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                        const Text('No. Invoice', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        const Text(' : ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        Text('$noInvoice ', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
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
                                const SizedBox(
                                    width: 90,
                                    child : Text('Tanggal PO')
                                ),
                                const Text(': '),
                                Text('$tglJt'),
                              ],),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              const SizedBox(
                                  width: 90,
                                  child : Text('Umur')
                              ),
                              const Text(': '),
                              Text('$tglJt')
                            ],),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              const SizedBox(
                                  width: 90,
                                  child : Text('Tagihan')
                              ),
                              const Text(': Rp.'),
                              Text('$totalHarga'',00')
                            ],),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              const SizedBox(
                                  width: 90,
                                  child : Text('Terbayar')
                              ),
                              const Text(': Rp.'),
                              Text('$totalBayar'',00')
                            ],),
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