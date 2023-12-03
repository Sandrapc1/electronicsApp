
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user_signin/src/view/signin/signin_screen.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  const PasswordResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Password Reset Success')),
      body:  Center(
        child:  Lottie.asset('assets/lottie/Animation - 1697052914193.json',height: height*0.5,width:width*0.5,
           onLoaded: (p0) => wait(context),
           ) ,
      ),
    );
  }
    wait( BuildContext context){
    Timer(
    const  Duration(
        milliseconds: 3000
      ), () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), 
        (route) => false);
       });
  }
}