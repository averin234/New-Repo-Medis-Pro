import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../generated/assets.dart';
import '../../../endpoint/data/data_respons/data_pembayaran.dart';
import '../../../endpoint/data/fetch_data.dart';
import '../../../widgets/color/appcolor.dart';
import '../../../widgets/widgets_pembayaran/card_list_view_pembayaran.dart';
import '../../../widgets/widgets_pembayaran/card_pembayaran.dart';
import '../../../widgets/widgets_pembayaran/card_search_pembayaran.dart';
import '../../../widgets/widgets_pembayaran/list_shammer_pembayaran.dart';

class PembayaranView extends StatefulWidget {
  const PembayaranView({super.key});

  @override
  State<PembayaranView> createState() => _PembayaranViewState();
}

class _PembayaranViewState extends State<PembayaranView> {
  int current_index = 0;
  final List<Widget> pages = [const Home(), ];

  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_index],
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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.contentColorWhite,
      statusBarIconBrightness: Brightness.dark,
    ));
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
    child: SafeArea(
      child:  SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: const WaterDropHeader(),
    onLoading: _onLoading,
    onRefresh: _onRefresh,
    child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: CustomSliverDelegate(
              expandedHeight: 130,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Scrollbar(
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
                      const SearchCardPembayaran(),
                      Obx(() {
                        return FutureBuilder(
                          future: API.pembayaran(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState !=
                                    ConnectionState.waiting &&
                                snapshot.data != null) {
                              data_pembayaran  getDataAcc =
                                  snapshot.data ?? data_pembayaran();
                              return Column(
                                children: AnimationConfiguration
                                    .toStaggeredList(
                                  duration:
                                  const Duration(milliseconds: 475),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                        child: FadeInAnimation(
                                          child: widget,
                                        ),
                                      ),
                                  children: getDataAcc.dataPembayaran !=
                                      null
                                      ? getDataAcc.dataPembayaran!
                                      .map((e) {
                                    return PembayaranList(
                                        items: e
                                    );
                                  }).toList()
                                      : [Container()],
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: Get.height - 250,
                                child: const SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListshimmerPembayaran(),
                                      ListshimmerPembayaran(),
                                      ListshimmerPembayaran(),
                                      ListshimmerPembayaran(),
                                      ListshimmerPembayaran(),
                                      ListshimmerPembayaran(),
                                  ],))
                              );
                            }
                          },
                        );
                      }),
                    const SizedBox(
                      height: 10,
                    ),
                  ]
              ),
            ),
          ),
          ),
        ],
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
    final cardTopPosition = expandedHeight / 3 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 0,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              elevation: 0.0,
              title: const Text('Pembayaran', style: TextStyle(color: Colors.black)),
              centerTitle: false,
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 10, top: 10, bottom: 7),
                  child: Opacity(
                    opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                    child: const Row(
                      children: [
                        Icon(Icons.search_rounded, color: Colors.grey,),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Pencarian', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ],
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
                padding: EdgeInsets.symmetric(horizontal: 0 * percent),
                child: const CardPembayaran(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 3;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}