import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../endpoint/data/data_respons/json_hutang.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang/views/hutang_view.dart';
import '../color/appcolor.dart';

class CardHutang extends GetView<HutangView> {
  CardHutang({Key? key}) : super(key: key);
  var now = DateTime.now();
  var formattedMonth = DateFormat.MMMM().format(DateTime.now());
  int currentYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<json_hutang>(
      future: API.listviewutang(),
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
                      'Total Hutang',
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
            final totalHutang = snapshot
                .data!.totalHutang; // Ambil data hutang dari objek respons.
            final totalTagihan = snapshot
                .data!.totalTagihan; // Ambil data bayar dari objek respons.
            final totalTerbayar = snapshot
                .data!.totalTerbayar; // Ambil data bayar dari objek respons.
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
                        'Total Hutang',
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
                          const Text('Rp. ', textAlign: TextAlign.center),
                          Text(
                            '$totalHutang' ',00',
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('Rp. ', textAlign: TextAlign.center),
                            Text(
                              '$totalTerbayar' ',00',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Rp. ', textAlign: TextAlign.center),
                            Text(
                              '$totalTagihan' ',00',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.green),
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
          } else {
            return const Text('Tidak ada data');
          }
        }
      },
    );
  }
}
