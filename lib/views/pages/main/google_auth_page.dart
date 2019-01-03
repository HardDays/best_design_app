import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class GoogleAuthPage extends StatefulWidget {

  final String url;

  GoogleAuthPage({this.url});

  GoogleAuthPageState createState() => GoogleAuthPageState();
}

class GoogleAuthPageState extends State<GoogleAuthPage> {

  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState(){
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen(
      (url) {
        //print(url);
        try {
          http.get(url);
        } catch (ex){

        }
      }
    );
  }

  @override
  dispose(){
    super.dispose();
  }

  @override 
  Widget build(BuildContext ctx) {
    return SafeArea(
      child: WebviewScaffold(
        appBar: PreferredSize(
          preferredSize: Size(40, 40),
          child: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.black,
            primary: false,
            //backgroundColor: Colors.bl,
          )
        ), 
        userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_0 like Mac OS X) AppleWebKit/602.1.38 (KHTML, like Gecko) Version/10.0 Mobile/14A5297c Safari/602.1',  
        url: widget.url,  
      )
    );
  }
}