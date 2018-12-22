import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../models/calendar_item.dart';
import '../models/positive_item.dart';
import '../models/bucket_item.dart';

class MainAPI {
  
  //static const String url = 'http://192.168.0.105:3000';
  static const String url = 'https://upliftingg.herokuapp.com';

  static const String auth = '/auth';
  static const String users = '/users';
  static const String login = '/login';
  static const String me = '/me';
  static const String images = '/images';
  static const String calendarItems = '/calendar_items';
  static const String positiveItems = '/positive_items';
  static const String bucketItems = '/bucket_items';

  static String token;

  static Map <String, String> defaultHeader = {
    'Content-type' : 'application/json', 
  };

  static void setToken(String tok){
    token = tok;
    defaultHeader = {
      'Content-type' : 'application/json', 
      'Authorization': token
    };
  }

  static bool isAuthorized(){
    return token != null;
  }

  static void flush(){
    token = null;
  }

  // AUTH
  
  static Future<User> authorize(String email, String password) async {
    var res = await http.post(url + auth + login, 
      body: json.encode({
        'email': email,
        'password': password
      }),
      headers: {
        'Content-type' : 'application/json', 
      }
    );
    //TODO: better error check
    if (res.statusCode == HttpStatus.ok){
     return User.fromJson(json.decode(res.body));
    } 
  }

  // USERS

  static Future<User> createUser(User user) async {
    var res = await http.post(url + users, 
      body:  json.encode(user.toJson()),
      headers: {
        'Content-type' : 'application/json', 
      }
    );
    //TODO: better error check
    if (res.statusCode == HttpStatus.created){
     return User.fromJson(json.decode(res.body));
    } 
  }

  static Future<List<CalendarItem>> getCalendarItems() async {
    var res = await http.get(url + calendarItems, 
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
    try {
      if (res.statusCode == HttpStatus.ok) {
        var list = json.decode(res.body).map<CalendarItem>((x) => CalendarItem.fromJson(x)).toList();
        return list;
      } else {
        return [];
      }
    } catch (ex) {

    }
  }

  static Future<CalendarItem> createCalendarItem(CalendarItem item) async {
    var res = await http.post(url + calendarItems, 
      body:  json.encode(item.toJson()),
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
    if (res.statusCode == HttpStatus.created) {
     return CalendarItem.fromJson(json.decode(res.body));
    } 
  }

  static Future<CalendarItem> updateCalendarItem(CalendarItem item) async {
    var res = await http.put(url + calendarItems, 
      body:  json.encode(item.toJson()),
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
    if (res.statusCode == HttpStatus.ok){
     return CalendarItem.fromJson(json.decode(res.body));
    } 
  }

  static Future removeCalendarItem(CalendarItem item) async {
    var res = await http.delete(url + calendarItems + '/${item.careAffirmation.id}', 
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
  }

  static Future<List<PositiveItem>> getPositiveItems() async {
    var res = await http.get(url + positiveItems, 
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
    try {
      if (res.statusCode == HttpStatus.ok) {
        var list = json.decode(res.body).map<PositiveItem>((x) => PositiveItem.fromJson(x)).toList();
        return list;
      }
    } catch (ex) {

    }
  }

  static Future<PositiveItem> createPositiveItem(PositiveItem item) async {
    var res = await http.post(url + positiveItems, 
      body:  json.encode(item.toJson()),
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
    if (res.statusCode == HttpStatus.created) {
     return PositiveItem.fromJson(json.decode(res.body));
    } 
  }

   static Future<List<BucketItem>> getBucketItems() async {
    var res = await http.get(url + bucketItems, 
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
    try {
      if (res.statusCode == HttpStatus.ok) {
        var list = json.decode(res.body).map<BucketItem>((x) => BucketItem.fromJson(x)).toList();
        return list;
      }
    } catch (ex) {

    }
  }

  static Future<List<BucketItem>> createBucketItems(List<BucketItem> items) async {
    var res = await http.post(url + bucketItems, 
      body: json.encode(
        {
          'bucket_items': List.generate(items.length, 
            (ind) {
              return items[ind].toJson();
            }
          )
        }
      ),
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
    if (res.statusCode == HttpStatus.ok) {
      var list = json.decode(res.body).map<BucketItem>((x) => BucketItem.fromJson(x)).toList();
      return list;
    } 
  }

  static Future<PositiveItem> updatePositiveItem(PositiveItem item) async {
    var res = await http.put(url + positiveItems, 
      body:  json.encode(item.toJson()),
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
    if (res.statusCode == HttpStatus.ok){
     return PositiveItem.fromJson(json.decode(res.body));
    } 
  }

  static Future removePositiveItem(PositiveItem item) async {
    var res = await http.delete(url + positiveItems + '/${item.positiveAffirmation.id}', 
      headers: {
        'Content-type' : 'application/json', 
        'Authorization': token
      }
    );
  }

  static String getImage(String id){
    return url + images + '/$id';
  }


}