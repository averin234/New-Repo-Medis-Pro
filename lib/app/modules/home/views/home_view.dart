import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../generated/assets.dart';
import '../../../widgets/chart/pie_cart.dart';
import '../../../widgets/color/appcolor.dart';
import '../../../widgets/widgets_home/menu.dart';
import '../../hutang/views/hutang_view.dart';
import '../../konfirmasi/views/konfirmasi_view.dart';
import '../../pembayaran/views/pembayaran_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int current_index = 0;
  final List<Widget> pages = [const Home(), const HutangView(), const KonfirmasiView(), const PembayaranView(), const ProfileView(),];

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
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CurvedNavigationBar(
              height: 50,
              backgroundColor: AppColors.contentColorWhite,
              color: AppColors.contentColorWhite,
              buttonBackgroundColor: Colors.grey.shade300,
              onTap: OnTapped,
              items: const <Widget>[
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

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  late RefreshController _refreshController;
  @override
  void initState() {
    _refreshController =
        RefreshController(); // we have to use initState because this part of the app have to restart
    super.initState();
  }
  final updateController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    updateController.checkForUpdate();
    return WillPopScope(
      onWillPop: () async {
        Get.defaultDialog(
          title: 'Keluar dari Aplikasi',
          content: Column(
            children: [
              Image.asset(
                Assets.imagesShop,
                gaplessPlayback: true,
                fit: BoxFit.fitHeight,
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          confirm: InkWell(
            onTap: () async{
              SystemNavigator.pop();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue
              ),
              child : const Center(
                child : Text('Keluar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: false,
          elevation: 0,
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: const WaterDropHeader(),
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 295),
                childAnimationBuilder: (widget) => ScaleAnimation(
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: <Widget>[
                  const PieChartSample2(),
                  const Menu(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onLoading() {
    _refreshController
        .loadComplete(); // after data returned,set the //footer state to idle
  }

  _onRefresh() {
    setState(() {
// so whatever you want to refresh it must be inside the setState
      const Home(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}