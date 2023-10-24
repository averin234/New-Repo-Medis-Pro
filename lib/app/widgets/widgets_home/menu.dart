import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:medispro/generated/assets.dart';

import '../../modules/home/controllers/home_controller.dart';

class Menu extends GetView<HomeController> {
  const Menu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              margin: EdgeInsets.only(top: 10),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     Image.asset(Assets.imagesPills,
                         width: 25),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Center(
                          child:
                        Text('0', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Daftar Obat \nApotik',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 160,
              margin: EdgeInsets.only(top: 10),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assets.imagesDrug,
                          width: 25),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Center(
                          child:
                          Text('0', style: TextStyle(color: Colors.white)),
                           ),
                          ),
                        ],
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Obat Terdaftar di \nDistrex',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 160,
              margin: EdgeInsets.only(top: 10),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assets.imagesPharmacy,
                          width: 25),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Center(
                          child:
                          Text('0', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Obat Menyentuh \nBatas Minimum',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 160,
              margin: EdgeInsets.only(top: 10),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assets.imagesVerified,
                          width: 25),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Center(
                          child:
                          Text('0', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('SO Belum \nTerkonfirmasi',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 160,
              margin: EdgeInsets.only(top: 10),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assets.imagesShop,
                          width: 25),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Center(
                          child:
                          Text('0', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Item Obat \nBelum Terkirim',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 160,
              margin: EdgeInsets.only(top: 10),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assets.imagesWriting,
                          width: 25),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Center(
                          child:
                          Text('0', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Berita Acara \nDibuat Bulan ini',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
            ),
          ],
        ),
      );
    }
}