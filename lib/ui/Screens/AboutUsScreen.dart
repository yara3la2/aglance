import 'package:flutter/material.dart';
import 'package:flutter_first_women_app/utilies/constants.dart';
import 'package:flutter_first_women_app/utilies/methodsUtilies.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
        body: Column(
          children: [
           SizedBox(height:getScreenHeight(context)*0.2),
            AboutUsScreenBody(),
            Spacer()
          ],
        ),
        ),
    );
  }
Widget AboutUsScreenBody(){
    return Expanded(
      child: GridView.count(
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return Center(
              child: Column(
        children: [
          GestureDetector(
            onTap:onMenuItemTap()[index],
              child: contactUsIcons()[index]),
          menuItemsTitles()[index]
        ],
      )
        );
      })
      ),
    );
}
  List<Text> menuItemsTitles() {
    return [
      Text(
       "Contact Us",
        style: BLACK_TEXT_STYLE,
      ),
      Text(
        "Email Us",
        style: BLACK_TEXT_STYLE,
      ),
      Text(
        "MENU PDF" ,
        style: BLACK_TEXT_STYLE,
      ),
      Text(
        "Follow Us",
        style: BLACK_TEXT_STYLE,
      ),
    ];
  }
  List<Icon> contactUsIcons() {
    return [
      Icon(Icons.phone,color: BROWN,size: 30,),
      Icon(Icons.mail,color: BROWN,size: 30,),
      Icon(Icons.link,color: BROWN,size: 30,),
      Icon(Icons.work,color: BROWN,size: 30,),

    ];
  }

  List<Function> onMenuItemTap() {
    return [
          () {
            launch("tel://00966544416455");      },

          () {
            launch("mailto:aglancecafee@gmail.com");
      },
          () {
            launch("https://aglance.coffee/MENU.pdf", forceSafariVC: false, forceWebView: false);
          },
          () {
            launch("https://aglance.coffee/about-us-2", forceSafariVC: false, forceWebView: false);
      },

    ];
  }

}
