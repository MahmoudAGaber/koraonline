import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../trendingData.dart';

class teamNews extends StatefulWidget {
  @override
  _teamNewsState createState() => _teamNewsState();
}

class _teamNewsState extends State<teamNews> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: trend.length,
      itemBuilder: (BuildContext context, index){
        return Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/webView');
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: new Column(
                          children: <Widget>[
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width*0.95,
                                    height: 200,
                                    child: new ClipRRect(
                                      child: Image.asset(
                                        trend[index].imageUrl,
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(16.0),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Text(
                                trend[index].text,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12,right: 15),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.soccer,
                                    size: 15.0,
                                  ),
                                  Text(
                                    "  FotMob",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    " منذ 6 دقائق",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),


                                ],
                              ),
                            )
                          ],
                    ),)
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
