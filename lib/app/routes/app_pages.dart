import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hutang/bindings/hutang_binding.dart';
import '../modules/hutang/views/hutang_view.dart';
import '../modules/konfirmasi/bindings/konfirmasi_binding.dart';
import '../modules/konfirmasi/views/konfirmasi_view.dart';
import '../modules/pembayaran/bindings/pembayaran_binding.dart';
import '../modules/pembayaran/views/pembayaran_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
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
  ];
}
