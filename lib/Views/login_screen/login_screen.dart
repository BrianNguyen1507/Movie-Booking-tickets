import 'package:flutter/material.dart';
import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/services/AuthToken.dart';
import 'package:movie_booking/utils/handle_login/handlelogin.dart';
import 'package:movie_booking/Views/register_screen/register_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final HandleLogin _handleLogin = HandleLogin();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    bool isLoggedIn = await TokenAuthenticated.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IndexPage(
            title: 'Home page',
            initialIndex: 0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 2, top: 25),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Put your email address to continue',
                    style: TextStyle(
                      color: Color.fromARGB(255, 107, 189, 255),
                      fontSize: 17.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 350.0,
                        child: TextField(
                          controller: _usernameController,
                          style: const TextStyle(color: Colors.black),
                          obscureText: false,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3.0)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black54, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Username",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 36.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 350.0,
                        child: TextField(
                          controller: _passwordController,
                          style: const TextStyle(color: Colors.black),
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3.0)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black54, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Password",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    SizedBox(
                      width: 350.0,
                      height: 50.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.blue),
                          shape: WidgetStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              side: BorderSide(color: Colors.white70),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          bool? loggedIn = await _handleLogin.handleLogin(
                            context,
                            _usernameController.text,
                            _passwordController.text,
                          );

                          if (loggedIn!) {
                            setState(() {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            });
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    const Center(
                      heightFactor: 5,
                      child: Text(
                        "Don't have an Account?",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      width: 350.0,
                      height: 50.0,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.grey,
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              side: BorderSide(color: Colors.white70),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _onRegisterPress(context);
                        },
                        child: const Text(
                          'Resgister',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_onRegisterPress(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ));
}
