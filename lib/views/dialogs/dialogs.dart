import 'dart:async';
import 'dart:io';

import 'add_to_calendar_dialog.dart';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../models/care_affirmation.dart';
import '../../models/calendar_item.dart';

import '../../resources/app_colors.dart';

class Dialogs {

  static void showLoader(BuildContext context){
    showDialog(context: context, 
      child: WillPopScope(
        onWillPop: (){
          Navigator.pop(context);
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(AppColors.appBarBlue)
            ),
          )
        )           
      )
    );
  }
  
  static Future showThemedDialog(BuildContext context, Widget child) async {
    return await showDialog(context: context, 
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              color: Colors.black.withOpacity(0.4),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Stack(
                  alignment: Alignment.center,
                  children:[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(color: Colors.transparent),
                    ),
                    Column( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(Platform.isIOS ? 10.0 : 0.0)),
                            color: Colors.white
                          ),
                          child: child
                        )
                      ]
                    )
                  ]
                )
              )
            )
          )    
        );
      }
    );
  }

  static Future showCalendarInfo(BuildContext context){
    return showThemedDialog(context, 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
            child: Text('Calendar',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Gilroy-Bold',
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gilroy',
                  fontSize: 16.0
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Calendar The calendar is set up to remind you to love, spoil and make yourself a priority even if it’s for 5-10 minutes. You have the option to choose from a list of items to schedule “me” time. You can choose items for every day of the week or several times a week or month, your choice. So, go ahead and ',
                  ),
                  TextSpan(text: 'love thyself.', 
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                    )
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text('OK',
                style: TextStyle(
                  fontFamily: 'Gilroy-ExtraBold',
                  color: AppColors.textBlue,
                  fontSize: 18.0
                ),
              ),
            ),
          ) 
        ],
      )
    );
  }

  static Future showCareListInfo(BuildContext context){
    return showThemedDialog(context, 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
            child: Text('Self Love/Self Care List',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Gilroy-Bold',
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gilroy',
                  fontSize: 16.0
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'A simple yet important list of items to help you make yourself a priority. Self Love/Self Care is important to all of us. Each month offers a list of items that we hope you choose from to ',
                  ),
                  TextSpan(text: 'spoil yourself.', 
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                    )
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text('OK',
                style: TextStyle(
                  fontFamily: 'Gilroy-ExtraBold',
                  color: AppColors.textBlue,
                  fontSize: 18.0
                ),
              ),
            ),
          ) 
        ],
      )
    );
  }

  static Future showPositiveInfo(BuildContext context){
    return showThemedDialog(context, 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
            child: Text('Positive Affirmations',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Gilroy-Bold',
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gilroy',
                  fontSize: 16.0
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Affirmations are positive statements that can counteract some of our negative thoughts and habits, resonating with the alpha brain waves and enabling us to achieve empowerment. \n\n',
                  ),
                  TextSpan(
                    text: 'Positive affirmations can make us feel better about ourselves and help us focus on our goals. Scientific research suggests that they also produce chemical changes in the brain and create tangible benefits for those who use them. ',
                  ),
                  TextSpan(text: 'Say it and Believe it.', 
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                    )
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text('OK',
                style: TextStyle(
                  fontFamily: 'Gilroy-ExtraBold',
                  color: AppColors.textBlue,
                  fontSize: 18.0
                ),
              ),
            ),
          ) 
        ],
      )
    );
  }

  static Future showBucketListInfo(BuildContext context){
    return showThemedDialog(context, 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
            child: Text('Bucket List',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Gilroy-Bold',
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gilroy',
                  fontSize: 16.0
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Have you been thinking about creating a bucket list for yourself? Would you consider sharing your bucket list with your family/friends? \n\n',
                  ),
                  TextSpan(
                    text: 'Would you consider sharing your bucket list with your family/friends? We’ve listed some popular items that people have in their Bucket List. \nYou can also ',
                  ),
                  TextSpan(text: 'create your own.', 
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                    )
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text('OK',
                style: TextStyle(
                  fontFamily: 'Gilroy-ExtraBold',
                  color: AppColors.textBlue,
                  fontSize: 18.0
                ),
              ),
            ),
          ) 
        ],
      )
    );
  }

  static Future showMessage(BuildContext context, String title, String body, String ok){
    return showThemedDialog(context, 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
            child: Text(title,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Gilroy-Bold',
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
            child: Text(body,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Gilroy'
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text(ok,
                style: TextStyle(
                  fontFamily: 'Gilroy-ExtraBold',
                  color: AppColors.textBlue,
                  fontSize: 18.0
                ),
              ),
            ),
          ) 
        ],
      )
    );
  }

  static Future showAddToCalendar(BuildContext context, {CareAffirmation careAffirmation, CalendarItem calendarItem}){
    return showThemedDialog(context,
      AddToCalendarDialog(
        careAffirmation: careAffirmation,
        calendarItem: calendarItem,
      )
    );
  }

  static Future showYesNo(BuildContext context, String title, String body, String yes, String no, {Function onYes, Function onNo}){
    return showThemedDialog(context, 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 60.0, right: 60.0),
            child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Gilroy-Bold',
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            child: Text(body,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Gilroy'
              )
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: InkWell(
                  onTap: (){
                    if (onNo != null){
                      onNo();
                    }
                    Navigator.pop(context);
                  },
                  child: Text(no,
                    style: TextStyle(
                      fontFamily: 'Gilroy-ExtraBold',
                      color: Colors.grey,
                      fontSize: 18.0
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: InkWell(
                  onTap: (){
                    if (onYes != null){
                      onYes();
                    }
                    Navigator.pop(context);
                  },
                  child: Text(yes,
                    style: TextStyle(
                      fontFamily: 'Gilroy-ExtraBold',
                      color: AppColors.textBlue,
                      fontSize: 18.0
                    ),
                  ),
                ),
              )
            ]
          )
        ],
      )
    );
  }
  
}