import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../modules/profile/controllers/profile_controller.dart';

class CardProfile extends GetView<ProfileController> {
  const CardProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: EdgeInsets.all(10),
        height: 320,
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
        child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesDownload),
            radius: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Text('Nama Apotik'),
          SizedBox(
            height: 10,
          ),
          Text('Email'),
          SizedBox(
            height: 10,
          ),
          Text('Alamat'),
          SizedBox(
            height: 10,
          ),
          Text('Kelurahan Kecamatan'),
          SizedBox(
            height: 10,
          ),
          Text('Kota provinsi Kode Pos'),
          SizedBox(
            height: 10,
          ),
          Text('No. Telp'),
          SizedBox(
            height: 10,
          ),
          Text('No.Fax'),
      ],
    ),
    );
  }
}
