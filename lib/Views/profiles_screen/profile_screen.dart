import 'package:flutter/material.dart';
import 'package:movie_booking/Views/order_tickets/order_tickets_screen.dart';
import 'package:movie_booking/Views/profiles_screen/Confirmdialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<ProfilePage> {
  Widget renderBody(BuildContext context) {
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
              child: Row(children: [
                SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'assets/images/user_1.png',
                      fit: BoxFit.fill,
                    )),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(children: [
                                Text(
                                  'John Doe',
                                  style: TextStyle(
                                    color: Color(0xFF181725),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Text(
                            'abcxyz@gmail.com',
                            style: TextStyle(
                              color: Color(0xFF303233),
                              fontSize: 14,
                            ),
                          ),
                        ]),
                  ),
                ),
              ]),
            ),
            Container(
              color: const Color(0xFFE2E2E2),
              height: 1,
              width: double.infinity,
              child: const SizedBox(),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicketInfoScreen()),
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        height: double.infinity,
                        child: Row(
                          children: [
                            const Text(
                              'Orders',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            SizedBox(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TicketInfoScreen(),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.keyboard_arrow_right),
                                iconSize: 40,
                              ),
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
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      const Text(
                        'My Details',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_right),
                          iconSize: 40,
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      const Text(
                        'Promo Cord',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_right),
                          iconSize: 40,
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      const Text(
                        'Notifecations ',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_right),
                          iconSize: 40,
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      const Text(
                        'Help',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_right),
                          iconSize: 40,
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      const Text(
                        'About ',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_right),
                          iconSize: 40,
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
          ],
        )),
      ),
    );
  }

  Widget renderFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {
          const ConfirmDialogPopUp().showLogoutDialog(context);
          // Handle logout action
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
            SizedBox(
              child: Icon(
                Icons.logout_outlined,
                size: 30,
                color: Color(0xFF53B175),
              ),
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
              child: SizedBox(),
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
            renderFooter(context),
          ],
        ),
      ),
    );
  }
}
