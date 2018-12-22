import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

import '../models/calendar_item.dart';
import '../models/bucket_item.dart';
import '../models/positive_item.dart';
import '../models/user.dart';
import '../models/settings.dart';

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

  static void flush(){
    _file.writeAsString('{}');
    _db = {};
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

  static void setPositiveItems(List<PositiveItem> items){
    List<Map<String, dynamic>> res = [];
    for (var item in items){
      res.add(item.toJson());
    }
    _db['positive_items'] = res;
    _file.writeAsStringSync(json.encode(_db));
  }
  

  static List<PositiveItem> getPositiveItems(){
    List<PositiveItem> res = [];
    if (_db.containsKey('positive_items')){
      for (var item in _db['positive_items']){
        res.add(PositiveItem.fromJson(item));
      }
    }
    return res;
  }

  static void setBucketItems(List<BucketItem> items){
    List<Map<String, dynamic>> res = [];
    for (var item in items){
      res.add(item.toJson());
    }
    _db['bucket_items'] = res;
    _file.writeAsStringSync(json.encode(_db));
  }

  static List<BucketItem> getBucketItems(){
    List<BucketItem> res = [];
    if (_db.containsKey('bucket_items')){
      for (var item in _db['bucket_items']){
        res.add(BucketItem.fromJson(item));
      }
    }
    return res;
  }

  static User getCurrentUser() {
    if (_db.containsKey('current_user')) {
      return User.fromJson(json.decode(_db['current_user']));
    }
  }

  static void setCurrentUser(User value) {
    _db['current_user'] = json.encode(value.toJson());
    _file.writeAsStringSync(json.encode(_db));
  }

  static void deleteCurrentUser() {
    _db.remove('current_user');
    _file.writeAsStringSync(json.encode(_db));
  }

  static void setSettings(Settings settings){
    _db['settings'] = json.encode(settings.toJson());
    _file.writeAsStringSync(json.encode(_db));
  }

  static Settings getSettings(){
    if (_db.containsKey('settings')) {
      return Settings.fromJson(json.decode(_db['settings']));
    } else {
      return Settings(lastMonthlyDate: DateTime.now().subtract(Duration(days: 10)));
    }
  }
  
} 