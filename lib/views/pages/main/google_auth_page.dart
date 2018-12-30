import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        userAgent: 'Mozilla/5.0 (Linux; <Android Version>; <Build Tag etc.>) AppleWebKit/<WebKit Rev> (KHTML, like Gecko) Chrome/<Chrome Rev> Mobile Safari/<WebKit Rev>',  
        url: widget.url,  
      )
    );
  }
}