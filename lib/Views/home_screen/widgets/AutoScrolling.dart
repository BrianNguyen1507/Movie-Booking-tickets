import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollingBanner extends StatefulWidget {
  const AutoScrollingBanner({super.key});

  @override
  _AutoScrollingBannerState createState() => _AutoScrollingBannerState();
}

class _AutoScrollingBannerState extends State<AutoScrollingBanner> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); //cancel timer khi chuyen index
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(
            images[index],
            fit: BoxFit.fill,
          );
        },
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
      ),
    );
  }
}

final List<String> images = [
  'assets/images/movie_banner.jpg',
  'assets/images/movie_banner.jpg',
  'assets/images/movie_banner.jpg',
  'assets/images/movie_banner.jpg',
  'assets/images/logoTickets.png',
  // ... other image paths
];
