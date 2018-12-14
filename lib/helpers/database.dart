import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

import '../models/calendar_item.dart';
import '../models/care_affirmation.dart';
import '../models/positive_affirmation.dart';

class Database {

  static Map<String, dynamic> _db = {};

  static File _file;

  static Future init() async {
    String path = (await getApplicationDocumentsDirectory()).path;

    _file = File('$path/uplifting_db.json');
    bool exists = await _file.exists();

    if (exists){
      String body = await _file.readAsString(); 
      try {
        _db = json.decode(body);     
      } catch (Exception){
        _db = Map <String, String>();
        await _file.writeAsString('{}');
      }
    } else {
      await _file.create();
      await _file.writeAsString('{}');
    }
  }

  static void setCalendarItems(List<CalendarItem> items){
    List<Map<String, dynamic>> res = [];
    for (var item in items){
      res.add(item.toJson());
    }
    _db['calendar_items'] = res;
    _file.writeAsStringSync(json.encode(_db));
  }

  static List<CalendarItem> getCalendarItems(){
    List<CalendarItem> res = [];
    if (_db.containsKey('calendar_items')){
      for (var item in _db['calendar_items']){
        res.add(CalendarItem.fromJson(item));
      }
    }
    return res;
  }
  
} 