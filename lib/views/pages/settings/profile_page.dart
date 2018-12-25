import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';
import '../../dialogs/dialogs.dart';

import '../../../models/user.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';

class ProfilePage extends StatefulWidget {

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode emailNode = FocusNode();
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

    emailNode.addListener((){
      setState(() {        
      });
    });
    firstNameNode.addListener((){
      setState(() {        
      });
    });
    lastNameNode.addListener((){
      setState(() {        
      });
    });
    passwordNode.addListener((){
      setState(() {        
      });
    });
    passwordConfirmNode.addListener((){
      setState(() {        
      });
    });
  }

  String validateEmail(String email){
    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email) || email.length > 75){
      return 'Wrong email format';
    }
  }

  String validatePasswords(String pass){
    if (pass.isNotEmpty){
      if (pass.length < 7){
        return 'Password too short';
      } else if (!RegExp(r'^[a-zA-Z0-9\._-]+$').hasMatch(pass)){
        return 'Your password should contain only a..z, 0..9, ._- symbols';
      } else if (password != passwordConfirm){
        return 'Passwords not matched';
      }
    }
  }
  String validateName(String name){
    if (name.length < 1 || name.length > 50){
      return 'Name length should be from 1 to 50';
    }
  }

  void onSave(){
    formKey.currentState.save();
    if (formKey.currentState.validate()){
      Dialogs.showLoader(context);
      DataProvider.updateUser(
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
            Navigator.pop(context);
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
       appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
        title: Text('Profile',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Gilroy',
            fontSize: 18.0
          ),
        ),
        actions: <Widget>[
          Container(
            child: IconButton(
              iconSize: 20.0,
              alignment: Alignment.center,
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: (){
                //Dialogs.showMessage(context, 'Self Love/Self Care List', AppText.careDescription, 'OK');
              },
            ),
          )
        ]
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.withOpacity(0.1),
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15.0, top: 20.0),
                  width: MediaQuery.of(context).size.height * 0.14,
                  height: MediaQuery.of(context).size.height * 0.14,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/photo_blue_border.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  alignment: Alignment.topLeft,
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
                      Container(
                        decoration: DataProvider.currentUser?.imageId != null ? 
                         BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(DataProvider.getImage(DataProvider.currentUser?.imageId))
                          )
                        ) :
                        BoxDecoration()
                      ),
                      IconButton(
                        onPressed: onImageSelect,
                        iconSize: 30.0,
                        icon: Icon(Icons.photo_camera, color: (image == null && DataProvider.currentUser?.imageId == null) ? AppColors.iconBlue : Colors.white),
                      )
                    ]
                  ),
                ),        
                Form(
                  key: formKey,  
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Column(
                      children: <Widget>[ 
                        Container(
                          height: 45.0,
                          child: TextFormField(
                            initialValue: DataProvider.currentUser.email,
                            focusNode: emailNode,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: emailNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                              hintStyle: TextStyle(
                                color: emailNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                                fontSize: 20.0,
                                fontFamily: 'Gilroy-SemiBold',
                              ),
                              focusedBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),   
                              ),
                              enabledBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),
                              errorBorder:  OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),  
                              focusedErrorBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),  
                              ),   
                              hintText: 'Email'
                            ),
                            validator: validateEmail,
                            onSaved: (value){
                              setState(() {
                                email = value;
                              });
                            },
                            onFieldSubmitted: (val){
                              FocusScope.of(context).requestFocus(firstNameNode);
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Container(
                          height: 45.0,
                          child: TextFormField(
                            initialValue: DataProvider.currentUser.firstName,
                            focusNode: firstNameNode,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: firstNameNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                              hintStyle: TextStyle(
                                color: firstNameNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                                fontSize: 20.0,
                                fontFamily: 'Gilroy-SemiBold',
                              ),
                              focusedBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),   
                              ),
                              enabledBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),
                              errorBorder:  OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),  
                              focusedErrorBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),  
                              ), 
                              hintText: 'First Name'
                            ),
                            validator: validateName,
                            onSaved: (value){
                              setState(() {
                                firstName = value;
                              });
                            },
                            onFieldSubmitted: (val){
                              FocusScope.of(context).requestFocus(lastNameNode);
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Container(
                          height: 45.0,
                          child: TextFormField(
                            initialValue: DataProvider.currentUser.lastName,
                            focusNode: lastNameNode,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: lastNameNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                              hintStyle: TextStyle(
                                color: lastNameNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                                fontSize: 20.0,
                                fontFamily: 'Gilroy-SemiBold',
                              ),
                              focusedBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),   
                              ),
                              enabledBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),
                              errorBorder:  OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),  
                              focusedErrorBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),  
                              ), 
                              hintText: 'Last Name'
                            ),
                            validator: validateName,
                            onSaved: (value){
                              setState(() {
                                lastName = value;
                              });
                            },
                            onFieldSubmitted: (val){
                              FocusScope.of(context).requestFocus(passwordNode);
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Container(
                          height: 45.0,
                          child: TextFormField(
                            focusNode: passwordNode,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            style: TextStyle(
                              color: passwordNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                              hintStyle: TextStyle(
                                color: passwordNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                                fontSize: 20.0,
                                fontFamily: 'Gilroy-SemiBold',
                              ),
                              focusedBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),   
                              ),
                              enabledBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),
                              errorBorder:  OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),  
                              focusedErrorBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),  
                              ), 
                              hintText: 'Password'
                            ),
                            validator: validatePasswords,
                            onSaved: (value){
                              setState(() {
                                password = value;
                              });
                            },
                            onFieldSubmitted: (val){
                              FocusScope.of(context).requestFocus(passwordConfirmNode);
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Container(
                          height: 45.0,
                          child: TextFormField(
                            focusNode: passwordConfirmNode,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            style: TextStyle(
                              color: passwordConfirmNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                              hintStyle: TextStyle(
                                color: passwordConfirmNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                                fontSize: 20.0,
                                fontFamily: 'Gilroy-SemiBold',
                              ),
                              focusedBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),   
                              ),
                              enabledBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),
                              errorBorder:  OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),  
                              focusedErrorBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),  
                              ), 
                              hintText: 'Confirm Password'
                            ),
                            validator: validatePasswords,
                            onSaved: (value){
                              setState(() {
                                passwordConfirm = value;
                              });
                            }
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                      ]
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.only(left: 29.0, right: 29.0, bottom: 25.0, top: 50.0),
                  child: MainButton('SAVE', 
                    bgColor: AppColors.iconBlue, 
                    textColor: Colors.white,
                    onTap: onSave,
                  )
                )
              ],
            ),
          )
        )
      )
    );
  }
}
