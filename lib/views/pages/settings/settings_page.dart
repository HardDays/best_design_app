import 'package:flutter/material.dart';

import 'contact_us_page.dart';
import 'profile_page.dart';
import 'daily_affirmations_page.dart';
import 'privacy_page.dart';

import '../main/main_page.dart';

import '../start/start_page.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';

class SettingsPage extends StatefulWidget {

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {

  @override
  void initState() {    
    super.initState(); 
  }

  Widget buildSetting(String name, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          DefaultPageRoute(builder: (context) => page),
        ); 
      },
      child: Container(
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0, right: 12.0, left: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        margin: EdgeInsets.only(
          top: 0.0, 
          left: 10.0, 
          right: 10.0, 
          bottom: 5.0
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0
                  ),
                ),
              )
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
              child: Icon(Icons.arrow_forward_ios, color: AppColors.iconBlue)
            )
          ],
        ),
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
       appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
        title: Text('Settings',
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
        color: Colors.grey.withOpacity(0.1),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 17.0)),
                buildSetting('Profile', ProfilePage()),
                buildSetting('Daily Affirmations', DailyAffirmationsPage()),
                buildSetting('Contact Us', ContactUsPage()),
                buildSetting('Privacy Notice', PrivacyPage())
              ]
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25.0),
              child: MainButton('LOG OUT', 
                onTap: (){
                  DataProvider.logout();
                  while (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  Navigator.pushReplacement(
                    context, 
                    DefaultPageRoute(builder: (context) => StartPage()),
                  );  
                },
                bgColor: AppColors.iconBlue, 
                textColor: Colors.white
              )
            )
          ],
        )
      )
    );
  }
}
