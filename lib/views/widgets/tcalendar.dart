import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../resources/app_colors.dart';

class CalendarController {

  Function(List<DateTime>) onMarkedDates;

  void setMarkedDates(List<DateTime> markedDates){
    onMarkedDates(markedDates);
  }
}

class Calendar extends StatefulWidget {

  CalendarController controller;

  List<DateTime> markedDates;
  DateTime selectedDate;

  Function(DateTime) onDateSelect;
  Function(DateTime) onMonthChange;

  Calendar({this.selectedDate, this.controller, this.markedDates = const [], this.onDateSelect, this.onMonthChange});

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  
  final weekTitles = [
    'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'
  ];

  DateTime monthDate;
  DateTime selectedDate;

  Set<DateTime> markedDates;
  List<List<DateTime>> monthDays;

  @override
  void initState() {    
    super.initState();

    if (widget.controller != null) {
      widget.controller.onMarkedDates = (dates) {
        setState(() {
          markedDates = dates.toSet();          
        });
      };
    }

    monthDays = [];
    if (widget.selectedDate != null){
      selectedDate = DateTime(widget.selectedDate.year, widget.selectedDate.month, widget.selectedDate.day);
    }

    markedDates = Set();
    for (var date in widget.markedDates){
      markedDates.add(DateTime(date.year, date.month, date.day));
    }

    monthDate = DateTime.now().year < 2019 ? DateTime(2019, 1, 1) : DateTime.now();
  }

  int countDays(DateTime date){
    return DateTime(date.year, date.month + 1, 1).difference(date).inDays;
  }

  @override
  Widget build(BuildContext context) {
    var days = countDays(monthDate);
    var prevDays = countDays(DateTime(monthDate.year, monthDate.month - 1, 1));
    var prevWeek = monthDate.weekday < 7 ? monthDate.weekday : 0;
    var nextDays = 0;
    var nextWeek = 7 - DateTime(monthDate.year, monthDate.month + 1, 1).weekday;
    int day = 0;

    monthDays = [];

    for (int i = 0; i < ((days + prevWeek + nextWeek) / 7).ceil(); i++){
      List<DateTime> week = [];
      for (int k = 0; k < 7; k++){
        if (prevWeek > 0){
          prevWeek -= 1;
          week.add(DateTime(monthDate.year, monthDate.month - 1, prevDays - prevWeek));
        } else if (day < days) {
          day += 1;
          week.add(DateTime(monthDate.year, monthDate.month, day));
        } else {
          nextDays += 1;
          week.add(DateTime(monthDate.year, monthDate.month + 1, nextDays));
        }
      }
      monthDays.add(week);
    }

    return Container( 
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 18.0,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 12.0),
                  onPressed: (){
                    setState(() {
                      if (monthDate.month > 1){
                        monthDate = DateTime(monthDate.year, monthDate.month - 1, 1);
                        if (widget.onMonthChange != null){
                          widget.onMonthChange(monthDate);
                        }
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios,
                    color: monthDate.month == 1 ? Colors.transparent : Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 7.0),
                  child: Text(DateFormat('MMM yyyy').format(monthDate),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Gilroy-Bold',
                      fontSize: 16.0
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 18.0,
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(top: 12.0),
                  onPressed: (){
                    setState(() {
                      if (monthDate.month < 12){
                        monthDate = DateTime(monthDate.year, monthDate.month + 1, 1);                     
                        if (widget.onMonthChange != null){
                          widget.onMonthChange(monthDate);
                        }
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios,
                    color: monthDate.month == 12 ? Colors.transparent : Colors.black,
                  ),
                )
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, 
                (i) {
                  return Container(
                    child: Column(                      
                      children: List.generate(monthDays.length + 1, 
                        (k) {
                          if (k == 0){
                            return Container(
                              margin: EdgeInsets.only(bottom: 12.0),
                              alignment: Alignment.center,
                              child: Text(weekTitles[i],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gilroy-Bold',
                                  fontSize: 16.0
                                ),
                              )
                            );  
                          } else {
                            var date = monthDays[k - 1][i];
                            return InkWell(
                              onTap: () {
                                if (date.month == monthDate.month){
                                  setState(() {
                                    selectedDate = date;                                    
                                  });
                                  if (widget.onDateSelect != null){
                                    widget.onDateSelect(date);
                                  }
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 10.0, 
                                  right: 10.0, 
                                  bottom: 7.0, 
                                  top: 7.0
                                ),
                                margin: EdgeInsets.only(bottom: markedDates.contains(date) ? 0.0 : 15.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedDate == date ? AppColors.textLightPink : Colors.transparent,
                                  ), 
                                  borderRadius: BorderRadius.all(Radius.circular(50.0))
                                ),     
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                       // top: markedDates.contains(date) ? 0.0 : 7.5,
                                        //bottom: markedDates.contains(date) ? 0.0 : 14.5
                                      ),
                                      child: Text('${date.day}',
                                        style: TextStyle(
                                          color: date.month == monthDate.month ? Colors.black : Colors.grey,
                                          fontFamily: 'Gilroy',
                                          fontSize: 16.0
                                        ),
                                      ),
                                    ),
                                    markedDates.contains(date) ? 
                                    Container(
                                      padding: EdgeInsets.only(bottom: 0.0),
                                      child: Icon(Icons.favorite,
                                        color: AppColors.textLightPink,
                                        size: 15.0,
                                      ),
                                    ) : 
                                    Container()
                                  ]
                                )
                              )
                            );    
                          }               
                        }
                      )
                    ),
                  );
                }
              )
            ),
          )
        ],
      ),
    );
  }
}
