import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/shadow_text.dart';

import '../../dialogs/dialogs.dart';

import '../../routes/default_page_route.dart';

import '../../../models/positive_affirmation.dart';
import '../../../models/calendar_item.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text.dart';

class PositiveListPage extends StatefulWidget {

  String title;
  String category;

  PositiveListPage({this.title, this.category});

  @override
  PositiveListPageState  createState() => PositiveListPageState();
}

class PositiveListPageState extends State<PositiveListPage> {

  final images = {
    PositiveCategory.healthAndBeauty: 'assets/images/jan_bg.png',
    PositiveCategory.love: 'assets/images/feb_bg.png',
    PositiveCategory.abundance: 'assets/images/mar_bg.png',
    PositiveCategory.personal: 'assets/images/apr_bg.png',
  };

  List<PositiveAffirmation> affirmations;

  Map<String, PositiveAffirmation> personal;

  @override
  void initState() {    
    super.initState();
    
    if (widget.category == PositiveCategory.personal){
      affirmations = DataProvider.getPersonalAffirmations().values.toList();
    } else {
      affirmations = DataProvider.getPositiveAffirmations()[widget.category];
    }
    personal = DataProvider.getPersonalAffirmations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        title: Text(widget.title,
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
                Dialogs.showMessage(context, 'Positive Affirmations', AppText.affirmationsDescription, 'OK');
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
            image: AssetImage(images[widget.category]),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child: ShadowText(widget.title.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gilroy-Bold',
                  fontSize: 24.0
                ),
              )
            ),
            affirmations.isNotEmpty ?
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 0.0),
                child: SingleChildScrollView(
                  child: Column(  
                    children: List.generate(affirmations.length, 
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
                                  child: Text(affirmations[ind].title,
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
                                    setState(() {
                                      if (personal.containsKey(affirmations[ind].id)){
                                        DataProvider.removePersonalAffirmation(affirmations[ind].id);
                                      } else {
                                        DataProvider.addPersonalAffirmation(affirmations[ind]);
                                      }
                                      personal = DataProvider.getPersonalAffirmations();
                                      if (widget.category == PositiveCategory.personal){
                                        affirmations = DataProvider.getPersonalAffirmations().values.toList();
                                      }
                                    });
                                  },
                                  iconSize: 33.0,
                                  icon: Icon(personal.containsKey(affirmations[ind].id) ? Icons.remove : Icons.add, 
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
            ) : Container(
              margin: EdgeInsets.only(left: 10.0, top: 5.0),
              child: Text('No affirmations added',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gilroy',
                  fontSize: 18.0
                ),
              )
            ),
          ]
        )
      )
    );
  }
}
