import 'dart:async';
import 'dart:io';

import 'add_to_calendar_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../models/care_affirmation.dart';

import '../../resources/app_colors.dart';

class Dialogs {
  
  static Future showThemedDialog(BuildContext context, Widget child) async {
    return await showDialog(context: context, 
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              color: Colors.black.withOpacity(0.4),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Stack(
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
                  fontSize: 20.0
                ),
              ),
            ),
          ) 
        ],
      )
    );
  }

  static Future showAddToCalendar(BuildContext context, CareAffirmation careAffirmation){
    return showThemedDialog(context,
      AddToCalendarDialog(
        careAffirmation: careAffirmation,
      )
    );
  }

  static void showYesNo(BuildContext context, String title, String body, String yes, String no, {Function onYes, Function onNo}){
    showDialog(context: context, 
      child: AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          FlatButton(
            child: Text(yes),
            onPressed: onYes ?? (){}
          ),
          FlatButton(
            child: Text(no,
              style: TextStyle(
                color: AppColors.textPurple
              ),
            ),
            onPressed: onNo ?? (){}                              
          ),               
        ],
      )
    );
  }
  
}