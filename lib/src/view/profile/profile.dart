import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_signin/src/controller/firebase_services.dart';
import 'package:user_signin/src/view/signin/signin_screen.dart';
import '../../../core/colors.dart';
import 'profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: redd),
        backgroundColor: redd,
        title: const Text(
          'Profile',
          style: TextStyle(color: white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('SignOut'),
                    content: const Text('Are you sure you want to Signout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.remove('email');
                          Get.to(SignInScreen());
                          await FirebaseServices().signOut();
                        },
                        child: const Text('SignOut',
                            style: TextStyle(color: redd)),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: redd,
              radius: 80.0,
              child: Lottie.asset(
                'assets/lottie/Animation - 1696969211436.json',
                width: width * 0.7,
                height: height * 0.6,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20.0),
            const ProfileInfoItem(
              label: 'Phone',
              value: '+1234567890',
            ),
            const ProfileInfoItem(
              label: 'Location',
              value: 'New York, USA',
            ),
          ],
        ),
      ),
    );
  }
}
