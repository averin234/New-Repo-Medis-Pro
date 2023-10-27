import 'package:flutter/material.dart';

import '../color/appcolor.dart';

class ListshimmerKonfirmasi extends StatelessWidget {
  const ListshimmerKonfirmasi({super.key});

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
          Row(children: [
      Expanded(
      child: Container(
              margin: EdgeInsets.only(bottom: 10, right: 30),
              padding: EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.shammerColor,
              ),
              child: Center(
                child:
                Text('', style: TextStyle(color: Colors.white)),
              ),
            ),),
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 10),
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.shammerColor,
              ),
              child: Center(
                child:
                Text('', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(''),
                backgroundColor: AppColors.shammerColor,
                radius: 40,
              ),
              SizedBox(
                width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 90,
                          child : Text('Hutang')
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    SizedBox(
                        width: 90,
                        child : Text('Sudah Bayar ')
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    SizedBox(
                        width: 90,
                        child : Text('Jumlah PO')
                    ),
                    Text(': '),
                    Container(
                      width: 110,
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
        ],),);
   }
}