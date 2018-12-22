import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'login_page.dart';

import '../main/main_page.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../dialogs/dialogs.dart';

import '../../../models/user.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';

class SignUpPage extends StatefulWidget {

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode passwordNode = FocusNode();
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode passwordConfirmNode = FocusNode();

  File image;

  String email;
  String password;
  String firstName;
  String lastName;
  String passwordConfirm;

  @override
  void initState() {    
    super.initState(); 
  }

  
  String validateEmail(String email){
    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email) || email.length > 75){
      return 'Wrong email format';
    }
  }

  String validatePasswords(String pass){
    if (pass.length < 7){
      return 'Password too short';
    } else if (!RegExp(r'^[a-zA-Z0-9\._-]+$').hasMatch(pass)){
      return 'Your password should contain only a..z, 0..9, ._- symbols';
    } else if (password != passwordConfirm){
      return 'Passwords not matched';
    }
  }
  String validateName(String name){
    if (name.length < 1 || name.length > 50){
      return 'Name length should be from 1 to 50';
    }
  }

  void onSignUp(){
      formKey.currentState.save();
    if (formKey.currentState.validate()){
      Dialogs.showLoader(context);
      DataProvider.createUser(
        User(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirm,
          base64: image != null ? base64Encode(image.readAsBytesSync()) : null
        )
      ).timeout(Duration(seconds: 10), 
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
            Dialogs.showMessage(context, 'Email already taken', 'Please try again.', 'OK');
          }
        }
      );
    }
  }

  void onImageSelect() async {
    var res = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (res != null){
        image = res;                                        
      }
    });
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [ 
                        image != null ? 
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ): 
                        Container(),
                        IconButton(
                          onPressed: onImageSelect,
                          iconSize: 30.0,
                          icon: Icon(Icons.photo_camera, color: Colors.white),
                        )
                      ]
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
                            hintText: 'Email'
                          ),
                          validator: validateEmail,
                          onSaved: (email){
                            this.email = email;
                          },
                          onFieldSubmitted: (val){
                            FocusScope.of(context).requestFocus(firstNameNode);
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          focusNode: firstNameNode,
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
                            hintText: 'First Name'
                          ),
                          validator: validateName,
                          onSaved: (userName){
                            this.firstName = userName;
                          },
                          onFieldSubmitted: (val){
                            FocusScope.of(context).requestFocus(lastNameNode);
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Container(
                        child: TextFormField(
                          focusNode: lastNameNode,
                          keyboardType: TextInputType.text,
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
                            hintText: 'Last Name'
                          ),
                          validator: validateName,
                          onSaved: (lastName){
                            this.lastName = lastName;
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
                          validator: validatePasswords,
                          onSaved: (password){
                            this.password = password;
                          },
                          onFieldSubmitted: (val){
                            FocusScope.of(context).requestFocus(passwordConfirmNode);
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Container(
                        child: TextFormField(
                          focusNode: passwordConfirmNode,
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
                            hintText: 'Confirm Password'
                          ),
                          validator: validatePasswords,
                          onSaved: (password){
                            this.passwordConfirm = password;
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
                child: MainButton('SiGN UP',
                  onTap: onSignUp,
                ),
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
