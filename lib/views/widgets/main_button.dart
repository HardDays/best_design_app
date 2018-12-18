import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class MainButton extends StatelessWidget {
  
  final String text;
  final Function onTap;
  final Color bgColor;
  final Color textColor;
  
  MainButton(this.text, {this.onTap, this.bgColor = Colors.white, this.textColor = AppColors.textDarkPink});
  
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0, top: 15.0),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0),
                topRight: Radius.circular(100.0),
                bottomLeft: Radius.circular(100.0)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0
                )
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0),
                topRight: Radius.circular(100.0),
                bottomLeft: Radius.circular(100.0)
              ),
            ),
            child: Center(
              child: InkWell(
                onTap: onTap,
                child: Text(text,
                  style: TextStyle(
                    fontFamily: 'Gilroy-ExtraBold',
                    color: textColor,
                    fontSize: 20.0
                  ),
                ),
              ),
            )
          )
        ]
      )
    );
  }
}