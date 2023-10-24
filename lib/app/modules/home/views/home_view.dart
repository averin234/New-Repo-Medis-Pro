import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../generated/assets.dart';
import '../../../widgets/chart/fl_chart.dart';
import '../../../widgets/chart/pie_cart.dart';
import '../../../widgets/color/appcolor.dart';
import '../../../widgets/widgets_home/menu.dart';
import '../../hutang/views/hutang_view.dart';
import '../../konfirmasi/views/konfirmasi_view.dart';
import '../../pembayaran/views/pembayaran_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int current_index = 0;
  final List<Widget> pages = [Home(), HutangView(), KonfirmasiView(), PembayaranView(), ProfileView(),];

  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_index],
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CurvedNavigationBar(
              height: 50,
              backgroundColor: AppColors.contentColorWhite,
              color: AppColors.contentColorWhite,
              buttonBackgroundColor: Colors.grey.shade300,
              onTap: OnTapped,
              items: <Widget>[
                Icon(Icons.home),
                Icon(Icons.credit_card),
                Icon(Icons.add_chart_outlined),
                Icon(Icons.attach_money_rounded),
                Icon(Icons.settings),
              ]),

        ),
      ),
    );
  }
}
class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: AnimationConfiguration.toStaggeredList(
    duration: Duration(milliseconds: 295),
    childAnimationBuilder: (widget) => ScaleAnimation(
    child: FadeInAnimation(
    child: widget,
    ),
    ),
    children: <Widget>[
          PieChartSample2(),
            Menu(),
            ],
          ),
        ),
      ),
    );
  }
}