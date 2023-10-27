import 'package:flutter/material.dart';

import '../color/appcolor.dart';

class ListshimmerProfile extends StatelessWidget {
  const ListshimmerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
      ),
      child: Column(
        children: [

          CircleAvatar(
            backgroundImage: NetworkImage('',
            ),
            backgroundColor: AppColors.shammerColor,
            radius: 40,
          ),
          SizedBox(
            height: 10,
          ),
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
          SizedBox(
            height: 10,
          ),
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
          SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            height: 30,
            padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.shammerColor,
            ),
            child: Center(
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(
                width: 20,
              ),
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
          SizedBox(
            height: 10,
          ),
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
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 5,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('No. Telp :'),
              SizedBox(
                width: 10,
              ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('No. Telp :'),
              SizedBox(
                width: 10,
              ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('No. Telp :'),
              SizedBox(
                width: 10,
              ),
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
        ],
      ),
    );
   }
}