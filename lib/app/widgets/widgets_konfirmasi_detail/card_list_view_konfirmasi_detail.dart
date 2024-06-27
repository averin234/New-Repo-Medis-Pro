import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../endpoint/data/data_respons/acc_detail.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/konfirmasi_detail/controllers/konfirmasi_detail_controller.dart';
import 'list_shammer_konfirmasi_detail.dart';


  class ListKonfirmasiDetail extends StatefulWidget {
  const ListKonfirmasiDetail({super.key});

  @override
  _ListKonfirmasiDetailState createState() => _ListKonfirmasiDetailState();
  }

  class _ListKonfirmasiDetailState extends State<ListKonfirmasiDetail> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KonfirmasiDetailController());
    bool isLoading = false;
    return FutureBuilder<acc_detail>(
      future: API.accdetail(kode_perusahaan_pbf: controller.pbf),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SingleChildScrollView(
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
              final totalHarga = e.totalHarga; // Ambil data hutang dari objek respons.
              final totalBayar = e.totalBayar; // Ambil data bayar dari objek respons.
              final noInvoice = e.noInvoice; // Ambil data bayar dari objek respons.
              final tglInvoice = e.tglInvoice; // Ambil data bayar dari objek respons.
              final tglJt = e.tglJt; // Ambil data bayar dari objek respons.
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
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    width: 110,
                                    child : Text('Tanggal Invoice')
                                ),
                                const Text(': '),
                                Text('$tglInvoice')
                              ],),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              const SizedBox(
                                  width: 110,
                                  child : Text('Jatuh Tempo ')
                              ),
                              const Text(': '),
                              Text('$tglJt')
                            ],),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              const SizedBox(
                                  width: 110,
                                  child : Text('Jumlah Hutang')
                              ),
                              const Text(': Rp.'),
                              Text('$totalBayar'',00')
                            ],),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              const SizedBox(
                                  width: 110,
                                  child : Text('Jumalah Bayar')
                              ),
                              const Text(': Rp.'),
                              Text('$totalHarga'',00')
                            ],),
                            const SizedBox(
                              height: 10,
                            ),

                          ],),
                      ],),
                    InkWell(
                      onTap: () async {
                        if (!isLoading) {
                          setState(() {
                            isLoading = true;
                          });

                          // Panggil API.actaccdetail
                          await API.actaccdetail(e.idTcHutangSupplierInv ?? '');

                          setState(() {
                            isLoading = false;
                          });

                          // Refresh halaman atau lakukan sesuatu setelah pemanggilan selesai
                          // Misalnya, bisa dengan mengganti halaman, atau menampilkan pesan sukses, dll.
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: (status == "1") ? Colors.green.shade500 : Colors.blue.shade500,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              (status == "1") ? 'Sudah Terkonfirmasi' : 'Konfirmasi',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
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