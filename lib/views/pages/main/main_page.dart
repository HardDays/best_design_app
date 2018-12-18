import 'package:flutter/material.dart';

import 'calendar_page.dart';
import 'care_list_page.dart';
import 'affirmations_page.dart';
import 'bucket_list_page.dart';

import '../settings/settings_page.dart';

import '../../widgets/main_button.dart';

import '../../dialogs/dialogs.dart';

import '../../routes/default_page_route.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text.dart';

class MainPage extends StatefulWidget {

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  
  @override
  void initState() {    
    super.initState();

    DataProvider.init();
  }

  Widget buildItem(String name, String image, Function onInfo, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          DefaultPageRoute(builder: (context) => page),
        ); 
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [ 
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            padding: EdgeInsets.only(left: 15.0),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.transparent
                ]
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(1.0),
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                ]
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20.0, top: 5.0),
                  child: Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cookie',
                      fontSize: 30.0
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    iconSize: 22.0,
                    alignment: Alignment.bottomRight,
                    icon: Icon(Icons.info, color: Colors.white),
                    onPressed: onInfo
                  ),
                )
              ]
            )
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
        leading: Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        title: Text('Uplifting Woman',
          style: TextStyle(
            color: AppColors.titleLightPink,
            fontFamily: 'Norican',
            fontSize: 25.0
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(
                context, 
                DefaultPageRoute(builder: (context) => SettingsPage()),
              ); 
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(  
            children: <Widget>[
              buildItem('Calendar', 'assets/images/calendar_card_bg.png', () => Dialogs.showCalendarInfo(context), CalendarPage()),
              buildItem('Self Love/Self Care List', 'assets/images/self_love_card_bg.png', () => Dialogs.showCareListInfo(context), CareListPage()),
              buildItem('Positive Affirmation', 'assets/images/positive_card_bg.png', () => Dialogs.showPositiveInfo(context), AffirmationsPage()),
              buildItem('Bucket List', 'assets/images/bucket_list_card_bg.png', () => Dialogs.showBucketListInfo(context), BucketListPage())
            ],
          ),
        )
      )
    );
  }
}
