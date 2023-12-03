import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:user_signin/src/controller/firebase_services.dart';
import 'package:user_signin/src/controller/imagepicker_controller.dart';
import 'package:user_signin/src/controller/profile_controller.dart';
import 'package:user_signin/src/view/signin/signin_screen.dart';
import '../../../core/colors.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  final UserDataController userDataController = Get.put(UserDataController());

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
                          GoogleFirebase().signOut().then((value) {
                            Get.off(LoginPage());
                          });
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.15, top: height * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Obx(() => CircleAvatar(
                    backgroundImage: imagePickerController
                            .imagePath.value.isNotEmpty
                        ? FileImage(File(imagePickerController.imagePath.value))
                            as ImageProvider
                        : const AssetImage('assets/images/profile.jpg'),
                    radius: 80,
                  )),
              const SizedBox(height: 20.0),
              Obx(() {
                final userName = userDataController.userName.value;
                final phoneNumber = userDataController.phoneNumber.value;
                return Column(
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      phoneNumber,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                );
              }),
              SizedBox(height: height * 0.1),
              TextButton(
                onPressed: () {
                  Get.to(EditScreen());
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(redd),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    fixedSize: MaterialStateProperty.all(
                        Size(width * 0.7, height * 0.05))),
                child: const Text(
                  'Edit',
                  style: TextStyle(color: white, fontSize: 21),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
