import 'package:flutter/material.dart';

import '../color/appcolor.dart';

class ListshimmerPembayaranDetail extends StatelessWidget {
  const ListshimmerPembayaranDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10, left: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
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
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.shammerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(children: [
                  // Icon(Icons.warning_rounded, color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Column(children: [
                    Text('', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    // Text('Pada : '+'$tglInvoice', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],)
                ],),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text('No. Invoice', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              Text(' : ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    SizedBox(
                        width: 110,
                        child : Text('Tanggal Bayar')
                    ),
                    Text(': '),
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
                  ],),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    SizedBox(
                        width: 110,
                        child : Text('Jumlah')
                    ),
                    Text(': Rp.'),
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
                  ],),
                ],),
            ],)
        ],),
    );
   }
}