import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_login/constants.dart';
import 'package:flutter/material.dart';

class MostWatched extends StatelessWidget {
  const MostWatched({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length, // Use the actual length of the data
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}'
              ),
            ),
          );
        },
      ),
    );
  }
}