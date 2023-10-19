import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../generated/assets.dart';
import '../../../widgets/chart/fl_chart.dart';
import '../../../widgets/chart/pie_cart.dart';
import '../../../widgets/color/appcolor.dart';
import '../../konfirmasi/views/konfirmasi_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int current_index = 0;
  final List<Widget> pages = [Home(), KonfirmasiView(), ];

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
                Icon(Icons.search),
                Icon(Icons.settings),
                Icon(Icons.person)
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.contentColorWhite,
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: CustomSliverDelegate(
              expandedHeight: 175,
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                  decoration: BoxDecoration(
                    color: AppColors.contentColorWhite,
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
                  child : Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                    ],),
                ),
              ],),
          ),
        ],
      ),
    );
  }
}
class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  late bool isShowingMainData;


  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 0,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: AppColors.contentColorWhite,
              elevation: 0.0,
              title:  Image.asset(
                'assets/images/logo_medis_pro.png',
                height: 40,
                fit: BoxFit.cover,
              ),
              ),
            ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10 * percent),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.contentColorWhite,
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
                  child: LineChartSample1(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}