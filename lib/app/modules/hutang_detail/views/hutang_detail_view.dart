import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../endpoint/data/data_respons/data_acc.dart';
import '../../../widgets/color/appcolor.dart';
import '../../../widgets/widgets_hutang/list_shammer_hutang.dart';
import '../../../widgets/widgets_hutang_detail/card_hutang_detail.dart';
import '../../../widgets/widgets_hutang_detail/card_list_view_hutang_detail.dart';
import '../../../widgets/widgets_hutang_detail/card_search_utang_detail.dart';
import '../../../widgets/widgets_hutang_detail/list_shammer_hutang_detail.dart';
import '../../konfirmasi/views/konfirmasi_view.dart';
import '../controllers/hutang_detail_controller.dart';

class HutangDetailView extends StatefulWidget {
  const HutangDetailView({Key? key}) : super(key: key);

  @override
  State<HutangDetailView> createState() => _HutangDetailViewState();
}

class _HutangDetailViewState extends State<HutangDetailView> {
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
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
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
    return SafeArea(
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(),
    onLoading: _onLoading,
    onRefresh: _onRefresh,
    child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: CustomSliverDelegate(
              expandedHeight: 146,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Scrollbar(
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
                      SearchCardUtangDetail(),
                      ListUtangDetail(),
                      SizedBox(
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
      Home(); // if you only want to refresh the list you can place this, so the two can be inside setState
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
  CustomSliverDelegate( {
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 5 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 2 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 0,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text('Utang', style: TextStyle(color: Colors.black)),
              centerTitle: false,
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 20, left: 10, top: 10, bottom: 7),
                  child: Opacity(
                    opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                    child: Row(
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
                child: CardHutangDetail(),
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