import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:search_page/search_page.dart';

import '../../endpoint/data/data_respons/acc_detail.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/hutang_detail/controllers/hutang_detail_controller.dart';
import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../color/appcolor.dart';
import 'card_list_view_hutang_detail.dart';

class SearchCardUtangDetail extends GetView<HutangDetailController> {
  const SearchCardUtangDetail({Key? key}) : super(key: key);
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
                future: API.accdetail(kode_perusahaan_pbf: controller.pbf),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    final data = snapshot.data!.dataAccDetail;

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
                                delegate: SearchPage<DataAccDetail>(
                                    items: data,
                                    searchLabel: 'Cari No. Invoice',
                                    showItemsOnEmpty: true,
                                    failure: Center(
                                      child: Text(
                                        'Tidak ada pembayaran :(',
                                      ),
                                    ),
                                    filter: (kasir) =>
                                    [
                                      kasir.noInvoice,
                                    ],
                                    builder: (items) =>
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ListUtangDetail(),
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