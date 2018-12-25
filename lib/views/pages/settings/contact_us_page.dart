import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';
import '../../dialogs/dialogs.dart';

import '../../../models/report.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';

class ContactUsPage  extends StatefulWidget {

  @override
  ContactUsPageState createState() => ContactUsPageState();
}

class ContactUsPageState extends State<ContactUsPage> {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode emailNode = FocusNode();
  FocusNode subjectNode = FocusNode();
  FocusNode messageNode = FocusNode();

  String email;
  String subject;
  String message;

  @override
  void initState() {    
    super.initState(); 

    emailNode.addListener((){
      setState(() {        
      });
    });
    subjectNode.addListener((){
      setState(() {        
      });
    });
    messageNode.addListener((){
      setState(() {        
      });
    });
  }

  void onSend(){
    formKey.currentState.save();
    if (formKey.currentState.validate()){
      Dialogs.showLoader(context);
      DataProvider.createReport(
        Report(
          subject: subject,
          message: message,
          email: email
        )
      ).timeout(Duration(seconds: 10), 
        onTimeout: (){
          Navigator.pop(context);
          Dialogs.showMessage(context, 'Server not responding', 'Please, try again later.', 'OK');
        }
      ).then(
        (res) async {
          Navigator.pop(context);
          await Dialogs.showMessage(context, 'Thank you!', 'We will review your message soon.', 'OK');
          Navigator.pop(context);
        }
      );
    }
  }

  String validateEmail(String email){
    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email) || email.length > 75){
      return 'Wrong email format';
    }
  }

  String validateField(String field){
    if (field.isEmpty){
      return 'Please, enter something';
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
       appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
        title: Text('Contact Us',
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
          margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Form(
                  key: formKey,  
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Column(
                      children: <Widget>[ 
                        Container(
                          height: 45.0,
                          child: TextFormField(
                            focusNode: subjectNode,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: subjectNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                              hintStyle: TextStyle(
                                color: subjectNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
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
                              hintText: 'Subject'
                            ),
                            validator: validateField,
                            onSaved: (value){
                              setState(() {
                                subject = value;
                              });
                            },
                            onFieldSubmitted: (val){
                              FocusScope.of(context).requestFocus(emailNode);
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Container(
                          height: 45.0,
                          child: TextFormField(
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
                              FocusScope.of(context).requestFocus(messageNode);
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Container(
                          child: TextFormField(
                            focusNode: messageNode,
                            keyboardType: TextInputType.multiline,
                            maxLines: 7,
                            style: TextStyle(
                              color: messageNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                              fontSize: 20.0,
                              fontFamily: 'Gilroy-SemiBold',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                              hintStyle: TextStyle(
                                color: messageNode.hasFocus ? AppColors.iconBlue : Colors.grey.withOpacity(0.7),
                                fontSize: 20.0,
                                fontFamily: 'Gilroy-SemiBold',
                              ),
                              focusedBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),   
                              ),
                              enabledBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),
                              errorBorder:  OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.7), 
                                  width: 1.5
                                ),   
                              ),  
                              focusedErrorBorder: OutlineInputBorder(      
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: AppColors.iconBlue, 
                                  width: 1.5
                                ),  
                              ),    
                              hintText: 'Message'
                            ),
                            validator: validateField,
                            onSaved: (value){
                              setState(() {
                                message = value;
                              });
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                      ]
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.only(left: 29.0, right: 29.0, bottom: 25.0, top: 25.0),
                  child: MainButton('SEND', 
                    bgColor: AppColors.iconBlue, 
                    textColor: Colors.white,
                    onTap: onSend,
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
