import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_first_women_app/ui/Screens/AboutUsScreen.dart';
import 'package:flutter_first_women_app/ui/Widgets/ImageSliderWidget.dart';
import 'package:flutter_first_women_app/utilies/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeWebviewScreen extends StatefulWidget {
  @override
  _HomeWebviewScreenState createState() => _HomeWebviewScreenState();
}
enum LoadingState{
  loading,
  connection
}
class _HomeWebviewScreenState extends State<HomeWebviewScreen> {
  final _key = UniqueKey();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool _isLoading = true;
  bool _isInternetConnect=false;
   @override


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:isConnected(),
      builder:(BuildContext context, AsyncSnapshot<dynamic> snapshot){
        return SafeArea(child: Scaffold(
            body: !_isInternetConnect ? LoadingWidget():HomeWebViewScreenBodyWidget(),
        ));
      } ,
    );
  }

  Widget HomeWebViewScreenBodyWidget() {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          child: WebViewContentWidget(),
        ),
        _isLoading ? LoadingWidget() : Container()
      ],
    );
  }

  Widget WebViewContentWidget() {
    return WebView(
      key: _key,
      initialUrl: HOME_WEBVIEW_URL,
      onWebResourceError: (WebResourceError webviewerrr) {
        print("Handle your Error Page here");
        SetIsLoaddingFlag(true,LoadingState.connection);
      },
      javascriptMode: JavascriptMode.unrestricted,
//      onWebViewCreated: (WebViewController webViewController) {
//        _controller.complete(webViewController);
//      },

      onPageStarted: (start) => SetIsLoaddingFlag(true,LoadingState.connection),
      onPageFinished: (finish) => SetIsLoaddingFlag(false,LoadingState.loading),
    );
  }

  Widget LoadingWidget() {
    return Center(
      child: SpinKitPulse(
        color: BLACK,
        size: 35.0,
      )
    );
  }



  SetIsLoaddingFlag(bool flagValue ,LoadingState loadingState){
     switch(loadingState)
    {
       case LoadingState.loading:
         setState(() {
           _isLoading=flagValue;
         });
         break;
       case LoadingState.connection:
         setState(() {
           _isInternetConnect=flagValue;
         });
         break;
     }
  }

   Future<void> isConnected() async {
     try {
       final result = await
       InternetAddress.lookup('google.com').timeout(const Duration(seconds: 60));
       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          SetIsLoaddingFlag(true,LoadingState.connection);
       }
     } on SocketException catch (_) {
       SetIsLoaddingFlag(false,LoadingState.connection);
     }
   }
}
