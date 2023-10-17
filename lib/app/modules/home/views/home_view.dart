import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int current_index = 0;
  // final List<Widget> pages = [Home(), SearchPage(), SettingsPage()];

  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 26,
          selectedItemColor: Color(0xff4babe7),
          unselectedItemColor: Colors.grey,
          currentIndex: current_index,
          selectedFontSize: 12,
          unselectedFontSize: 14,
          onTap: OnTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home", tooltip: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Search", tooltip: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                tooltip: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                tooltip: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                tooltip: "Settings"),
          ]),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: 120,
              ),
            ),
            SliverFillRemaining(
              child: Center(
                child: Text("data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

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
              backgroundColor: Colors.white,
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
                    color: Colors.white,
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
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child:Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/download.jpeg'),
                        radius: 30,
                      ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                      ),
                      child: Text('PT Averin Informatika', style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 210,
                        child: Text('Gedung Graha Pulo, Ground Floor, Jl. Warung Buncit Raya No.89, RT.6/RW.3, Kalibata, Pancoran, Kota Jakarta Selatan. 12740', textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 10)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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