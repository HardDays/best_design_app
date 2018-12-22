import 'package:flutter/material.dart';

import 'signup_page.dart';
import 'forgot_password_page.dart';

import '../main/main_page.dart';

import '../../dialogs/dialogs.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';

class LoginPage extends StatefulWidget {

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<LoginPage> {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode passwordNode = FocusNode();

  String email;
  String password;

  @override
  void initState() {    
    super.initState(); 

  }

  void onLogin() {
    formKey.currentState.save();
    if (formKey.currentState.validate()){
      Dialogs.showLoader(context);
      DataProvider.login(email, password).timeout(Duration(seconds: 10), 
        onTimeout: (){
          Navigator.pop(context);
          Dialogs.showMessage(context, 'Server not responding', 'Please, try again later.', 'OK');
        }
      ).then(
        (res) {
          Navigator.pop(context);
          if (res){
              while (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushReplacement(
                context, 
                DefaultPageRoute(builder: (context) => MainPage()),
              );  
          } else {
            Dialogs.showMessage(context, 'Unauthorized', 'Wrong email or password.', 'OK');
          }
        }
      );
    }
  }


  String validateUserName(String userName){
    if (userName.isEmpty){
      return 'Empty email';
    }
  }

  String validatePassword(String pass){
    if (pass.isEmpty){
      return 'Empty password';
    }
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
                margin: EdgeInsets.only(top: 15.0),
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
                child: ShadowText('Uplifting Women',
                  style: TextStyle(
                    color: AppColors.titleLightPink,
                    fontFamily: 'Norican',
                    fontSize: 36.0
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
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: AppColors.textDarkPink,
                            fontSize: 20.0,
                            fontFamily: 'Gilroy-SemiBold',
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.2),
                            filled: true,
                            contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                            hintStyle: TextStyle(
                              color: AppColors.textDarkPink.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            focusedBorder: OutlineInputBorder(      
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              borderSide: BorderSide(
                                color: Colors.white, 
                                width: 1.5
                              ),   
                            ),  
                            enabledBorder: OutlineInputBorder(      
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.6), 
                                width: 1.5
                              ),   
                            ),  
                            errorBorder: OutlineInputBorder(      
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.6), 
                                width: 1.5
                              ),   
                            ),  
                            focusedErrorBorder: OutlineInputBorder(      
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              borderSide: BorderSide(
                                color: Colors.white, 
                                width: 1.5
                              ),   
                            ),
                            hintText: 'Email'
                          ),
                          validator: validateUserName,
                          onSaved: (userName){
                            this.email = userName;
                          },
                          onFieldSubmitted: (val){
                            FocusScope.of(context).requestFocus(passwordNode);
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Container(
                        child: TextFormField(
                          focusNode: passwordNode,
                          obscureText: true,
                          style: TextStyle(
                            color: AppColors.textDarkPink,
                            fontSize: 20.0,
                            fontFamily: 'Gilroy-SemiBold',
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.2),
                            filled: true,
                            contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                            hintStyle: TextStyle(
                              color: AppColors.textDarkPink.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            focusedBorder: OutlineInputBorder(      
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              borderSide: BorderSide(
                                color: Colors.white, 
                                width: 1.5
                              ),   
                            ),
                            enabledBorder: OutlineInputBorder(      
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.6), 
                                width: 1.5
                              ),   
                            ),  
                            errorBorder:  OutlineInputBorder(      
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.6),
                                width: 1.5
                              ),   
                            ),  
                            focusedErrorBorder: OutlineInputBorder(      
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              borderSide: BorderSide(
                                color: Colors.white, 
                                width: 1.5
                              ),   
                            ),  
                            hintText: 'Password'
                          ),
                          validator: validatePassword,
                          onSaved: (password){
                            this.password = password;
                          },
                        ),
                      )
                    ]
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0, top: 10.0),
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context, 
                      DefaultPageRoute(builder: (context) => ForgotPasswordPage()),
                    ); 
                  },
                  child: Text('Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                      color: AppColors.textPurple,
                      fontSize: 18.0
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
                child: MainButton('LOG IN',
                  onTap: onLogin,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: InkWell(
                  onTap: () {
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
      )
    );
  }
}
