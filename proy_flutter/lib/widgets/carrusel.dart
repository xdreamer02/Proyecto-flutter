import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class CarruselPage extends StatefulWidget {
  const CarruselPage({super.key});

  @override
  State<CarruselPage> createState() => _CarruselPageState();
}

class _CarruselPageState extends State<CarruselPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: [
            "https://picsum.photos/500/350?=2",
            "https://picsum.photos/500/350?=12",
            "https://picsum.photos/500/350?=32",
            "https://picsum.photos/500/350?=52",
          ].map((e) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                        image: NetworkImage(
                      e,
                    )),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
              viewportFraction: 0.7, height: 250.0, autoPlay: true)),
    );
  }
}
