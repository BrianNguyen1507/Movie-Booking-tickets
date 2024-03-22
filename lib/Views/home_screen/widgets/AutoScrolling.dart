import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AutoScrollingBanner extends StatefulWidget {
  const AutoScrollingBanner({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AutoScrollingBannerState createState() => _AutoScrollingBannerState();
}

class _AutoScrollingBannerState extends State<AutoScrollingBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          autoPlay: true,
          onPageChanged: (int index, CarouselPageChangedReason reason) {
            setState(() {});
          },
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              width: double.infinity,
              images[index],
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}

final List<String> images = [
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
  'assets/images/logoTickets.png',
];
