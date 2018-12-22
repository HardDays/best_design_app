import 'dart:async';

import 'package:flutter/material.dart';

import 'views/pages/start/start_page.dart';
import 'views/pages/start/splash_page.dart';
import 'views/pages/main/main_page.dart';

import 'helpers/data_provider.dart';

void main() => runApp(App());


class App extends StatefulWidget {


  @override
  AppState createState() => AppState();
}


class AppState extends State<App> {

  bool loading = true;

  @override
  void initState() {
    super.initState();
    
    DataProvider.init().then(
      (v){
        setState(() {
          //loading = false;          
        });
      }
    );
    Timer(Duration(seconds: 3), (){
      setState(() {
        loading = false;          
      });
    });
  }
 
  @override
  Widget build(BuildContext context) {
    if (loading){
      return MaterialApp(
        title: 'Uplifting Women',
        theme: ThemeData(
        ),
        home: SplashPage()
      );
    }
    if (DataProvider.isAuthorized()) {
      return MaterialApp(
        title: 'Uplifting Women',
        theme: ThemeData(
        ),
        home: MainPage(),
      );
    } else {
      return MaterialApp(
        title: 'Uplifting Women',
        theme: ThemeData(
        ),
        home: StartPage(),
      );
    }
  }
}
