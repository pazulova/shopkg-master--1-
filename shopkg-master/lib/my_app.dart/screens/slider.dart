import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ImageSilderDemo extends StatelessWidget {
  final images = [
  Image.asset('images/camera.jpg'),
  Image.asset('images/about.png'),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images Scroll'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      
          CarouselSlider(items: images, options: CarouselOptions(
            aspectRatio: 1.0,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
          ),)
        ],
      ),
    );
  }
}