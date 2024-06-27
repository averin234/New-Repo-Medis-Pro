import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../modules/hutang_detail/controllers/hutang_detail_controller.dart';

class CardHutangDetail extends GetView<HutangDetailController> {
  const CardHutangDetail({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = controller.items;
    var now = DateTime.now();
    var formattedMonth = DateFormat.MMMM().format(DateTime.now());
    int currentYear = DateTime.now().year;
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Rp. ',
                    ),
                    Text(
                      '${items.totalBayar!},00',
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Rp. ', textAlign: TextAlign.center),
                    Text(
                      '${items.totalHarga!},00',
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
  }
}
