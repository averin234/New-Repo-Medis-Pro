import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medispro/app/routes/app_pages.dart';

import '../../endpoint/data/data_respons/data_acc.dart';
import '../../modules/hutang/controllers/hutang_controller.dart';
import '../color/appcolor.dart';


  class CardListViewUtang extends StatelessWidget {
  final DataAcc items;

  const CardListViewUtang(
  {super.key,required this.items});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HutangController());
    return  InkWell(
        onTap: () async {
      Get.toNamed(Routes.HUTANG_DETAIL,parameters: { "pbf" : items.kodePerusahaanPbf ?? ''}, arguments: items);

    },
    child: Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(items.namaPerusahaan!, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () async {
                  Get.toNamed(Routes.HUTANG_DETAIL,parameters: { "pbf" : items.kodePerusahaanPbf ?? ''}, arguments: items);

                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.contentColorBlue1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('Detail', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(items.foto!,
                ),
                radius: 40,
              ),
              const SizedBox(
                width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                          width: 90,
                          child : Text('Hutang')
                      ),
                      const Text(': Rp.'),
                      Text('${items.totalHarga!},00', style: const TextStyle(color: Colors.green),)
                    ],),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    const SizedBox(
                        width: 90,
                        child : Text('Sudah Bayar ')
                    ),
                    const Text(': Rp.'),
                    Text('${items.totalBayar!},00', style: const TextStyle(color: Colors.green),)
                  ],),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    const SizedBox(
                        width: 90,
                        child : Text('Jumlah PO')
                    ),
                    const Text(': '),
                    Text('${items.jumPesan!},00',)
                  ],),
                ],),
            ],)
        ],),),
    );
  }
}