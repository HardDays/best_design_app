import 'package:flutter/material.dart';

import 'care_affirmation.dart';

class EndMode {
  static const String never = 'never';
  static const String onDate = 'on_date';
}

class RepeatMode {
  static const String noRepeat = 'no_repeat';
  static const String daily = 'daily';
  static const String monthly = 'monthly';
  static const String weekly = 'weekly';
}

class CalendarItem {
  
  String id;

  DateTime beginDate; 
  DateTime endDate;
  String endMode;
  TimeOfDay alertTime;
  String repeatMode;
  int repeatNumber;

  CareAffirmation careAffirmation;

  CalendarItem({this.id, this.beginDate, this.endDate, this.endMode, this.alertTime, this.repeatMode, this.repeatNumber, this.careAffirmation});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'begin_date': beginDate.toString(),
      'end_date': endDate.toString(),
      'end_mode': endMode,
      'alert_time': DateTime(1980, 1, 1, alertTime.hour, alertTime.minute).toString(),
      'repeat_mode': repeatMode,
      'repeat_number': repeatNumber,
      'care_affirmation': careAffirmation.toJson(),
      'care_affirmation_id': careAffirmation.id
    };
  }

  factory CalendarItem.fromJson(Map<String, dynamic> json) {
    return CalendarItem(
      id: json['id'],
      beginDate: json['begin_date'] != 'null' && json['begin_date'] != null ? DateTime.parse(json['begin_date']) : null,
      endDate: json['end_date'] != 'null' &&  json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      endMode: json['end_mode'],
      alertTime: json['alert_time'] != 'null' && json['alert_time'] != null ? TimeOfDay.fromDateTime(DateTime.parse(json['alert_time'])) : null,
      repeatMode: json['repeat_mode'],
      repeatNumber: json['repeat_number'],
      careAffirmation: CareAffirmation.fromJson(json['care_affirmation'])
    );
  }

}