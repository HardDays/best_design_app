import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign textAlign;
  
  ShadowText(this.data, {this.textAlign, this.style}) : assert(data != null);

  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
            top: 2.0,
            left: 0.0,
            child: Text(data,
              textAlign: textAlign,
              style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontFamily: style.fontFamily,
                fontSize: style.fontSize,
                fontWeight: style.fontWeight
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: Text(data,
              textAlign: textAlign,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}