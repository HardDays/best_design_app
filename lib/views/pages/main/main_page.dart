import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'calendar_page.dart';
import 'care_list_page.dart';
import 'affirmations_page.dart';
import 'bucket_list_page.dart';

import '../settings/settings_page.dart';

import '../../widgets/main_button.dart';

import '../../dialogs/dialogs.dart';

import '../../routes/default_page_route.dart';

import '../../../helpers/data_provider.dart';

import '../../../models/settings.dart';

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

    var date = DateTime.now();

    WidgetsBinding.instance.addPostFrameCallback((_){
      if (DataProvider.getSettings().lastMonthlyDate.day < date.day){
        Dialogs.showDailyRemainder(context, 
          '${DateFormat('MMMM').format(date)} Daily Affirmation', 
          DataProvider.getMonthAffirmations()[date.month - 1], 
          'OK'
        );
        DataProvider.setSettings(Settings(lastMonthlyDate: date));
      }
    });
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
          Container(
            width: 70.0,
            height: 100.0,
            child: InkWell(
              onTap: (){
                // for (var list in DataProvider.positiveAffirmations.values){
                //   for (var item in list){
                //     debugPrint('PositiveAffirmation.new(title: \'${item.title}\', category: \'${item.category}\')\nitem.save');
                //   }
                // }
                // return;
                Navigator.push(
                  context, 
                  DefaultPageRoute(builder: (context) => SettingsPage()),
                ); 
              },
              child: Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 7.0, right: 14.0, left: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3.0),      
                  ),
                  child:  DataProvider.currentUser?.imageId != null ?
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(DataProvider.getImage(DataProvider.currentUser?.imageId))
                      )
                    )  
                  ) : 
                  Container(
                    child: Icon(Icons.person),
                  )
                )
              ),
            )
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
              buildItem('Positive Affirmations', 'assets/images/positive_card_bg.png', () => Dialogs.showPositiveInfo(context), AffirmationsPage()),
              buildItem('Bucket List', 'assets/images/bucket_list_card_bg.png', () => Dialogs.showBucketListInfo(context), BucketListPage())
            ],
          ),
        )
      )
    );
  }
}
