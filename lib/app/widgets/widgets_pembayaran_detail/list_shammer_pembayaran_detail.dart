import 'package:flutter/material.dart';

import '../color/appcolor.dart';

class ListshimmerPembayaranDetail extends StatelessWidget {
  const ListshimmerPembayaranDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: AppColors.shammerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
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
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('No. Invoice', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              const Text(' : ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              Container(
                width: 90,
                height: 20,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.shammerColor,
                ),
                child: const Center(
                ),
              ),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    const SizedBox(
                        width: 110,
                        child : Text('Tanggal Bayar')
                    ),
                    const Text(': '),
                    Container(
                      width: 90,
                      height: 20,
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.shammerColor,
                      ),
                      child: const Center(
                      ),
                    ),
                  ],),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    const SizedBox(
                        width: 110,
                        child : Text('Jumlah')
                    ),
                    const Text(': Rp.'),
                    Container(
                      width: 90,
                      height: 20,
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.shammerColor,
                      ),
                      child: const Center(
                      ),
                    ),
                  ],),
                ],),
            ],)
        ],),
    );
   }
}