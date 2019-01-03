import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as gcal; 
import 'package:googleapis_auth/auth_io.dart' as auth;

import '../main/google_auth_page.dart';

import '../../dialogs/dialogs.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';

class ExportPage extends StatefulWidget {

  @override
  ExportPageState createState() => ExportPageState();
}

class ExportPageState extends State<ExportPage> {


  @override
  void initState() {    
    super.initState(); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
       appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
        title: Text('Export Calendar',
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
                //Dialogs.showMessage(context, 'Self Love/Self Care List', AppText.careDescription, 'OK');
              },
            ),
          )
        ]
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.withOpacity(0.1),
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 10.0),
                  child: Text('Export to Google Calendar',
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0, bottom: 10.0),
                   child: Text('Here you can export your Self Love/Self Care calendar events to the Google calendar. \n\nIf this is your first export, a new calendar will be created. \n\nIf you have previously exported your Uplifting Women calendar, then all events in your Google Calendar will be updated according to the Uplifting Women calendar. \n\nYou may need to log into your Google account to give the Uplifting Women app permission to update your Google calendar.',
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 25.0, top: 15.0),
                  child: MainButton('EXPORT', 
                    onTap: () {
                      var id = auth.ClientId("28733438167-napvbspic05elhc41fj3nddemb4tlk64.apps.googleusercontent.com", 'yIyY4pEqy8yFcqugmlyfRo6S');
                      var scopes = [gcal.CalendarApi.CalendarScope];

                      auth.clientViaUserConsent(id, scopes, (url) {
                        Navigator.push(
                          context, 
                          DefaultPageRoute(builder: (context) => GoogleAuthPage(url: url)),
                        ); 
                      }).then((auth.AuthClient client) async {
                        Navigator.pop(context);
                        
                        Dialogs.showMessage(context, 'Success', 'Your Google Calendar will be updated soon.', 'OK');

                        var api = gcal.CalendarApi(client);
                        gcal.Calendar calendar;
                        String ran_cal_timezone;

                        var calendars = await api.calendarList.list();
                        for (var cal in calendars.items) {
                          ran_cal_timezone = cal.timeZone;
                          if (cal.summary == 'Uplifting Women') {
                            await api.calendars.delete(cal.id);
                            // calendar = gcal.Calendar();
                            // calendar.id = cal.id;
                            // calendar.timeZone = cal.timeZone;
                          }
                        }

                        if (calendar == null){
                          var newCal = gcal.Calendar();
                          newCal.description = 'Uplifting Women';
                          newCal.summary = 'Uplifting Women';
                          newCal.etag = 'upwomen';
                          newCal.timeZone = ran_cal_timezone;
                          calendar = await api.calendars.insert(newCal);
                        }

                      
                        // var events = await api.events.list(calendar.id);
                        // for (var event in events.items){
                        //   try {
                        //     await api.events.delete(calendar.id, event.id);
                        //   } catch(ex){
                        //     var t = 0;
                        //   }
                        // } 
                        
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
                      }, 
                        onError: (){

                        }
                      );
                    },
                    bgColor: AppColors.iconBlue, 
                    textColor: Colors.white
                  )
                )
              ],
            ),
          )
        )
      )
    );
  }
}
