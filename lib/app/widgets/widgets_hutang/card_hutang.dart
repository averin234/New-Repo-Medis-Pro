import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:medispro/app/widgets/widgets_hutang/list_shammer_hutang.dart';

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
    return  FutureBuilder<json_hutang>(
      future: API.listviewutang(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
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
                    Text('Periode', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('Total Hutang', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    width: 90,
                  height: 20,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.shammerColor,
                  ),
                  child: Center(
                  ),
                ),
                    Row(children: [
                      Text('Rp. ', textAlign: TextAlign.center),
                      Container(
                        width: 90,
                        height: 20,
                        padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shammerColor,
                        ),
                        child: Center(
                        ),
                      ),
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
                      Container(
                        width: 90,
                        height: 20,
                        padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shammerColor,
                        ),
                        child: Center(
                        ),
                      ),
                      Row(children: [
                        Text('Rp. ', textAlign: TextAlign.center),
                        Container(
                          width: 90,
                          height: 20,
                          padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.shammerColor,
                          ),
                          child: Center(
                          ),
                        ),
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
                        Text('Periode', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('Total Hutang', style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$formattedMonth' + ' $currentYear'),
                        Row(children: [
                          Text('Rp. ', textAlign: TextAlign.center),
                          Text('$totalHutang'+',00', textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
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
                            Text('$totalTagihan'+',00', textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
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
