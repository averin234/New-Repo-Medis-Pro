import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../modules/konfirmasi/controllers/konfirmasi_controller.dart';
import '../color/appcolor.dart';

class SearchCardKonfirmasi extends GetView<KonfirmasiController> {
  const SearchCardKonfirmasi({Key? key}) : super(key: key);
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
            TextField(
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
            ),
          ],
        ),
      ),
    );

  }
}