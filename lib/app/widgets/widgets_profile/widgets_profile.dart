import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../endpoint/data/data_respons/act_profile.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/profile/controllers/profile_controller.dart';

class CardProfile extends GetView<ProfileController> {
  const CardProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: EdgeInsets.all(10),
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
          FutureBuilder<act_profile>(
            future: API.profile,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.data != null) {
                  final foto = snapshot.data!.foto; // Ambil data bayar dari objek respons.
                  final namaPerusahaan = snapshot.data!.namaPerusahaan; // Ambil data bayar dari objek respons.
                  final email = snapshot.data!.email; // Ambil data bayar dari objek respons.
                  final alamat = snapshot.data!.alamat; // Ambil data bayar dari objek respons.
                  final kelurahan = snapshot.data!.kelurahan; // Ambil data bayar dari objek respons.
                  final kecamatan = snapshot.data!.kecamatan; // Ambil data bayar dari objek respons.
                  final telpon1 = snapshot.data!.telpon1; // Ambil data bayar dari objek respons.
                  final telpon2 = snapshot.data!.telpon2; // Ambil data bayar dari objek respons.
                  final fax = snapshot.data!.fax; // Ambil data bayar dari objek respons.
                  final kota = snapshot.data!.kota; // Ambil data bayar dari objek respons.
                  final propinsi = snapshot.data!.propinsi; // Ambil data bayar dari objek respons.
                  final kodepos = snapshot.data!.kodepos; // Ambil data bayar dari objek respons.
                  return  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('$foto'
                        ),
                        radius: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('$namaPerusahaan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('$email'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('$alamat', textAlign: TextAlign.center),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Text('$kelurahan'),
                        SizedBox(
                          width: 20,
                        ),
                        Text('$kecamatan'),
                      ],),
                      SizedBox(
                        height: 10,
                      ),
                      Text('$kota, ' + '$propinsi, ' + '$kodepos'),
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
                          Text('$telpon1'),
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
                          Text('$telpon2'),
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
                          Text('$fax'),
                        ],),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                } else {
                  return Text('Tidak ada data');
                }
              }
            },
          ),
      ],
    ),
    );
  }
}
