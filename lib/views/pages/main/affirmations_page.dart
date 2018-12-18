import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'positive_list_page.dart';

import '../../widgets/shadow_text.dart';

import '../../dialogs/dialogs.dart';

import '../../routes/default_page_route.dart';

import '../../../helpers/data_provider.dart';
import '../../../models/positive_affirmation.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text.dart';

class AffirmationsPage extends StatefulWidget {

  @override
  AffirmationsPageState  createState() => AffirmationsPageState();
}

class AffirmationsPageState extends State<AffirmationsPage> {
  
  @override
  void initState() {    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
        title: Text('Positive Affirmations',
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
                Dialogs.showPositiveInfo(context);
              },
            ),
          )
        ]
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/affirmation_header.png'),
                  fit: BoxFit.cover,
                  //colorFilter: ColorFilter.mode(AppColors.affirmationsHeader, BlendMode.color),
                )
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('Positive Affirmations',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cookie',
                        fontSize: 30.0
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    child: Text('What aspects of your life would you like to focus on? Choose from the three lists below (Health & Beauty, Love and Abundance) and make a Personal Affirmation List of your own. Read it, believe it and focus on the positive changes you want in your life.',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy-Bold',
                        fontSize: 14.0
                      ),
                    ),
                  ),
                ],
              ),  
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Expanded(
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        DefaultPageRoute(builder: (context) => 
                          PositiveListPage(
                            title: 'Health And Beauty',
                            category: PositiveCategory.healthAndBeauty
                          )
                        ),
                      ); 
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                      width: MediaQuery.of(context).size.width * 0.5 - 7.5,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/health_card_bg.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0, left: 10.0),
                            child: ShadowText('HEALTH & \nBEAUTY', 
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        DefaultPageRoute(builder: (context) => 
                          PositiveListPage(
                            title: 'Love',
                            category: PositiveCategory.love
                          )
                        ),
                      ); 
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
                      width: MediaQuery.of(context).size.width * 0.5 - 7.5,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/love_card_bg.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0, left: 10.0),
                            child: ShadowText('LOVE', 
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  ),
                ],  
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        DefaultPageRoute(builder: (context) => 
                          PositiveListPage(
                            title: 'Abundance',
                            category: PositiveCategory.abundance
                          )
                        ),
                      ); 
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                      width: MediaQuery.of(context).size.width * 0.5 - 7.5,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/abundance_card_bg.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0, left: 10.0),
                            child: ShadowText('ABUNDANCE', 
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        DefaultPageRoute(builder: (context) => 
                          PositiveListPage(
                            title: 'Personal Affirmations',
                            category: PositiveCategory.personal
                          )
                        ),
                      ); 
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
                      width: MediaQuery.of(context).size.width * 0.5 - 7.5,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/personal_card_bg.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0, left: 10.0),
                            child: ShadowText('MY PERSONAL \nAFFIRMATIONS', 
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  ),
                ],  
              ),
            ),
          ]
        )
      )
    );
  }
}
