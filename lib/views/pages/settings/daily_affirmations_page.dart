import 'package:flutter/material.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../../resources/app_colors.dart';

class DailyAffirmationsPage extends StatefulWidget {

  @override
  DailyAffirmationsPageState createState() => DailyAffirmationsPageState();
}

class DailyAffirmationsPageState extends State<DailyAffirmationsPage> {
  

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
        title: Text('Daily Affirmations',
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
          margin: EdgeInsets.only(top: 0.0, bottom: 30.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,  
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Daily Affirmations Settings',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 16.0
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Daily Reminders',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0
                            ),
                          ),
                          Switch(
                            value: true,
                            activeColor: AppColors.iconBlue,
                            activeTrackColor: Colors.grey.withOpacity(0.3),
                            onChanged: (value) {

                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,  
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Timing',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 16.0
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Morning',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text('12:00AM',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 5.0)),
                                Text('•',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 16.0
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Afternoon',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text('12:00AM',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 5.0)),
                                Text('•',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 16.0
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Evening',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text('12:00AM',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 5.0)),
                                Text('•',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 16.0
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,  
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Sound',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 16.0
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Play Sound',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0
                            ),
                          ),
                          Switch(
                            value: true,
                            activeColor: AppColors.iconBlue,
                            activeTrackColor: Colors.grey.withOpacity(0.3),
                            onChanged: (value) {

                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        )
      )
    );
  }
}
