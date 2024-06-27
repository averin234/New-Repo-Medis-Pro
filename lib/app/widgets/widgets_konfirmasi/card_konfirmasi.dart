import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../endpoint/data/data_respons/data_acc.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../color/appcolor.dart';

class CardKonfirmasi extends GetView<KonfirmasiController> {
  const CardKonfirmasi({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedMonth = DateFormat.MMMM().format(DateTime.now());
    int currentYear = DateTime.now().year;
    return FutureBuilder<data_acc>(
      future: API.acc(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                const Text('Data Listing ACC Pembayaran'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Bedasarkan Disributor '),
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
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Menunggu Konfirmasi',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      'Sudah Konfirmasi',
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
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final totalHutang = snapshot
                .data!.totalHutang; // Ambil data hutang dari objek respons.
            final totalBayar = snapshot
                .data!.totalBayar; // Ambil data bayar dari objek respons.
            return Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                  const Text('Data Listing ACC Pembayaran'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Bedasarkan Disributor '),
                      Text("$formattedMonth $currentYear",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Menunggu Konfirmasi',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        'Sudah Konfirmasi',
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
                          '$totalHutang',
                          style: const TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$totalBayar',
                          style: const TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
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
