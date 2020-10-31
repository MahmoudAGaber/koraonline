import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'News/forYou.dart';
import 'News/latest.dart';
import 'News/leagues.dart';
import 'News/transference.dart';




class news extends StatefulWidget {
  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> with SingleTickerProviderStateMixin {
  TabController tabController;
  bool isSwitched = false;


  static const TextStyle tapbar = TextStyle(fontSize: 13, fontWeight: FontWeight.w500,color: Colors.black);


  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);

  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
 

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title:Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Row(
              children: <Widget>[
                Text("أخبار")],),
          ),
          bottom: TabBar(
            isScrollable: true,
            controller: tabController,
            labelColor: Colors.white,
            labelPadding: EdgeInsets.only(left: 50),
            indicatorPadding: EdgeInsets.only(left: 50),
            indicatorColor: Colors.yellow,
            tabs: <Widget>[
              Tab(
                child: Text("لك",style: tapbar,),
                ),
              Tab(
                child: Text("الاحدث",style: tapbar,),
              ),
              Tab(
                child: Text("انتقالات",style: tapbar,),

              ),
              Tab(
                child: Text("البطولات",style: tapbar,),
              ),
            ],
          ),
        ),
        /*
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 110.0,
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, left: 28.0,right: 15),
                      child: CircleAvatar(
                        radius: 13.0,
                        backgroundImage: null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, left: 26.0),
                      child: Text(
                        "اسم المستخدم",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/tv');
                },
                child: ListTile(
                  leading: IconButton(
                      icon: Icon(Icons.tv), iconSize: 25.0, onPressed: null),
                  title: Text(
                    "الجدول التلفزيوني",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/transferCenter');
                },
                child: ListTile(
                  leading: IconButton(
                      icon: Icon(Icons.loop), iconSize: 25.0, onPressed:null),
                  title: Text(
                    "الانتقالات",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Divider(
                height: 2,
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ListTile(
                        leading: IconButton(
                            icon: Icon(Icons.attach_money),
                            iconSize: 25.0,
                            onPressed: null),
                        title: Text(
                          "ازالة الاعلانات",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      ListTile(
                        leading: IconButton(
                            icon: Icon(Icons.brightness_4),
                            iconSize: 25.0,
                            onPressed: null),
                        title: Text(
                          "الوضع الليلي",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            }),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/setting');
                        },
                        child: ListTile(
                          leading: IconButton(
                              icon: Icon(Icons.settings),
                              iconSize: 25.0,
                              onPressed: null),
                          title: Text(
                            "الاعدادات",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),*/
        body: TabBarView(
          controller: tabController,
          children: [
            new Scaffold(
                body:forYou()
            ),
            new Scaffold(
                body:  latest()
            ),
            new ListView(
              children: <Widget>[transference(),],
            ),
            new Scaffold(
              body: leagues(),
            ),


          ],
        ),
      ),
    );
  }
}
