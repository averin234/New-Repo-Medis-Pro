import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../endpoint/data/data_respons/bayar_detail.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/pembayaran_detail/controllers/pembayaran_detail_controller.dart';
import '../color/appcolor.dart';

class CardPembayaranDetail extends GetView<PembayaranDetailController> {
  const CardPembayaranDetail({
    super.key,
  });
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
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 70,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Periode',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'PBF',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 90,
                      height: 20,
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 0, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.shammerColor,
                      ),
                      child: const Center(),
                    ),
                    Row(
                      children: [
                        const Text('Rp. ', textAlign: TextAlign.center),
                        Container(
                          width: 90,
                          height: 20,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 0, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.shammerColor,
                          ),
                          child: const Center(),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tagihan Terbayar',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      'Jumlah Tagihan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 90,
                        height: 20,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shammerColor,
                        ),
                        child: const Center(),
                      ),
                      Row(
                        children: [
                          const Text('Rp. ', textAlign: TextAlign.center),
                          Container(
                            width: 90,
                            height: 20,
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.shammerColor,
                            ),
                            child: const Center(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final jumlahParsial = snapshot
                .data!.jumlahParsial; // Ambil data hutang dari objek respons.
            final jumlahLunas = snapshot
                .data!.jumlahLunas; // Ambil data bayar dari objek respons.
            return Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 5,
                    blurRadius: 70,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Periode',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'PBF',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$formattedMonth $currentYear"),
                      Row(
                        children: [
                          const Text('', textAlign: TextAlign.center),
                          Text(
                            items.namaPerusahaan!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tagihan Terbayar',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        'Jumlah Tagihan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 30, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$jumlahParsial',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.green),
                        ),
                        Text(
                          '$jumlahLunas',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            );
          } else {
            return const Text('Tidak ada data');
          }
        }
      },
    );
  }
}
