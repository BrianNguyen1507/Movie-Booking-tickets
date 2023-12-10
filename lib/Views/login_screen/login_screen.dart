import 'package:flutter/material.dart';
import 'package:movie_booking/Colors/colorvalues.dart';
import 'package:movie_booking/handle/handle_login/handleLogin.dart';
import 'package:movie_booking/Views/register_screen/register_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

HandleLogin _handleLogin = const HandleLogin();
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                          color: Colors.white),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Put your email address to continue',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36.0,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 350.0,
                        child: TextField(
                          controller: _usernameController,
                          style: const TextStyle(color: Colors.white70),
                          obscureText: false,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            filled: true,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: buttonsColor, width: 3.0)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white70, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            label: const Text(
                              'Email',
                              style: TextStyle(color: Colors.white70),
                            ),
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
                          style: const TextStyle(color: Colors.white70),
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            filled: true,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: buttonsColor, width: 3.0)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white70, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            label: const Text(
                              'Password',
                              style: TextStyle(color: Colors.white70),
                            ),
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
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            buttonsColor,
                          ),
                        ),
                        onPressed: () {
                          _handleLogin.handleLogin(
                            context,
                            _usernameController.text,
                            _passwordController.text,
                          );
                          _resetText();
                        },
                        child: const Text('Next'),
                      ),
                    ),
                    const Center(
                      heightFactor: 5,
                      child: Text(
                        "Don't have an Account?",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    SizedBox(
                      width: 350.0,
                      height: 50.0,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.transparent,
                              ),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      side:
                                          BorderSide(color: Colors.white70)))),
                          onPressed: () {
                            _onRegisterPress(context);
                          },
                          child: const Text('Register')),
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

_resetText() {
  _usernameController.text = "";
  _passwordController.text = "";
}

_onRegisterPress(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ));
}
