import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderDemo extends StatelessWidget {
  const CarouselSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.teal, Colors.indigo, Colors.deepOrange];
    return CarouselSlider(
      options: CarouselOptions(
        height: 170,
        enlargeCenterPage: true,
        viewportFraction: 0.72,
      ),
      items: [
        for (var index = 0; index < colors.length; index++)
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '轮播页 ${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
      ],
    );
  }
}
