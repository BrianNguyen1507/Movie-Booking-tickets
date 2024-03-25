import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_booking/Views/login_screen/login_screen.dart';
import 'package:movie_booking/utils/handle_register/handleregister.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameDkController = TextEditingController();
  final TextEditingController _passwordDkController = TextEditingController();
  final TextEditingController _repasswordDkController = TextEditingController();
  final TextEditingController _NameDkController = TextEditingController();
  final TextEditingController _addressDkController = TextEditingController();
  final TextEditingController _numberphoneDkController =
      TextEditingController();

  String _gender = "";
  List<String> _genders = ["Male", "Female"];
  Gender? selectedGender;

  bool _isObscurePass = true;
  bool _isObscureConf = true;
  bool _isChecked = false;

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
      appBar: AppBar(
        leading: IconButton(
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                TextFormField(
                  controller: _usernameDkController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'User name',
                  ),
                ),
                const Gap(10),
                TextFormField(
                  controller: _passwordDkController,
                  obscureText: _isObscurePass,
                  decoration: InputDecoration(
                    labelText: 'Password',
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
                  ),
                ),
                const Gap(10),
                TextFormField(
                  controller: _repasswordDkController,
                  obscureText: _isObscureConf,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon(_isObscureConf
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscureConf = !_isObscureConf;
                        });
                      },
                    ),
                  ),
                ),
                const Gap(10),
                TextFormField(
                  controller: _NameDkController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                const Gap(10),
                TextFormField(
                  controller: _addressDkController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                  ),
                ),
                const Gap(10),
                TextFormField(
                  controller: _numberphoneDkController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Number Phone',
                  ),
                ),
                const Gap(30),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.blue,
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'I have read and I agree to ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'the terms',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isChecked
                        ? () {
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
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onbackbutton(BuildContext context) {
    Navigator.pop(context);
  }
}
