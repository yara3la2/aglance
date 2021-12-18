import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_women_app/utilies/constants.dart';
import 'package:flutter_first_women_app/utilies/methodsUtilies.dart';

final imgList =[IMG_1,IMG_2,IMG_3];

class AboutAppSliderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }

}

class _CarouselWithIndicatorState extends State<AboutAppSliderWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
              CarouselSlider(
                items: imageSliders(context),
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                      aspectRatio: 0.7,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
            ]
        ),
      ),
    );
  }
   List<Widget> imageSliders(BuildContext context) {
    return imgList.map((item) => Container(
    child: Container(
      width: getScreenWidth(context),
      height: getScreenHeight(context),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image:Image.asset(item, fit: BoxFit.fill).image,
        )),
    ),
  )).toList();
}
}