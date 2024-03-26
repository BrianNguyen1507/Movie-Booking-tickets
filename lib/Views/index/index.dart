// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:movie_booking/Views/home_screen/HomePage.dart';
import 'package:movie_booking/Views/showtimes_screen/showtime_screen.dart';
import 'package:movie_booking/Views/store_screen/store_screen.dart';
import 'package:movie_booking/Views/profiles_screen/profile_screen.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({
    Key? key,
    required this.title,
    int? initialIndex,
  })  : initialIndex = initialIndex ?? 0,
        super(key: key);

  final String title;
  final int initialIndex;

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late int index;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
    pages = [
      const HomePage(),
      const ShowTimePage(),
      const Store(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        iconSize: 23,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) => setState(() {
          index = value;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.slow_motion_video_sharp),
            label: 'Show times',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal',
          ),
        ],
      ),
    );
  }
}
