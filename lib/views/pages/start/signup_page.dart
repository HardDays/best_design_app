import 'package:flutter/material.dart';

import 'login_page.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../../resources/app_colors.dart';

class SignUpPage extends StatefulWidget {

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode passwordNode = FocusNode();

  String userName;
  String password;

  @override
  void initState() {    
    super.initState(); 

  }


  String validateUserName(String userName){
    if (userName.isEmpty){
      return 'Empty username';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15.0, top: 10.0),
                    width: MediaQuery.of(context).size.height * 0.14,
                    height: MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/photo_border.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: IconButton(
                      iconSize: 30.0,
                      icon: Icon(Icons.photo_camera, color: Colors.white),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(right: 15.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Container(
                            child: ShadowText('Uplifting Women',
                              style: TextStyle(
                                color: AppColors.titleLightPink,
                                fontFamily: 'Norican',
                                fontSize: 30.0
                              ),
                            ),
                          ),
                        ]
                      ),
                    )
                  )
                ]
              ),
              Form(
                key: formKey,  
                child: Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
                          onFieldSubmitted: (val){
                            FocusScope.of(context).requestFocus(passwordNode);
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
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
                          onFieldSubmitted: (val){
                            FocusScope.of(context).requestFocus(passwordNode);
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
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
                          onFieldSubmitted: (val){
                            FocusScope.of(context).requestFocus(passwordNode);
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
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
                          onFieldSubmitted: (val){
                            FocusScope.of(context).requestFocus(passwordNode);
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
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
                          focusNode: passwordNode,
                          obscureText: true,
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
                            hintText: 'Password'
                          ),
                          validator: validatePassword,
                          onSaved: (password){
                            this.password = password;
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                    ]
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: MainButton('SiGN UP'),
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0, bottom: 15.0),
                child: InkWell(
                  child: Text('LOG IN',
                    style: TextStyle(
                      fontFamily: 'Gilroy-ExtraBold',
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context, 
                      DefaultPageRoute(builder: (context) => LoginPage()),
                    ); 
                  },
                ),
              ) 
            ],
          ),
        )
      )
    );
  }
}
