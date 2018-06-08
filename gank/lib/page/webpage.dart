import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';



class WebPage extends StatefulWidget {

  String url;
  String title;

  WebPage({Key key, this.url,this.title}):super(key: key);

  @override
  State<StatefulWidget> createState() => new NewsDetailPageState(url: this.url,title: title);
}

class NewsDetailPageState extends State<WebPage> {

  String url;
  String title;
  bool loaded = false;
  String detailDataStr;
  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  NewsDetailPageState({Key key, this.url,this.title});

  @override
  void initState() {
    super.initState();
    // 监听WebView的加载事件
    flutterWebViewPlugin.onStateChanged.listen((state) {
      print("state: ${state.type}");
      if (state.type == WebViewState.finishLoad) {
        // 加载完成
        setState(() {
          loaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: this.url,
      appBar: new AppBar(
        title: new Text(title, style: new TextStyle(color: Colors.white)),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}