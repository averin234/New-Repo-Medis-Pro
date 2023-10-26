
import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medispro/app/endpoint/data/local_storage.dart';
import 'package:medispro/app/endpoint/data/publics.dart';
import '../../routes/app_pages.dart';
import 'data_respons/acc_detail.dart';
import 'data_respons/act_login.dart';
import 'data_respons/act_profile.dart';
import 'data_respons/data_acc.dart';
import 'data_respons/data_hutang_chart.dart';
import 'data_respons/data_pembayaran.dart';
import 'data_respons/get_hutang_umur.dart';
import 'data_respons/json_hutang.dart';
import 'data_respons/statusProfile.dart';

class API {
  static const _url = 'https://medispro.id/';
  static const _baseUrl = '${_url}api_new';
  static const _acc_detail = '$_baseUrl/act_acc_detail.php';
  static const _login = '$_baseUrl/act_login.php';
  static const _profile = '$_baseUrl/act_profile.php';
  static const _statusprofile = '$_baseUrl/act_statusProfile.php';
  static const _json_hutang = '$_baseUrl/api_json_hutang.php';
  static const _bayar_detail = '$_baseUrl/get_bayar_detail.php';
  static const _client_pbf_pesan = '$_baseUrl/get_client_pbf_pesan.php';
  static const _data_acc_detail = '$_baseUrl/get_data_acc_detail.php';
  static const _data_acc = '$_baseUrl/get_data_acc.php';
  static const _data_hutang_chart = '$_baseUrl/get_data_hutang_chart.php';
  static const _data_invoice_det = '$_baseUrl/get_data_invoice_det.php';
  static const _data_invoice = '$_baseUrl/get_data_invoice.php';
  static const _data_pembayaran = '$_baseUrl/get_data_pembayaran.php';
  static const _data_pembayaran_det = '$_baseUrl/get_data_pemesanan_det.php';
  static const _data_pengirim_det = '$_baseUrl/get_data_pengiriman_det.php';
  static const _data_pengirim = '$_baseUrl/get_data_pengiriman.php';
  static const _data_piutang_chart = '$_baseUrl/get_data_piutang_chart.php';
  static const _data_piutang_det = '$_baseUrl/get_data_piutang_det.php';
  static const _data_piutang = '$_baseUrl/get_data_piutang.php';
  static const _data_hutang_umur = '$_baseUrl/get_hutang_umur.php';
  static const _profile_pbf = '$_baseUrl/get_profile_pbf.php';

  static Future<act_login> login(
      {required kodeUser, required String username, required String password}) async {
    final data = {
      "kode_user": kodeUser,
      "username": username,
      "password": password
    };
    try {
      var response = await Dio().post(
        _login,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            // 'Cookie': 'PHPSESSID=4p7dvd8adhtocikl945vpcb991'
          },
        ),
        data: data,
      );

      final datas = jsonDecode(response.data);
      final obj = act_login.fromJson(datas);
      if (obj.msg == 'Invalid token: Expired') {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        if (obj.response != 0) {
          if (obj.kodePerusahaan != null) {
            LocalStorages.setToken(obj.kodePerusahaan ?? '');
            Get.snackbar('Selamat Datang', 'Di MedisPro',);
            Get.offAllNamed(Routes.HOME);
          } else {
            Get.snackbar('Error', 'Kode Perusahaan tidak ditemukan',
                backgroundColor: const Color(0xffe5f3e7));
          }
        } else {
          Get.snackbar('Error', 'Gagal melakukan login',
              backgroundColor: const Color(0xffe5f3e7));
        }
      }
      print(obj.toJson());
      return obj;
    } catch (e) {
      // Tangani kesalahan yang mungkin terjadi selama permintaan HTTP.
      print(e);
      throw e; // Anda bisa melempar kembali kesalahan ini jika diperlukan.
    }
  }
  //beda
  static Future<data_hutang_chart> get data_chart async {
    final kodeperusahaan = Publics.controller.getToken.value;
    var data = {"kode_perusahaan": kodeperusahaan};
    var response = await Dio().get(
      _data_hutang_chart,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          // 'Cookie': 'PHPSESSID=4p7dvd8adhtocikl945vpcb991'
        },
      ),
      data: data,
    );
    final obj = data_hutang_chart.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }
  //beda
  static Future<statusProfile> get status async {
    final kodeperusahaan = Publics.controller.getToken.value;
    var data = {"kode_perusahaan": kodeperusahaan};
    var response = await Dio().get(
      _statusprofile,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          // 'Cookie': 'PHPSESSID=4p7dvd8adhtocikl945vpcb991'
        },
      ),
      data: data,
    );
    final obj = statusProfile.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }
  //beda
  static Future<json_hutang> listviewutang() async {
    final kodeperusahaan = Publics.controller.getToken.value;
    var data = {"kode_perusahaan": kodeperusahaan,};
    var response = await Dio().get(
      _json_hutang,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          // 'Cookie': 'PHPSESSID=4p7dvd8adhtocikl945vpcb991'
        },
      ),
      data: data,
    );
    final obj = json_hutang.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }
  //beda
  static Future<data_acc>acc() async {
    final kodeperusahaan = Publics.controller.getToken.value;
    var data = {"kode_perusahaan": kodeperusahaan,};
    var response = await Dio().get(
      _data_acc,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          // 'Cookie': 'PHPSESSID=4p7dvd8adhtocikl945vpcb991'
        },
      ),
      data: data,
    );
    final obj = data_acc.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }
  //beda
  static Future<data_pembayaran>pembayaran() async {
    final kodeperusahaan = Publics.controller.getToken.value;
    var data = {"kode_perusahaan": kodeperusahaan,};
    var response = await Dio().get(
      _data_pembayaran,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          // 'Cookie': 'PHPSESSID=4p7dvd8adhtocikl945vpcb991'
        },
      ),
      data: data,
    );
    final obj = data_pembayaran.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }
  //beda
  static Future<act_profile> get profile async {
    final kodeperusahaan = Publics.controller.getToken.value;
    var data = {"kode_perusahaan": kodeperusahaan};
    var response = await Dio().get(
      _profile,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          // 'Cookie': 'PHPSESSID=4p7dvd8adhtocikl945vpcb991'
        },
      ),
      data: data,
    );
    final obj = act_profile.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }
//beda
  static Future<acc_detail> accdetail ({required String kode_perusahaan_pbf}) async {
    final kodeperusahaan = Publics.controller.getToken.value;
    var data = {
      "kode_perusahaan": kodeperusahaan,
      "kode_perusahaan_pbf": kode_perusahaan_pbf,
    };
    var response = await Dio().get(
      _data_acc_detail,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          // 'Cookie': 'PHPSESSID=4p7dvd8adhtocikl945vpcb991'
        },
      ),
      data: data,
    );
    final obj = acc_detail.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }
//beda
}

