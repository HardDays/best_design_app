import 'package:flutter/material.dart';

import 'check_email_page.dart';

import '../../widgets/main_button.dart';

import '../../routes/default_page_route.dart';

import '../../../resources/app_colors.dart';

class ForgotPasswordPage extends StatefulWidget {

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String userName;

  @override
  void initState() {    
    super.initState(); 

  }

  String validateUserName(String userName){
    if (userName.isEmpty){
      return 'Empty username';
    }
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
                margin: EdgeInsets.only(top: 15.0),
                child: Text('Forgot your password?\nEnter the email address you used when you created your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy-Bold',
                    fontSize: 20.0
                  ),
                ),
              ),
              Form(
                key: formKey,  
                child: Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                  child: Column(
                    children: <Widget>[ 
                      Container(
                        height: 45.0,
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          border: Border.all(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100.0),
                            bottomRight: Radius.circular(100.0),
                            topRight: Radius.circular(100.0),
                            bottomLeft: Radius.circular(100.0)
                          ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: AppColors.textDarkPink,
                            fontSize: 20.0,
                            fontFamily: 'Gilroy-SemiBold',
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: AppColors.textDarkPink.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            focusedBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: Colors.transparent),   
                            ),
                            enabledBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: Colors.transparent),   
                            ),   
                            hintText: 'Email'
                          ),
                          validator: validateUserName,
                          onSaved: (userName){
                            this.userName = userName;
                          },  
                        ),
                      ),
                    ]
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: MainButton('RESTORE',
                  onTap: (){
                    Navigator.push(
                      context, 
                      DefaultPageRoute(builder: (context) => CheckEmailPage()),
                    ); 
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
