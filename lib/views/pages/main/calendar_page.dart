import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:googleapis/calendar/v3.dart' as gcal; 
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:timezone/timezone.dart';
import 'package:timezone/standalone.dart';

import 'google_auth_page.dart';

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
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 0.0),
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
              Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 25.0, top: 15.0),
              child: MainButton('EXPORT TO GOOGLE', 
                onTap: () {
                  var id = auth.ClientId("28733438167-napvbspic05elhc41fj3nddemb4tlk64.apps.googleusercontent.com", 'yIyY4pEqy8yFcqugmlyfRo6S');
                  var scopes = [gcal.CalendarApi.CalendarScope];

                  auth.clientViaUserConsent(id, scopes, (url){
                    Navigator.push(
                      context, 
                      DefaultPageRoute(builder: (context) => GoogleAuthPage(url: url)),
                    ); 
                  }).then((auth.AuthClient client) async {
                    Navigator.pop(context);
                    
                    Dialogs.showMessage(context, 'Success', 'Your Google Calendar will be updated soon.', 'OK');

                    var api = gcal.CalendarApi(client);
                    gcal.Calendar calendar;

                    var calendars = await api.calendarList.list();
                    for (var cal in calendars.items) {
                      if (cal.summary == 'Uplifting Women') {
                        calendar = gcal.Calendar();
                        calendar.id = cal.id;
                        calendar.timeZone = cal.timeZone;
                        break;
                      }
                    }

                    if (calendar == null){
                      var newCal = gcal.Calendar();
                      newCal.description = 'Uplifting Women';
                      newCal.summary = 'Uplifting Women';
                      newCal.etag = 'upwomen';
                      calendar = await api.calendars.insert(newCal);
                    }

                    try {
                      var events = await api.events.list(calendar.id);
                      for (var event in events.items){
                        await api.events.delete(calendar.id, event.id);
                      } 
                    } catch (ex){

                    }

                    var dates = DataProvider.getDateCalendarItems();

                    for (var date in dates.keys) { 
                      for (var affir in dates[date]){
                        var event = gcal.Event();
                        event.summary = affir.careAffirmation.title;
                        event.start = gcal.EventDateTime();
                        event.start.timeZone = calendar.timeZone;
                        event.start.dateTime = DateTime(date.year, date.month, date.day, affir.alertTime.hour, affir.alertTime.minute);
                        event.end = gcal.EventDateTime();
                        event.end.timeZone = calendar.timeZone;
                        event.end.dateTime = event.start.dateTime.add(Duration(minutes: 5));
                        await api.events.insert(event, calendar.id);        
                      }
                    }
                    client.close();
                  });
                },
                bgColor: Colors.white, 
                textColor: AppColors.iconBlue
              )
            )
            ],
          ),
        )
      )
    );
  }
}
