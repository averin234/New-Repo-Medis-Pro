import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:search_page/search_page.dart';

import '../../endpoint/data/data_respons/data_acc.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang/controllers/hutang_controller.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../color/appcolor.dart';
import 'card_list_view_utang.dart';

class SearchCardUtang extends GetView<HutangController> {

  const SearchCardUtang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      child: Container(
        decoration: BoxDecoration(
        ),
        margin: EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
        height: 60,
        child: Column(
          children: [
            FutureBuilder(
                future: API.acc(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    final data = snapshot.data!.dataAcc;

                    if (data != null && data.isNotEmpty) {
                      return
                        TextField(
                          readOnly: true,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18
                              ),
                              prefixIcon: Container(
                                padding: EdgeInsets.all(15),
                                child: Icon(Icons.search_rounded),
                                width: 18,
                              )
                          ),
                          onTap: () =>
                              showSearch(
                                context: context,
                                delegate: SearchPage<DataAcc>(
                                    items: data,
                                    searchLabel: 'Cari nama perusahaan',
                                    showItemsOnEmpty: true,
                                    failure: Center(
                                      child: Text(
                                        'Tidak ada pembayaran :(',
                                      ),
                                    ),
                                    filter: (kasir) =>
                                    [
                                      kasir.namaPerusahaan,
                                    ],
                                    builder: (items) =>
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CardListViewUtang(items: items),
                                          ],
                                        )),
                              ),
                        );
                    } else {
                      return Center(
                        child: Text(
                          'Pencarian'
                        ),
                      );
                    }
                  } else {
                    return Center(
                      child: Text(
                        'Terjadi kesalahan saat mengambil data.',
                      ),
                    );
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
