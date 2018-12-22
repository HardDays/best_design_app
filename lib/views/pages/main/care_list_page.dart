import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/main_button.dart';

import '../../dialogs/dialogs.dart';

import '../../routes/default_page_route.dart';

import '../../../models/care_affirmation.dart';
import '../../../models/calendar_item.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text.dart';

class CareListPage extends StatefulWidget {

  @override
  CareListPageState  createState() => CareListPageState();
}

class CareListPageState extends State<CareListPage> {
  
  final List<Color> monthColors = [
    AppColors.janHeader, 
    AppColors.febHeader, 
    AppColors.marHeader, 
    AppColors.aprHeader, 
    AppColors.mayHeader, 
    AppColors.junHeader,
    AppColors.julHeader, 
    AppColors.augHeader, 
    AppColors.sepHeader, 
    AppColors.octHeader, 
    AppColors.novHeader, 
    AppColors.decHeader
  ];

  final List<String> monthImages = [
    'assets/images/jan_bg.png',
    'assets/images/feb_bg.png',
    'assets/images/mar_bg.png',
    'assets/images/apr_bg.png',
    'assets/images/may_bg.png',
    'assets/images/jun_bg.png',
    'assets/images/jul_bg.png',
    'assets/images/aug_bg.png',
    'assets/images/sep_bg.png',
    'assets/images/oct_bg.png',
    'assets/images/nov_bg.png',
    'assets/images/dec_bg.png',
  ];

  List<String> titles;
  List<String> phrases;
  List<List<CareAffirmation>> affirmations;

  Map<String, CalendarItem> calendarItems;

  DateTime date;

  @override
  void initState() {    
    super.initState();
    
    date = DateTime.now().year < 2019 ? DateTime(2019, 1, 1) : DateTime.now();

    titles = DataProvider.getCareTitles();
    phrases = DataProvider.getCarePhrases();
    affirmations = DataProvider.getCareAffirmations();
    calendarItems = DataProvider.getIdCalendarItems();

    //precache
    for (var image in monthImages){
      AssetImage(image);
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
        title: Text('Self Love/Self Care List',
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
                Dialogs.showCareListInfo(context);
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
            image: AssetImage(monthImages[date.month - 1]),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width,
              color: monthColors[date.month - 1],
              padding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(titles[date.month - 1],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cookie',
                        fontSize: 22.0
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    alignment: Alignment.topLeft,
                    child: Text(phrases[date.month - 1],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontSize: 14.0
                      ),
                    ),
                  )
                ],
              ),  
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 0.0),
                child: SingleChildScrollView(
                  child: Column(  
                    children: List.generate(affirmations[date.month - 1].length, 
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
                                    padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                                    child: Text(affirmations[date.month - 1][ind].title,
                                      //maxLines: 1,
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
                                    onPressed: () async {
                                      var affirmation = affirmations[date.month - 1][ind];
                                      if (calendarItems.containsKey(affirmation.id)){
                                        await Dialogs.showAddToCalendar(context, calendarItem: calendarItems[affirmation.id]);     
                                        setState(() {});    
                                      } else {
                                        await Dialogs.showAddToCalendar(context, careAffirmation: affirmation);     
                                        setState(() {});    
                                      }                          
                                    },
                                    iconSize: 33.0,
                                    icon: Icon(calendarItems.containsKey(affirmations[date.month - 1][ind].id) ? Icons.remove : Icons.add, 
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
            ),
            //date.month > 1 ? Container(
            Container(
              margin: EdgeInsets.only(top: 0.0),
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                       // if (date.month > 1){
                          date = DateTime(date.year, (date.month - 1));       
                       // }                 
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_back_ios,
                            color: AppColors.textBlue,
                            size: 30.0,
                          ),
                          Padding(padding: EdgeInsets.only(left: 5.0)),
                          Text('PREVIOUS LIST',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0
                            ),
                          ),
                        ]
                      )
                    )
                  ),
                ],
              ),
            )// : Container()
          ]
        )
      )
    );
  }
}
