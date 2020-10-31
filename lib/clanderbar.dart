import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart' show DateFormat;

class clanderbar extends StatefulWidget {
  @override
  _clanderbarState createState() => _clanderbarState();
}

class _clanderbarState extends State<clanderbar> {

  DateTime _currentDate = DateTime(2020, 8, 3);
  DateTime _currentDate2 = DateTime(2020, 8, 4);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2020, 8, 3));
  DateTime _targetDateTime = DateTime(2020, 8, 3);

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _calendarCarouselNoHeader = CalendarCarousel<Event>(

      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },

      daysTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
      headerTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
      inactiveWeekendTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
      markedDateCustomTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
      markedDateMoreCustomTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
      weekdayTextStyle: TextStyle(color: Colors.black87,fontSize: 15,),
      selectedDayTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),
      nextDaysTextStyle: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w600),
      prevDaysTextStyle: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w600),
      todayTextStyle: TextStyle(color: Colors.green),
      iconColor: Colors.black,
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
          color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w600
      ),

      weekFormat: false,
//      firstDayOfWeek: 4,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),

      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),

      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 25,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: new Scaffold(
        appBar: AppBar(
          title: Text("اليوم"),
        ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //custom icon
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: _calendarCarousel,
                ), // This trailing comma makes auto-formatting nicer for build methods.
                //custom icon without header

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: _calendarCarouselNoHeader,
                ), //
              ],
            ),
          )),
    );
  }
}
