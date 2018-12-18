import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/main_button.dart';
import '../../widgets/tcalendar.dart';

import '../../dialogs/dialogs.dart';

import '../../routes/default_page_route.dart';

import '../../../models/calendar_item.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text.dart';

class CalendarPage extends StatefulWidget {

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {

  CalendarController controller;  

  DateTime selectedDate;
  DateTime selectedMonth;

  List<String> monthAffirmations;

  Map<DateTime, List<CalendarItem>> calendar;

  @override
  void initState() {    
    super.initState();
    
    selectedMonth = DateTime.now().year < 2019 ? DateTime(2019, 1, 1) : DateTime.now();
    selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    controller = CalendarController();

    monthAffirmations = DataProvider.getMonthAffirmations();

    calendar = DataProvider.getDateCalendarItems();

    AssetImage('assets/images/calendar_bg.png');
  }

  void onDateSelect(DateTime date){
    setState(() {
      selectedDate = DateTime(date.year, date.month, date.day);
    });
  }

  void onMonthChange(DateTime date){
    setState(() {
      selectedMonth = date;      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
        title: Text('Calendar',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Gilroy',
            fontSize: 18.0
          ),
        ),
        actions: <Widget>[
          Container(
            child: IconButton(
              iconSize: 20.0,
              alignment: Alignment.center,
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: (){
                Dialogs.showCalendarInfo(context);
              },
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/calendar_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(  
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text('${DateFormat('MMMM').format(selectedMonth)} Daily Affirmation',
                        style: TextStyle(
                          color: AppColors.textDarkBlue,
                          fontSize: 16.0,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      alignment: Alignment.topCenter,
                      child: Text(monthAffirmations[selectedMonth.month - 1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textLightPink,
                          fontSize: 25.0,
                          fontFamily: 'CherrySwash',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                // child: Calendar(
                //   selectedDateTime: selectedDate,
                //   markedDateTimes: calendar.keys.toList(),
                //   height: MediaQuery.of(context).size.height * 0.5, 
                //   onDayPressed: onDateSelect,
                //   onMonthChanged: onMonthChange,
                // )
                child: Calendar(
                  controller: controller,
                  selectedDate: selectedDate,
                  markedDates: calendar.keys.toList(),
                  onDateSelect: onDateSelect,
                  onMonthChange: onMonthChange
                ),
              ),
              calendar.containsKey(selectedDate) ? 
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 15.0),
                      child: Text(DateFormat('MMMM dd, yyyy').format(selectedDate),
                        style: TextStyle(
                          color: AppColors.textDarkPink,
                          fontSize: 18.0,
                          fontFamily: 'Gilroy-Bold',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.0, right: 10.0, left: 10.0, bottom: 5.0),
                      child: Column(
                        children: List.generate(calendar[selectedDate].length, 
                          (ind) {
                            var item = calendar[selectedDate][ind];
                            return Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(DateFormat('hh:mma').format(DateTime(2018, 12, 12, item.alertTime.hour, item.alertTime.minute)),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Gilroy',
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: Text(item.careAffirmation.title,
                                        maxLines: 3,
                                        style: TextStyle(
                                          color: AppColors.textDarkPink,
                                          fontSize: 16.0,
                                          fontFamily: 'Gilroy',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: InkWell(
                                      onTap: () {
                                        Dialogs.showAddToCalendar(context, calendarItem: item).then((res){
                                          setState(() {
                                            calendar = DataProvider.getDateCalendarItems();
                                            controller.setMarkedDates(calendar.keys.toList());
                                          });
                                        });
                                      },
                                      child: Text('edit',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy-Medium',
                                          color: Colors.black,
                                          fontSize: 16.0
                                        ),
                                      ),
                                    ),
                                  ) 
                                ],
                              ),
                            );
                          }
                        )
                      )
                    )
                  ],
                ),
              ) : 
              Container(),
            ],
          ),
        )
      )
    );
  }
}
