import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_women_app/ui/Screens/AboutUsScreen.dart';
import 'package:flutter_first_women_app/ui/Screens/HomeWebviewScreen.dart';
import 'package:flutter_first_women_app/ui/Screens/SplashScreen.dart';
import 'package:flutter_first_women_app/ui/Widgets/ImageSliderWidget.dart';
import 'package:flutter_first_women_app/utilies/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: LIGHT_BROWN,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Aglance Coffee',
      debugShowCheckedModeBanner: false,
      initialRoute: SPLASH_SCREEN_ROUTE,
      routes: {
        SPLASH_SCREEN_ROUTE: (context) => AppSplashScreen(),
        WEBVIEW_SCREEN_ROUTE: (context) => HomeWebviewScreen(),
      },
    );
  }
}
