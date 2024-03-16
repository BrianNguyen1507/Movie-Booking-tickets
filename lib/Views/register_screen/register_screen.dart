import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_booking/Colors/colorvalues.dart';
import 'package:movie_booking/Views/login_screen/login_screen.dart';
import 'package:movie_booking/utils/handle_register/handleregister.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final TextEditingController _usernameDkController = TextEditingController();
final TextEditingController _passwordDkController = TextEditingController();
final TextEditingController _repasswordDkController = TextEditingController();
final TextEditingController _NameDkController = TextEditingController();
final TextEditingController _addressDkController = TextEditingController();
final TextEditingController _numberphoneDkController = TextEditingController();

String _gender = "";
List<String> _genders = ["Male", "Female"];
Gender? selectedGender;

bool _isObscurePass = true;
bool _isObscureConf = true;
bool _isChecked = false;

class _RegisterPageState extends State<RegisterPage> {
  void _resetText() {
    _usernameDkController.text = "";
    _passwordDkController.text = "";
    _repasswordDkController.text = "";
    _NameDkController.text = "";
    _addressDkController.text = "";
    _numberphoneDkController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  _onbackbutton(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                ),
                padding: const EdgeInsets.only(top: 25),
                color: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _usernameDkController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        label: Text(
                          'User name',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _passwordDkController,
                      style: const TextStyle(color: Colors.black),
                      obscureText: _isObscurePass,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_isObscurePass
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscurePass = !_isObscurePass;
                            });
                          },
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        label: const Text(
                          'Password',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _repasswordDkController,
                      style: const TextStyle(color: Colors.black),
                      obscureText: _isObscureConf,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.black,
                          icon: Icon(_isObscureConf
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscureConf = !_isObscureConf;
                            });
                          },
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        label: const Text(
                          'Confirm Password',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Center(
                      child: SizedBox(
                    width: 350.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _NameDkController,
                            style: const TextStyle(color: Colors.black),
                            obscureText: false,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: buttonsColor, width: 3.0)),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              label: Text(
                                'Name',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  const Gap(10),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _addressDkController,
                      keyboardType: TextInputType.streetAddress,
                      style: const TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        label: Text(
                          'Address',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _numberphoneDkController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        label: Text(
                          'Number Phone',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Gap(30),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 130.0,
                    color: const Color.fromARGB(130, 91, 91, 91),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Checkbox(
                                  activeColor: Colors.blue,
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },
                                  checkColor: Colors.white,
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                text:
                                    'I have read, I understand, and I agree to ',
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'the terms',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 350.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 2, 95, 255),
                                elevation: 0.0),
                            onPressed: _isChecked
                                ? () {
                                    setState(() {
                                      HandleRegisterState handleRegisterState =
                                          HandleRegisterState();
                                      handleRegisterState.validateRegistration(
                                        context,
                                        _usernameDkController.text,
                                        _passwordDkController.text,
                                        _repasswordDkController.text,
                                        _NameDkController.text,
                                        _gender,
                                        _addressDkController.text,
                                        _numberphoneDkController.text,
                                      );
                                    });
                                  }
                                : null,
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_onbackbutton(BuildContext context) {
  Navigator.pop(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
  );
}
