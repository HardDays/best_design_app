import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'dialogs.dart';

import '../routes/default_page_route.dart';

import '../../models/calendar_item.dart';
import '../../models/care_affirmation.dart';

import '../../helpers/data_provider.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_text.dart';

class AddToCalendarDialog extends StatefulWidget {

  CareAffirmation careAffirmation;
  CalendarItem calendarItem;
  AddToCalendarDialog({this.careAffirmation, this.calendarItem});

  @override
  AddToCalendarDialogState createState() => AddToCalendarDialogState();
}

class AddToCalendarDialogState extends State<AddToCalendarDialog> {

  final modeCounts = {
    RepeatMode.daily: 7,
    RepeatMode.weekly: 4,
    RepeatMode.monthly: 12,
  };

  final modeSuffix = {
    RepeatMode.daily: 'day',
    RepeatMode.weekly: 'week',
    RepeatMode.monthly: 'month'
  };

  CalendarItem item;
  
  String endEnabled;
  String repeatEnabled;

  @override
  void initState() {    
    super.initState();

    if (widget.calendarItem != null) {
      item = widget.calendarItem;

      item.id = 'kek';

      endEnabled = item.endMode == EndMode.never ? EndMode.never : null;
      repeatEnabled = item.repeatMode == RepeatMode.noRepeat ? RepeatMode.noRepeat : null;
    } else {
      var date = DateTime.now().year < 2019 ? DateTime(2019, 1, 1) : DateTime.now();

      item = CalendarItem();
      item.careAffirmation = widget.careAffirmation;
      item.beginDate = DateTime(date.year, date.month, date.day);
      item.endMode = EndMode.never;
      item.alertTime = TimeOfDay(hour: 10, minute: 00);
      item.repeatMode = RepeatMode.noRepeat;

      endEnabled = EndMode.never;
      repeatEnabled = RepeatMode.noRepeat;
    }
  }

  void onBegin() async {
    Picker(
      adapter: DateTimePickerAdapter(yearBegin: item.beginDate.year, value: item.beginDate),
      hideHeader: true,
      title: Text('Select begin date'),
      confirmText: 'OK',
      cancelText: 'CANCEL',
      onConfirm: (Picker picker, List value) {
        setState(() {
          item.beginDate = (picker.adapter as DateTimePickerAdapter).value;
          item.beginDate = DateTime(item.beginDate.year, item.beginDate.month, item.beginDate.day);
        });
      }
    ).showDialog(context);
    // if (Platform.isIOS){
    //   await showModalBottomSheet(
    //     context: context,
    //     builder: (context){
    //       return CupertinoDatePicker(
    //         mode: CupertinoDatePickerMode.date,
    //         initialDateTime: DateTime.now().add(Duration(minutes: 10)),
    //         minimumYear: DateTime.now().year,
    //         onDateTimeChanged: (date) {
    //           if (date != null) {
    //             setState(() {
    //               beginDate = date;
    //             });
    //           }
    //         }
    //       );
    //     }
    //   );
    // } else {
    //   showDatePicker(
    //     context: context,
    //     initialDate: DateTime.now().add(Duration(minutes: 10)),
    //     firstDate: DateTime.now(),
    //     lastDate: DateTime.now().add(Duration(days: 365))
    //   ).then(
    //     (date) { 
    //       if (date != null) {
    //         setState(() {
    //           beginDate = date;
    //         });
    //       }
    //     }
    //   );
    // }
  }

  void onEnd() async {
    Picker(
      adapter: DateTimePickerAdapter(yearBegin: item.beginDate.year, value: item.beginDate),
      hideHeader: true,
      title: Text('Select end date'),
      confirmText: 'OK',
      cancelText: 'CANCEL',
      onConfirm: (Picker picker, List value) {
        setState(() {
          item.endDate = (picker.adapter as DateTimePickerAdapter).value;
          item.endDate = DateTime(item.endDate.year, item.endDate.month, item.endDate.day);
        });
      },
      onCancel: () {
        if (item.endDate == null){
          setState(() {
            item.endMode = 'never';
          });
        }
      }
    ).showDialog(context);
    // if (Platform.isIOS){
    //   await showModalBottomSheet(
    //     context: context,
    //     builder: (context){
    //       return CupertinoDatePicker(
    //         mode: CupertinoDatePickerMode.date,
    //         initialDateTime: beginDate.add(Duration(minutes: 10)),
    //         minimumYear: beginDate.year,
    //         onDateTimeChanged: (date) {
    //           setState(() {
    //             endDate = date;
    //           });
    //         }
    //       );
    //     }
    //   );
    // } else {
    //   showDatePicker(
    //     context: context,
    //     initialDate: beginDate.add(Duration(minutes: 10)),
    //     firstDate: beginDate,
    //     lastDate: beginDate.add(Duration(days: 365))
    //   ).then(
    //     (date) { 
    //       setState(() {
    //         endDate = date;
    //       });
    //     }
    //   );
    // }
  }

  void onAlert() async {
    Picker(
      adapter: DateTimePickerAdapter(
        type: PickerDateTimeType.kHM_AP, 
        yearBegin: item.beginDate.year, 
        value: DateTime(item.beginDate.year, 1, 1, item.alertTime.hour, item.alertTime.minute)
      ),
      hideHeader: true,
      title: Text('Select alert time'),
      confirmText: 'OK',
      cancelText: 'CANCEL',
      onConfirm: (Picker picker, List value) {
        setState(() {
          item.alertTime = TimeOfDay.fromDateTime((picker.adapter as DateTimePickerAdapter).value);
        });
      },
    ).showDialog(context); 
    // if (Platform.isIOS){
    //   await showModalBottomSheet(
    //     context: context,
    //     builder: (context){
    //       return CupertinoTimerPicker(
    //         mode: CupertinoTimerPickerMode.hm,
    //         initialTimerDuration: Duration(hours: alertTime.hour, minutes: alertTime.minute),
    //         onTimerDurationChanged: (time) {
    //           setState(() {
    //             alertTime = TimeOfDay.fromDateTime(DateTime(2018, 12, 12).add(time));        
    //           });
    //         },
    //       );
    //     }
    //   );
    // } else {
    //   showTimePicker(
    //     initialTime: alertTime,
    //     context: context
    //   ).then((time){
    //     setState(() {
    //       alertTime = time;        
    //     });
    //   });
    // }
  } 

  void onRepeat() async {
    Picker(
      adapter: NumberPickerAdapter(
        data: [
          NumberPickerColumn(
            begin: 1, end: modeCounts[item.repeatMode], suffix: Text(' ${modeSuffix[item.repeatMode]}')
          ),
        ]
      ),
      hideHeader: true,
      title: Text('Notify every'),
      confirmText: 'OK',
      cancelText: 'CANCEL',
      onConfirm: (Picker picker, List value) {
        setState(() {
          item.repeatNumber = picker.getSelectedValues()[0];
        });
      },
      onCancel: () {
        if (item.repeatNumber == null){
          setState(() {
            item.repeatMode = RepeatMode.noRepeat;
          });
        }
      }
    ).showDialog(context);
    // await showModalBottomSheet(
    //   context: context,
    //   builder: (context){
    //     return CupertinoPicker(
    //       itemExtent: 20.0,  
    //       onSelectedItemChanged: (ind) {
    //       },
    //       children: List.generate(modeCounts[repeatMode], 
    //         (ind) {
    //           return Text('${ind + 1}');
    //         }
    //       )
    //     );
    //   }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
            child: Text('Add to Calendar',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Gilroy-Bold',
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Text(item.careAffirmation.title,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Gilroy',
              )
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Divider(height: 2.0),
          Padding(padding: EdgeInsets.only(top: 14.0)),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.27,
                margin: EdgeInsets.only(left: 40.0),
                child: Text('Start',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontFamily: 'Gilroy'
                  ),
                ),
              ),
              InkWell(
                onTap: onBegin,
                child: Text(DateFormat('MMMM dd, yyyy').format(item.beginDate),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'Gilroy-Bold'
                  ),
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 14.0)),
          Divider(height: 2.0),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.27,
                margin: EdgeInsets.only(left: 40.0),
                child: Text('End',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontFamily: 'Gilroy'
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text(item.endDate != null ? DateFormat('MMMM dd, yyyy').format(item.endDate) : 'Never',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'Gilroy-Bold'
                    ),
                  ),
                  value: endEnabled,
                  iconSize: 0.0,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'Gilroy-Bold'
                  ),
                  items: [
                    DropdownMenuItem(
                      value: EndMode.never,
                      child: Text('Never',
                      )
                    ),
                    DropdownMenuItem(
                      value: EndMode.onDate,
                      child: Text('On date')
                    )
                  ],
                  onChanged: (elem) {
                    setState(() {
                      item.endMode = elem;   
                      item.endDate = null;                   
                    });
                    if (elem == EndMode.never){
                      setState(() {
                        endEnabled = EndMode.never;
                      });
                    } else {
                      setState(() {
                        endEnabled = null;                      
                      });
                      onEnd();
                    }
                  },
                ),
              )
            ],
          ),
          Divider(height: 2.0),
          Padding(padding: EdgeInsets.only(top: 14.0)),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.27,
                margin: EdgeInsets.only(left: 40.0),
                child: Text('Alert Time',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontFamily: 'Gilroy'
                  ),
                ),
              ),
              InkWell(
                onTap: onAlert,
                child: Text(DateFormat('hh:mma').format(DateTime(2018, 12, 12, item.alertTime.hour, item.alertTime.minute)),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'Gilroy-Bold'
                  ),
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 14.0)),
          Divider(height: 2.0),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.27,
                margin: EdgeInsets.only(left: 40.0),
                child: Text('Repeat',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontFamily: 'Gilroy'
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text(item.repeatNumber != null ? 'Repeat every ${item.repeatNumber > 1 ? item.repeatNumber.toString() + ' ' : ''}${modeSuffix[item.repeatMode]}' : 'No repeat',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'Gilroy-Bold'
                    ),
                  ),
                  value: repeatEnabled,
                  iconSize: 0.0,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'Gilroy-Bold'
                  ),
                  items: [
                    DropdownMenuItem(
                      value: RepeatMode.noRepeat,
                      child: Text('No repeat',
                      )
                    ),
                    DropdownMenuItem(
                      value: RepeatMode.daily,
                      child: Text('Daily')
                    ),
                    DropdownMenuItem(
                      value: RepeatMode.weekly,
                      child: Text('Weekly')
                    ),
                    DropdownMenuItem(
                      value: RepeatMode.monthly,
                      child: Text('Monthly')
                    ),
                  ],
                  onChanged: (elem) {
                    setState(() {
                      item.repeatMode = elem;    
                    });
                    if (elem == RepeatMode.noRepeat){
                      repeatEnabled = RepeatMode.noRepeat;                   
                    } else {
                      setState(() {
                        item.repeatNumber = 1;   
                        repeatEnabled = null;   
                      });
                      onRepeat();
                    }
                  },
                ),
              )
            ],
          ),
          Divider(height: 2.0),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          widget.calendarItem == null ?
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 50.0, left: 50.0),
            child: InkWell(
              onTap: (){
                DataProvider.addCalendarItem(item);
                Navigator.pop(context);
              },
              child: Text('OK',
                style: TextStyle(
                  fontFamily: 'Gilroy-ExtraBold',
                  color: AppColors.textBlue,
                  fontSize: 20.0
                ),
              ),
            ),
          ) :
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 50.0, left: 50.0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: InkWell(
                    onTap: () {
                      Dialogs.showYesNo(context, 'Delete affirmtion?', item.careAffirmation.title, 'YES', 'NO',
                        onYes: () {
                          DataProvider.removeCalendarItem(item.careAffirmation.id);
                          Navigator.pop(context);
                        },
                        onNo: () {

                        }
                      );
                    },
                    child: Text('DELETE',
                      style: TextStyle(
                        fontFamily: 'Gilroy-ExtraBold',
                        color: Colors.red,
                        fontSize: 18.0
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: InkWell(
                    onTap: (){
                      DataProvider.updateCalendarItem(item);
                      Navigator.pop(context);
                    },
                    child: Text('OK',
                      style: TextStyle(
                        fontFamily: 'Gilroy-ExtraBold',
                        color: AppColors.textBlue,
                        fontSize: 18.0
                      ),
                    ),
                  ),
                )
              ]
            ),
          )
        ],
      )
    );
  }
}
