import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../dialogs/dialogs.dart';

import '../../routes/default_page_route.dart';

import '../../../models/bucket_idea.dart';
import '../../../models/bucket_item.dart';

import '../../../helpers/data_provider.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text.dart';

class BucketAddPage extends StatefulWidget {

  @override
  BucketAddPageState  createState() => BucketAddPageState();
}

class BucketAddPageState extends State<BucketAddPage> {
  
  bool showList;

  String title;

  List<BucketIdea> bucketIdeas;

  List<BucketItem> bucketItems;
  Map<String, BucketItem> idBucketItems;

  Set<BucketIdea> markedIdeas;

  TextEditingController titleController;

  @override
  void initState() {    
    super.initState();

    showList = false;

    markedIdeas = Set();
    bucketIdeas = [];

    bucketItems =  List.from(DataProvider.getBucketItems());
    idBucketItems = Map.from(DataProvider.getIdBucketItems());     
    
    for (var idea in DataProvider.getBucketIdeas()){
      if (!idBucketItems.containsKey(idea.id)){
        bucketIdeas.add(idea);
      }
    }

    titleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
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
                Dialogs.showBucketListInfo(context);
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
            Stack(
              children: [
                showList ? 
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  margin: EdgeInsets.only(
                    top: 10.0, 
                    left: 10.0, 
                    right: 10.0, 
                    bottom: 3.0
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(
                    children:[
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(bucketIdeas.length, 
                              (ind) {
                                var idea = bucketIdeas[ind];
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (markedIdeas.contains(idea)){
                                        markedIdeas.remove(idea);
                                      } else {
                                        markedIdeas.add(idea);
                                      }                     
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: ind == 0 ? 60.0 : 10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 25.0,
                                          width: 25.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: markedIdeas.contains(idea) ? AppColors.iconBlue : Colors.white,
                                            border: Border.all(width: 1.0, color: AppColors.textBlue)
                                          ),
                                          child: markedIdeas.contains(idea) ?
                                          Container(
                                            child: Icon(
                                              Icons.check,
                                              size: 20.0,
                                              color: Colors.white,
                                            ),
                                          ) : Container()
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 15.0)),
                                        Flexible(
                                          child: Text(bucketIdeas[ind].title,
                                            maxLines: 3,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy',
                                              fontSize: 18.0
                                            ),
                                          ),
                                        )
                                      ]
                                    ),
                                  )
                                );
                              }
                            )
                          )
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {                      
                              for (var idea in markedIdeas){
                                var item = BucketItem(bucketIdea: idea);
                                idBucketItems[idea.id] = item;
                                bucketItems.insert(0, item);
                                bucketIdeas.remove(idea);
                              }
                              markedIdeas.clear();
                              showList = false;
                            });
                          },
                          child: Text('ADD',
                            style: TextStyle(
                              color: AppColors.textBlue,
                              fontSize: 18.0,
                              fontFamily: 'Gilroy-Bold'
                            ),
                          ),
                        ),
                      )
                    ]
                  )
                ) : 
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                        ),
                        margin: EdgeInsets.only(
                          top: 100.0, 
                          left: 10.0, 
                          right: 10.0, 
                          bottom: 0.0
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              //padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10.0, right: 5.0),
                                  child: TextField(
                                    controller: titleController,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Gilroy-Bold',
                                      fontSize: 18.0
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Write My Own', 
                                      hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontFamily: 'Gilroy-Bold',
                                        fontSize: 18.0
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent)
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent)
                                      )
                                    ),
                                    onChanged: (value){
                                      setState(() {
                                        title = value;                                        
                                      });
                                    }
                                  ),
                                )
                              )
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.iconBlue,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0))
                              ),
                              child: IconButton(
                                onPressed: (){
                                  if (title != null){
                                    setState(() {
                                      bucketItems.insert(0, BucketItem(title: title));
                                      title = null;
                                      titleController.clear();
                                    });
                                  }
                                },
                                color: title == null ? Colors.white.withOpacity(0.5) : Colors.white,
                                iconSize: 30.0,
                                icon: Icon(Icons.check),
                              ),
                            ),
                          ]
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(bucketItems.length, 
                              (ind) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.45),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                                  ),
                                  margin: EdgeInsets.only(
                                    top: 6.0, 
                                    left: 10.0, 
                                    right: 10.0, 
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 15.0),
                                          child: Text(bucketItems[ind].bucketIdea != null ? bucketItems[ind].bucketIdea.title : bucketItems[ind].title,
                                            maxLines: 3,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy-Bold',
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
                                              if (bucketItems[ind].bucketIdea != null){
                                                bucketIdeas.add(bucketItems[ind].bucketIdea);
                                              }
                                              bucketItems.remove(bucketItems[ind]);                                              
                                            });
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
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showList = !showList;                      
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    margin: EdgeInsets.only(
                      top: 10.0, 
                      left: 10.0, 
                      right: 10.0, 
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            margin: EdgeInsets.only(left: 20.0),
                            child: Text('Bucket List Ideas',
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Gilroy-Bold',
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
                            iconSize: 33.0,
                            icon: Icon(showList ? Icons.expand_less : Icons.expand_more, 
                              color: AppColors.textBlue
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                )
              ]
            ),
            Expanded(
              //height: MediaQuery.of(context).size.height * 0.6,
              child: SingleChildScrollView(
                child: Column(  
                  
                )
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25.0),
              child: MainButton('SAVE ', 
                onTap: () {
                  DataProvider.createBucketItems(bucketItems);
                  Navigator.pop(context);
                },
                bgColor: AppColors.iconBlue, 
                textColor: Colors.white
              )
            )
          ],
        )
      )
    );
  }
}
