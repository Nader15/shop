import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              // Positioned(
              //   bottom: 0.0,
              //   left: 0.0,
              //   right: 0.0,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           Color.fromARGB(200, 0, 0, 0),
              //           Color.fromARGB(0, 0, 0, 0)
              //         ],
              //         begin: Alignment.bottomCenter,
              //         end: Alignment.topCenter,
              //       ),
              //     ),
              //     padding: EdgeInsets.symmetric(
              //         vertical: 10.0, horizontal: 20.0),
              //     child: Text(
              //       'No. ${imgList.indexOf(item)} image',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20.0,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )),
    ),
  ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}

final List<String> imgList = [
  'https://www.albayan.ae/polopoly_fs/1.3286488.1528418731!/image/image.jpg_gen/derivatives/original_640/image.jpg',
  'https://mebusiness.ae/uploads/news/mebusiness.ae_1533298197.jpg',
  'https://dneegypt.nyc3.digitaloceanspaces.com/2019/09/SODIC.jpg',
  'http://www.cairohotel.co/uploads/covers/1546511450.jpg',
  'https://en.amwalalghad.com/wp-content/uploads/2018/09/Mall-of-Arabia-Cairo.jpg',
];

