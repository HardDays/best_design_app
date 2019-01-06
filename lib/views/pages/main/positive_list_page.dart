import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/shadow_text.dart';

import '../../dialogs/dialogs.dart';

import '../../routes/default_page_route.dart';

import '../../../models/positive_affirmation.dart';
import '../../../models/positive_item.dart';

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
    PositiveCategory.healthAndBeauty: 'assets/images/health_bg.png',
    PositiveCategory.love: 'assets/images/love_bg.png',
    PositiveCategory.abundance: 'assets/images/abundance_bg.png',
    PositiveCategory.personal: 'assets/images/personal_bg.png',
  };

  List<PositiveAffirmation> affirmations;

  Map<String, PositiveItem> personal;

  @override
  void initState() {    
    super.initState();
    
    personal = DataProvider.getIdPersonalAffirmations();

    if (widget.category == PositiveCategory.personal){
      update();
    } else {
      affirmations = DataProvider.getPositiveAffirmations()[widget.category];
    }
  }

  void update(){
    affirmations = [];
    for (var item in personal.values){
      affirmations.add(item.positiveAffirmation);
    }
  }

  void onAdd(int index) async {
    if (!personal.containsKey(affirmations[index].id)) {
      await Dialogs.showYesNo(context, 'Add to Personal Affirmations List?', affirmations[index].title, 'YES', 'CANCEL',
        onYes: (){
          setState(() {
            DataProvider.createPersonalAffirmation(PositiveItem(positiveAffirmation: affirmations[index]));
            personal = DataProvider.getIdPersonalAffirmations();
            if (widget.category == PositiveCategory.personal){
              update();
            }
          });
        }
      );
    } else {
      setState(() {
        DataProvider.removePersonalAffirmation(PositiveItem(positiveAffirmation: affirmations[index]));
        personal = DataProvider.getIdPersonalAffirmations();
        if (widget.category == PositiveCategory.personal){
          update();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
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
                Dialogs.showPositiveInfo(context);
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
            //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
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
                            color: Colors.white.withOpacity(0.45),
                            borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          margin: EdgeInsets.only(
                            top: ind == 0 ? 10.0 : 0.0, 
                            left: 10.0, 
                            right: 10.0, 
                            bottom: 5.0
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                                    child: Text(affirmations[ind].title,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Gilroy-Bold',
                                        fontSize: 16.0
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
                                    onPressed: () {
                                      onAdd(ind);
                                    },
                                    iconSize: 33.0,
                                    icon: Icon(personal.containsKey(affirmations[ind].id) ? Icons.remove : Icons.add, 
                                      color: AppColors.textBlue
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
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
