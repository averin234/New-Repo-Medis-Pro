import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/widgets/color/appcolor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColors.contentColorWhite,
          foregroundColor: AppColors.contentColorBlack,
          iconTheme: IconThemeData(color: AppColors.contentColorWhite),
        ),
      ),
    );
  }
}

class AppTheme {
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        color: AppColors.contentColorWhite,
        foregroundColor: AppColors.contentColorBlack,
        iconTheme: IconThemeData(color: AppColors.contentColorBlack),
      ));
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        background: AppColors.contentColorBlack,
        primary: Colors.grey[900]!,
        secondary: Colors.grey[900]!,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.contentColorBlack,
        foregroundColor: AppColors.contentColorWhite,
        iconTheme: IconThemeData(color: AppColors.contentColorBlack),
      ));
}
