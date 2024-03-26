import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_booking/Views/login_screen/login_screen.dart';
import 'package:movie_booking/Views/order_tickets/order_tickets_screen.dart';
import 'package:movie_booking/Views/profiles_screen/Confirmdialog.dart';
import 'package:movie_booking/utils/handle_login/handlelogin.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<ProfilePage> {
  final storage = const FlutterSecureStorage();
  String? username;
  String? userId;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    username = await storage.read(key: 'username');
    userId = await storage.read(key: 'userId');
    setState(() {});
  }

  Widget renderBody(BuildContext context) {
    bool isUserLoggedIn = HandleLogin.getIsLogin();
    return Expanded(
      child: Container(
        color: const Color(0xFFffffff),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                height: 120,
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset(
                        'assets/images/user_1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IntrinsicHeight(
                              child: SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    if (isUserLoggedIn && username != null)
                                      Text(
                                        username!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    else
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Login | Register',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color(0xFFE2E2E2),
                height: 1,
                width: double.infinity,
                child: const SizedBox(),
              ),
              isUserLoggedIn
                  ? buildListItem(
                      context,
                      text: 'Orders',
                      onPressed: () {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderedMovie(
                                user: userId,
                              ),
                            ),
                          );
                        }
                      },
                    )
                  : Container(),
              buildListItem(context, text: 'My Details', onPressed: () {}),
              buildListItem(context, text: 'Promo Code', onPressed: () {}),
              buildListItem(context, text: 'Notifications', onPressed: () {}),
              buildListItem(context, text: 'Help', onPressed: () {}),
              buildListItem(context, text: 'About', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListItem(BuildContext context,
      {required String text, required VoidCallback onPressed}) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: double.infinity,
          child: GestureDetector(
            onTap: onPressed,
            child: Row(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF181725),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.keyboard_arrow_right),
                  iconSize: 40,
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xFFE2E2E2),
          height: 1,
          width: double.infinity,
          child: const SizedBox(),
        ),
      ],
    );
  }

  Widget renderFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {
          isLogin = false;
          const ConfirmDialogPopUp().showLogoutDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF2F3F2),
          padding: const EdgeInsets.only(left: 16, right: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.logout_outlined,
              size: 30,
              color: Color(0xFF53B175),
            ),
            Text(
              'Log Out',
              style: TextStyle(
                color: Color(0xFF53B175),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderBody(context),
            isLogin ? renderFooter(context) : Container(),
          ],
        ),
      ),
    );
  }
}
