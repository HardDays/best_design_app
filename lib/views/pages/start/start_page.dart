import 'package:flutter/material.dart';

import 'signup_page.dart';
import 'login_page.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../../resources/app_colors.dart';

class StartPage extends StatefulWidget {

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  
  @override
  void initState() {    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/start_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 75.0, left: 20.0, right: 20.0),
              padding: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white.withOpacity(0.8)
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: ShadowText('Welcome',
                      style: TextStyle(
                        color: AppColors.textDarkPink,
                        fontFamily: 'Norican',
                        fontSize: 48.0
                      ),
                    ),
                  ),
                  Text('Today is a new day. A great day to take charge of your life. To love yourself and appreciate your uniqueness. To feel confident, see no boundaries or limits on what you can achieve. To empower yourself, the women and girls around you. The world is yours, if you’re bold enough to take it. I know you are! ',
                    style: TextStyle(
                      color: AppColors.textDarkPink,
                      fontFamily: 'Gilroy-Medium',
                      fontSize: 16.0
                    ),
                  ),
                ]
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
              child: MainButton('LOG IN', 
                onTap: () {
                  Navigator.push(
                    context, 
                    DefaultPageRoute(builder: (context) => LoginPage()),
                  );  
                }
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context, 
                    DefaultPageRoute(builder: (context) => SignUpPage()),
                  ); 
                },
                child: Text('SIGN UP',
                  style: TextStyle(
                    fontFamily: 'Gilroy-ExtraBold',
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                ),
              ),
            ) 
          ],
        ),
      )
    );
  }
}
