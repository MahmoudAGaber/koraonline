import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:koraonline/Playrers/playerMatches.dart';
import 'package:koraonline/Playrers/playerStatistics.dart';
import 'package:koraonline/Playrers/playerTransference.dart';
import 'package:koraonline/Playrers/profile.dart';


class players extends StatefulWidget {
  @override
  _playersState createState() => _playersState();
}

class _playersState extends State<players> with TickerProviderStateMixin{

  static const TextStyle tapbar = TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
  TextStyle head = TextStyle(fontSize: 16, );

  bool chContaier = false;
  ScrollController _scrollController = new ScrollController();

  TabController tabController;
  int _selectedIndex = 0;

  AnimationController animationController;
  Animation<double> _animation;

  @override
  void initState() {
    tabController = new TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {
        _selectedIndex=tabController.index;
      });
      print(tabController.index.toString());
    });

    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        Directionality(
          textDirection: TextDirection.rtl,
          child: SliverAppBar(elevation: 0.0,
            actions: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.people,  color: Colors.black,),
                      onPressed: null),
                  IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                      ),
                      onPressed: null),
                  IconButton(
                      icon: Icon(Icons.star, color: Colors.black),
                      onPressed: null),
                ],
              )
            ],
            expandedHeight: 120.0,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 25,top: 60),
                      child: Row(mainAxisAlignment:MainAxisAlignment.start,children: <Widget>[
                        Container(height: 55,width: 55,
                            child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(100)),
                                child: Image.asset("assets/Marcelo.jpg",))),
                      ],

                      ),
                    ),
                    Positioned(top:93,right: 95,
                        child: Row(children: <Widget>[
                          Container(height: 25,width: 25,
                          child: Image.asset("assets/541.jpg"),),
                          SizedBox(width: 10,),
                          Text("ريال مدريد",style: TextStyle(color: Colors.black),)],))
                  ],
                ),),
              centerTitle: true,
              titlePadding: EdgeInsets.only(top: 5.0,bottom: 9.0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0,bottom: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '  مارسيلو',
                          style: TextStyle(fontSize: 18),)],),
                  ),

                ],
              ),
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: DefaultTabController(
            length: 2,
            child: SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                  TabBar(isScrollable: true, controller: tabController,
                      onTap: (index){
                        setState(() {
                          if(index==1){

                          }
                        });
                      },
                      tabs: [
                        Tab(
                          child:Text ("  الملف الشخصي",style: tapbar,),
                        ),
                        Tab(
                          child:Text( " المباريات",style: tapbar,),
                        ),
                        Tab(
                          child:Text (" احصائيات",style: tapbar,),
                        ),
                        Tab(
                          child: Text(" انتقالات ",style: tapbar,),
                        ),
                      ])),
            ),
          ),
        ),


      ];
    }

    return new Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: _sliverBuilder,
            body: new TabBarView(controller: tabController, children: [
              ListView(children: <Widget>[
                profile()
              ]
              ),
              ListView(children: <Widget>[
                playerMatches()
              ]),
              ListView(
                  children: <Widget>[
                    playerStatistics()
                  ]),
              ListView(
                  children: <Widget>[
                    playerTransference()
                  ]),

            ]),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Theme.of(context).primaryColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _SliverAppBarDelegate1 extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate1({
    @required this.minHeight,
    @required this.maxHeight,
    this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate1 oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
