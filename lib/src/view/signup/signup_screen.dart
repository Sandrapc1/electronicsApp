// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';
import '../bottambar/bottamnavigation.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  String? _validateName(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    String? match = r'\w+@\w+\.\w+';

    RegExp regex = RegExp(match);
    if (!regex.hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  String? _password(value) {
    if (value == '' || value == null) {
      return 'Enter the password';
    }
    return null;
  }

  String? _confirmPassword(value) {
    if (value == '' || value != passwordeditcontroller.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emaileditcontroller = TextEditingController();
  TextEditingController passwordeditcontroller = TextEditingController();
  TextEditingController confrmpasswordcontroller = TextEditingController();

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emaileditcontroller.text);
    await prefs.setString('password', passwordeditcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
            ),
          ),
          Positioned(
            top: height * 0.1,
            child: const Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ),
          Positioned(
            top: height * 0.15,
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Container(
                height: height * 0.72,
                width: width * 0.8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white60,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.04,
                    right: width * 0.04,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Material(
                        elevation: 8,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        child: TextFormField(
                          validator: _validateName,
                          controller: nameController,
                          minLines: 1,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: yellow),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            hintText: 'Name',
                            hintStyle: const TextStyle(color: grey),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Material(
                        elevation: 8,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        child: TextFormField(
                          validator: _validateEmail,
                          controller: emaileditcontroller,
                          minLines: 1,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: yellow),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            hintText: 'Email',
                            hintStyle: const TextStyle(color: grey),
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Material(
                        elevation: 8,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        child: TextFormField(
                          validator: _password,
                          controller: passwordeditcontroller,
                          minLines: 1,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: yellow),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: grey),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Material(
                        elevation: 8,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        child: TextFormField(
                          validator: _confirmPassword,
                          controller: confrmpasswordcontroller,
                          minLines: 1,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: yellow),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(color: grey),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      TextButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            await _saveUserData();
                            Get.to(const MainScreen());
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(redd),
                          fixedSize: MaterialStateProperty.all(
                            Size(width * 0.5, height * 0.05),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

