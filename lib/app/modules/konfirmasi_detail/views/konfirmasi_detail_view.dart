import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../widgets/color/appcolor.dart';
import '../../../widgets/widgets_konfirmasi_detail/card_konfirmasi.dart';
import '../../../widgets/widgets_konfirmasi_detail/card_list_view_konfirmasi_detail.dart';
import '../../../widgets/widgets_konfirmasi_detail/card_search_konfirmasi_detail.dart';

class KonfirmasiDetailView extends StatefulWidget {
  const KonfirmasiDetailView({Key? key}) : super(key: key);

  @override
  State<KonfirmasiDetailView> createState() => _KonfirmasiDetailViewState();
}

class _KonfirmasiDetailViewState extends State<KonfirmasiDetailView> {
  int current_index = 0;
  final List<Widget> pages = [const Konfirmasi(), ];

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

class Konfirmasi extends StatefulWidget {
  const Konfirmasi({Key? key}) : super(key: key);
  @override
  State<Konfirmasi> createState() => _KonfirmasiState();
}
class _KonfirmasiState extends State<Konfirmasi> {
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
    return SafeArea(
      child: SmartRefresher(
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
              expandedHeight: 150,
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
                      const SearchCardKonfirmasiDetail(),
                      const ListKonfirmasiDetail(),
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
    );
  }
  _onLoading() {
    _refreshController
        .loadComplete(); // after data returned,set the //footer state to idle
  }

  _onRefresh() {
    setState(() {
// so whatever you want to refresh it must be inside the setState
      const Konfirmasi(); // if you only want to refresh the list you can place this, so the two can be inside setState
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
    final cardTopPosition = expandedHeight / 8 - shrinkOffset;
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
              title: const Text('Konfirmasi', style: TextStyle(color: Colors.black)),
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
                child: const CardKonfirmasiDetail(),
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
