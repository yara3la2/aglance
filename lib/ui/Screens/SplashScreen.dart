import 'package:flutter/material.dart';
import 'package:flutter_first_women_app/utilies/constants.dart';
import 'package:splashscreen/splashscreen.dart';

import 'HomeMainScreen.dart';

class AppSplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WHITE,
        body: new SplashScreen(
            seconds: 4,
            useLoader: false,
            navigateAfterSeconds: new HomeMainScreen(),
            imageBackground: Image.asset(IMG_SPLASH,fit: BoxFit.fill).image,
            backgroundColor: WHITE,
            ),
    )
    );
  }
}
