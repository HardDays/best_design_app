import 'package:flutter/material.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../../resources/app_colors.dart';

class PrivacyPage extends StatefulWidget {

  @override
  PrivacyPageState createState() => PrivacyPageState();
}

class PrivacyPageState extends State<PrivacyPage> {


  @override
  void initState() {    
    super.initState(); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
       appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
        title: Text('Privacy Notice',
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
                Container(
                  padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 10.0),
                  child: Text('Uplifting Women Privacy Notice',
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0, bottom: 10.0),
                  child: Text('We gather your Personal Information (your name and email address) when you register to use our App. Additionally, we gather your Personal Information when you sign up for a newsletter and/or promotional e-mails, or when you place a request for customer service by using the "Contact" feature contained within the Site. In both of these examples, we require the collected information in order to fulfill your request for information. To the extent that we use this information beyond the immediate fulfillment of your request, we retain it so that we may contact you about new products, sales, and other promotional messages we think will interest you. Additionally, you can always choose to opt-out of receiving promotional e-mail and electronic newsletter communications that we may send to visitors and customers from time to time.',
                    style: TextStyle(
                      fontSize: 14.0
                    ),
                  ),
                )
              ],
            ),
          )
        )
      )
    );
  }
}
