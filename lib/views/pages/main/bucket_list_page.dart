import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../dialogs/dialogs.dart';

import '../../routes/default_page_route.dart';

import '../../../models/care_affirmation.dart';
import '../../../models/calendar_item.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text.dart';

class BucketListPage extends StatefulWidget {

  @override
  BucketListPageState  createState() => BucketListPageState();
}

class BucketListPageState extends State<BucketListPage> {
  
  @override
  void initState() {    
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        title: Text('Bucket List',
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
                Dialogs.showMessage(context, 'Bucket List', AppText.bucketsDescription, 'OK');
              },
            ),
          )
        ]
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bucket_list_bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(  
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: ShadowText('My Bucket List',
                style: TextStyle(
                  color: AppColors.textBlue,
                  fontSize: 40.0,
                  fontFamily: 'Norican'
                ),
              ),
            ),
            Expanded(
              //height: MediaQuery.of(context).size.height * 0.6,
              child: SingleChildScrollView(
                child: Column(  
                  children: List.generate(5, 
                    (ind) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                        ),
                        margin: EdgeInsets.only(
                          top: ind == 0 ? 10.0 : 0.0, 
                          left: 10.0, 
                          right: 10.0, 
                          bottom: 3.0
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Text('Bucket Item',
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                    fontSize: 18.0
                                  ),
                                ),
                              )
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),
                              child: IconButton(
                                onPressed: () async {
                                
                                },
                                iconSize: 33.0,
                                icon: Icon(Icons.remove, 
                                  color: AppColors.textBlue
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  )
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 10.0),
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  iconSize: 40.0,
                  icon: Icon(Icons.add,
                    color: AppColors.textBlue,
                  ),
                )
              ),
            )
          ],
        )
      )
    );
  }
}
