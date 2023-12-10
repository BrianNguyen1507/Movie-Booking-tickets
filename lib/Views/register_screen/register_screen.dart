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

final TextEditingController _emailDkController = TextEditingController();
final TextEditingController _passwordDkController = TextEditingController();
final TextEditingController _repasswordDkController = TextEditingController();
final TextEditingController _firstNameDkController = TextEditingController();
final TextEditingController _lastNameDkController = TextEditingController();
final TextEditingController _addressDkController = TextEditingController();
final TextEditingController _numberphoneDkController = TextEditingController();

enum Gender {
  Male,
  Female,
}

Gender? selectedGender;

final List<Gender> _genders = [Gender.Male, Gender.Female];
bool _isObscurePass = true;
bool _isObscureConf = true;
bool _isChecked = false;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                color: Colors.white,
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
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _emailDkController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white70),
                      obscureText: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1.0),
                        ),
                        label: Text(
                          'Email',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _passwordDkController,
                      style: const TextStyle(color: Colors.white70),
                      obscureText: _isObscurePass,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.white70,
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
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1.0),
                        ),
                        label: const Text(
                          'Password',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _repasswordDkController,
                      style: const TextStyle(color: Colors.white70),
                      obscureText: _isObscureConf,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.white70,
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
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1.0),
                        ),
                        label: const Text(
                          'Confirm Password',
                          style: TextStyle(color: Colors.white70),
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
                            controller: _firstNameDkController,
                            style: const TextStyle(color: Colors.white70),
                            obscureText: false,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: buttonsColor, width: 3.0)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white70, width: 1.0),
                              ),
                              label: Text(
                                'First Name',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: TextField(
                            controller: _lastNameDkController,
                            style: const TextStyle(color: Colors.white70),
                            obscureText: false,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: buttonsColor, width: 3.0)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white70, width: 1.0),
                              ),
                              label: Text(
                                'Last Name',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  const Gap(10),
                  SizedBox(
                    width: 350.0,
                    child: DropdownButtonFormField<Gender>(
                      value: selectedGender,
                      onChanged: (Gender? value) {
                        // Update the selected value when an item is chosen.
                        setState(() {
                          selectedGender = value;
                        });
                      },
                      dropdownColor: const Color.fromARGB(255, 70, 70, 70),
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                        labelStyle: TextStyle(color: Colors.white70),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: buttonsColor, width: 3.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1.0),
                        ),
                      ),
                      items: _genders.map((Gender gender) {
                        return DropdownMenuItem<Gender>(
                          value: gender,
                          child: Text(gender
                              .toString()
                              .split('.')
                              .last), // Display 'Male' or 'Female'
                        );
                      }).toList(),
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _addressDkController,
                      keyboardType: TextInputType.streetAddress,
                      style: const TextStyle(color: Colors.white70),
                      obscureText: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1.0),
                        ),
                        label: Text(
                          'Address',
                          style: TextStyle(color: Colors.white70),
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
                      style: const TextStyle(color: Colors.white70),
                      obscureText: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1.0),
                        ),
                        label: Text(
                          'Number Phone',
                          style: TextStyle(color: Colors.white70),
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
                                  activeColor:
                                      const Color.fromARGB(255, 2, 255, 32),
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
                                        color: buttonsColor,
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
                                    const Color.fromARGB(255, 2, 255, 32),
                                elevation: 0.0),
                            onPressed: _isChecked
                                ? () {
                                    HandleRegister.validateRegistration(
                                      context,
                                      _emailDkController.text,
                                      _passwordDkController.text,
                                      _repasswordDkController.text,
                                      _firstNameDkController.text,
                                      _lastNameDkController.text,
                                      _addressDkController.text,
                                      _numberphoneDkController.text,
                                    );
                                    _resetText();
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

_resetText() {
  _emailDkController.text = "";
  _passwordDkController.text = "";
  _repasswordDkController.text = "";
  _firstNameDkController.text = "";
  _lastNameDkController.text = "";
  _addressDkController.text = "";
  _numberphoneDkController.text = "";
}

_onbackbutton(BuildContext context) {
  Navigator.pop(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
  );
}
