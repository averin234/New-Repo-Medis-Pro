import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../endpoint/data/data_respons/json_hutang.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang/views/hutang_view.dart';

class CardHutang extends GetView<HutangView> {
  const CardHutang({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<json_hutang>(
      future: API.listviewutang(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            final totalHutang = snapshot.data!.totalHutang; // Ambil data hutang dari objek respons.
            final totalTagihan = snapshot.data!.totalTagihan; // Ambil data bayar dari objek respons.
            return
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
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
                        Row(children: [
                          Text('Rp. ', textAlign: TextAlign.center),
                          Text('$totalHutang', textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
                        ],
                        ),
                      ],
                    ),
                    Divider(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('0', style: TextStyle(color: Colors.green),),
                          Row(children: [
                            Text('Rp. ', textAlign: TextAlign.center),
                            Text('$totalTagihan', textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                    ),
                  ],
                ),
              );
          } else {
            return Text('Tidak ada data');
          }
        }
      },
    );
  }
}
