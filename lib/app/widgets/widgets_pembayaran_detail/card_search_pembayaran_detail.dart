import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../modules/pembayaran_detail/controllers/pembayaran_detail_controller.dart';

class SearchCardPembayaranDetail extends GetView<PembayaranDetailController> {
  const SearchCardPembayaranDetail({Key? key}) : super(key: key);
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
            TextField(
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
            ),
          ],
        ),
      ),
    );

  }
}