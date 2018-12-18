import 'package:flutter/material.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../../resources/app_colors.dart';

class ProfilePage extends StatefulWidget {

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  String email;
  String password;

  @override
  void initState() {    
    super.initState(); 

    emailNode.addListener((){
      setState(() {        
      });
    });
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: IconButton(
                        iconSize: 30.0,
                        icon: Icon(Icons.photo_camera, color: AppColors.iconBlue),
                      ),
                    ),
                  ]
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
                              hintText: 'Email'
                            ),
                            validator: validateUserName,
                            onSaved: (userName){
                              setState(() {
                                this.email = userName;
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
                              hintText: 'Email'
                            ),
                            validator: validateUserName,
                            onSaved: (userName){
                              setState(() {
                                this.email = userName;
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
                              hintText: 'Email'
                            ),
                            validator: validateUserName,
                            onSaved: (userName){
                              setState(() {
                                this.email = userName;
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
                              hintText: 'Email'
                            ),
                            validator: validateUserName,
                            onSaved: (userName){
                              setState(() {
                                this.email = userName;
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
                              hintText: 'Email'
                            ),
                            validator: validateUserName,
                            onSaved: (userName){
                              setState(() {
                                this.email = userName;
                              });
                            },
                            onFieldSubmitted: (val){
                              FocusScope.of(context).requestFocus(passwordNode);
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
                  child: MainButton('SAVE', bgColor: AppColors.iconBlue, textColor: Colors.white)
                )
              ],
            ),
          )
        )
      )
    );
  }
}
