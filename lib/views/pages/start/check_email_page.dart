import 'package:flutter/material.dart';

import 'signup_page.dart';

import '../../widgets/main_button.dart';

import '../../routes/default_page_route.dart';

import '../../../resources/app_colors.dart';

class CheckEmailPage extends StatefulWidget {

  @override
  CheckEmailPageState createState() => CheckEmailPageState();
}

class CheckEmailPageState extends State<CheckEmailPage> {

  @override
  void initState() {    
    super.initState(); 

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.bgGradient,
              Colors.transparent,
              AppColors.bgGradient,
            ]
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 30.0, left: 10.0),
                child: InkWell(
                  child: Icon(Icons.arrow_back, 
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0),
                child: Text('Uplifting Women',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ClickerScript',
                    fontSize: 40.0
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Text('Check your email!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy-Bold',
                    fontSize: 24.0
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                child: MainButton('CONTIUE',
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pop(context); 
                  },
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
