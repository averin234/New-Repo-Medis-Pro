import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:search_page/search_page.dart';
import '../../endpoint/data/data_respons/data_pembayaran.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/pembayaran/controllers/pembayaran_controller.dart';
import 'card_list_view_pembayaran.dart';

class SearchCardPembayaran extends GetView<PembayaranController> {
  const SearchCardPembayaran({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      child: Container(
        decoration: const BoxDecoration(
        ),
        margin: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
        height: 60,
        child: Column(
          children: [
            FutureBuilder(
                future: API.pembayaran(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    final data = snapshot.data!.dataPembayaran;

                    if (data != null && data.isNotEmpty) {
                      return
                        TextField(
                          readOnly: true,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18
                              ),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(15),
                                width: 18,
                                child: const Icon(Icons.search_rounded),
                              )
                          ),
                          onTap: () =>
                              showSearch(
                                context: context,
                                delegate: SearchPage<DataPembayaran>(
                                    items: data,
                                    searchLabel: 'Cari nama perusahaan',
                                    showItemsOnEmpty: true,
                                    failure: const Center(
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
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            PembayaranList(items: items,),
                                          ],
                                        )),
                              ),
                        );
                    } else {
                      return const Center(
                        child: Text(
                            'Pencarian'
                        ),
                      );
                    }
                  } else {
                    return const Center(
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