import 'package:flutter/material.dart';
import 'package:movie_booking/Colors/ColorValues.dart';
import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/Views/movies_detail/movieDetail_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: buttonsColor,
                image: DecorationImage(
                  image: AssetImage('assets/images/moviebanner2.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: null,
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white54,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IndexPage(
                      title: '',
                      initialIndex: 0,
                    ),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.white30,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.slow_motion_video_sharp,
                color: Colors.white54,
              ),
              title: const Text(
                'Showtimes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IndexPage(
                      title: '',
                      initialIndex: 1,
                    ),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.white30,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.storefront_outlined,
                color: Colors.white54,
              ),
              title: const Text(
                'Store',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IndexPage(
                      title: '',
                      initialIndex: 2,
                    ),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.white30,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white54,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IndexPage(
                      title: '',
                      initialIndex: 3,
                    ),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.white30,
              thickness: 1,
            ),
            Expanded(
              child: Container(), //bottom
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.white54,
              ),
              title: const Text(
                'More About Us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MovieDetailPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
