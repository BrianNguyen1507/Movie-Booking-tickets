import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_booking/Colors/ColorValues.dart';
import 'package:movie_booking/Views/login_screen/login_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

bool _isObscurePass = true;
bool _isObscureConf = true;
final List<String> _gender = [
  'Male',
  'Female',
];

bool _isChecked = false;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
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
                  const SizedBox(
                    width: 350,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white70),
                      obscureText: false,
                      decoration: InputDecoration(
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
                  const Center(
                      child: SizedBox(
                    width: 350.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white70),
                            obscureText: false,
                            decoration: InputDecoration(
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
                        Gap(10),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white70),
                            obscureText: false,
                            decoration: InputDecoration(
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
                    child: DropdownButtonFormField<String>(
                      value: selectedValue,
                      onChanged: (String? value) {
                        // Update the selected value when an item is chosen.
                        selectedValue = value;
                      },
                      dropdownColor: const Color.fromARGB(255, 70, 70, 70),
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                        labelStyle: TextStyle(color: Colors.white70),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: buttonsColor, width: 3.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1.0),
                        ),
                      ),
                      items: _gender.map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                  const Gap(10),
                  const SizedBox(
                    width: 350,
                    child: TextField(
                      keyboardType: TextInputType.streetAddress,
                      style: TextStyle(color: Colors.white70),
                      obscureText: false,
                      decoration: InputDecoration(
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
                  const SizedBox(
                    width: 350,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white70),
                      obscureText: false,
                      decoration: InputDecoration(
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
                                  ]),
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
                                    _onRegistrationSuccess(context);
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

_onRegistrationSuccess(BuildContext context) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
}
