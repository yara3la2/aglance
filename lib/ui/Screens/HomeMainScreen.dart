import 'package:flutter/material.dart';
import 'package:flutter_first_women_app/ui/Screens/AboutUsScreen.dart';
import 'package:flutter_first_women_app/ui/Screens/HomeWebviewScreen.dart';
import 'package:flutter_first_women_app/ui/Widgets/ImageSliderWidget.dart';
import 'package:flutter_first_women_app/utilies/constants.dart';

class HomeMainScreen extends StatefulWidget {
  @override
  _HomeMainScreenState createState() => new _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int _currentIndex=1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: currentWidget(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.call),
            title: new Text(''),
            activeIcon: new Icon(Icons.call,color: BROWN,),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            activeIcon: new Icon(Icons.home,color: BROWN,),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.help),
              activeIcon: new Icon(Icons.help,color: BROWN,),
              title: Text('')
          )
        ],
      ),
    ));
  }
  Widget currentWidget(int index){
    switch(index){
      case 0 :return AboutUsScreen(); break;
      case 1: return HomeWebviewScreen();break;
      case 2:return AboutAppSliderWidget();break;
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
