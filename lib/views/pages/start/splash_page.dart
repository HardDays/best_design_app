import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF2DC1D4),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              )
            ),
            Padding(padding: EdgeInsets.only(top: 5.0)),  
            Text('Uplifting Women',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Norican',
                fontSize: 45.0,
                color: AppColors.textDarkPink,
              ),
            ),
          ]
        )
      )
    );
  }
} 