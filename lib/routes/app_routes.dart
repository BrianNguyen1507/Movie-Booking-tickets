import 'package:flutter/widgets.dart';
import 'package:movie_booking/Views/home_screen/HomePage.dart';
import 'package:movie_booking/Views/showtimes_screen/showtime_screen.dart';
import 'package:movie_booking/Views/bottomnav_bar/BottomNavigator.dart';
import 'package:movie_booking/Views/login_screen/login_screen.dart';
import 'package:movie_booking/Views/register_screen/register_screen.dart';
import 'package:movie_booking/Views/splash_screen/splash_screen.dart';
import 'package:movie_booking/Views/store_screen/store_screen.dart';
import 'package:movie_booking/Views/profiles_screen/profile_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String homePage = '/HomePage';
  static const String loginScreen = '/login_screen';
  static const String registerScreen = '/register_screen';
  static const String nextPage = '/NextPage';
  static const String indexPage = '/IndexView';
  static const String profilePage = '/Profile_screen';
  static const String storePage = '/store_screen';
  static Map<String, WidgetBuilder> routes = {
    indexPage: (context) => const BottomNavBar(
          title: 'Movie_tickets',
        ),
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    nextPage: (context) => const ShowTimePage(),
    registerScreen: (context) => const RegisterPage(),
    loginScreen: (context) => const LoginPage(),
    profilePage: (context) => const ProfilePage(),
    storePage: (context) => const Store(),
  };
}
