import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hutang/bindings/hutang_binding.dart';
import '../modules/hutang/views/hutang_view.dart';
import '../modules/hutang_detail/bindings/hutang_detail_binding.dart';
import '../modules/hutang_detail/views/hutang_detail_view.dart';
import '../modules/konfirmasi/bindings/konfirmasi_binding.dart';
import '../modules/konfirmasi/views/konfirmasi_view.dart';
import '../modules/konfirmasi_detail/bindings/konfirmasi_detail_binding.dart';
import '../modules/konfirmasi_detail/views/konfirmasi_detail_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pembayaran/bindings/pembayaran_binding.dart';
import '../modules/pembayaran/views/pembayaran_view.dart';
import '../modules/pembayaran_detail/bindings/pembayaran_detail_binding.dart';
import '../modules/pembayaran_detail/views/pembayaran_detail_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.KONFIRMASI,
      page: () => const KonfirmasiView(),
      binding: KonfirmasiBinding(),
    ),
    GetPage(
      name: _Paths.HUTANG,
      page: () => const HutangView(),
      binding: HutangBinding(),
    ),
    GetPage(
      name: _Paths.PEMBAYARAN,
      page: () => const PembayaranView(),
      binding: PembayaranBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HUTANG_DETAIL,
      page: () => const HutangDetailView(),
      binding: HutangDetailBinding(),
    ),
    GetPage(
      name: _Paths.KONFIRMASI_DETAIL,
      page: () => const KonfirmasiDetailView(),
      binding: KonfirmasiDetailBinding(),
    ),
    GetPage(
      name: _Paths.PEMBAYARAN_DETAIL,
      page: () => const PembayaranDetailView(),
      binding: PembayaranDetailBinding(),
    ),
  ];
}
