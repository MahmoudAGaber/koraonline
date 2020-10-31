import 'package:flutter/material.dart';

class searchIcon extends StatefulWidget {
  @override
  _searchIconState createState() => _searchIconState();
}

class _searchIconState extends State<searchIcon> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(
          top: 30, right: 10, left: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(10))),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 5, right: 10, left: 10),
            child: Row(children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors
                    .grey[600],), onPressed: () {
                Navigator.pop(context);
              },),
              SizedBox(width: 10,),
              Expanded(
                child: TextField(
                  obscureText: true,
                  textCapitalization: TextCapitalization
                      .sentences,
                  decoration: InputDecoration.collapsed(
                    hintText: "البحث عن الفرق،المقابلات،اللاعبين،الاخبار،البطولات",
                    hintStyle: TextStyle(fontSize: 16,),
                  ),
                ),

              ),
            ],),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(children: <Widget>[
                              Container(height: 30, width: 30,
                                child: Image.asset(
                                    "assets/541.jpg"),),
                              SizedBox(width: 10,),
                              Text("ريال مدريد")
                            ],),
                          ),
                          IconButton(
                              icon: Icon(Icons.star_border),
                              onPressed: null)
                        ],),
                    ),
                  );
                }),
          ),
        ],

      ),
    );
  }
}
