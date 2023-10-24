import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../modules/hutang/views/hutang_view.dart';

class CardHutang extends GetView<HutangView> {
  const CardHutang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 70,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Periode'),
              Text('Total Hutang'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Desember 2023'),
              Text('0', textAlign: TextAlign.center),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tagihan Terbayar', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Jumlah Tagihan', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(right: 30, left: 30),
            child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0'),
              Text('0'),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
