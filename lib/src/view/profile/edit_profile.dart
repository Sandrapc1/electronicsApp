import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_signin/core/colors.dart';
import 'package:user_signin/src/controller/imagepicker_controller.dart';
import 'package:user_signin/src/controller/profile_controller.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key});
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  final UserDataController userDataController = Get.put(UserDataController());
  final TextEditingController nameController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redd,
        iconTheme: const IconThemeData(color: white),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.07),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Obx(() => CircleAvatar(
                        backgroundImage: imagePickerController
                                .imagePath.value.isNotEmpty
                            ? FileImage(
                                    File(imagePickerController.imagePath.value))
                                as ImageProvider
                            : const AssetImage('assets/images/profile.jpg'),
                        radius: 80,
                      )),
                  Positioned(
                    bottom: 0,
                    child: InkWell(
                      onTap: () async {
                        await imagePickerController.takePhoto();
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        color: redd,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  children: [
                     TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('user name')),
                          onChanged: (value) {
                            userDataController.updateUserData(name: value);
                          },
                    ),
                    SizedBox(height: height * 0.03),
                     TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('phone number'),
                      ),
                      onChanged: (value) {
                        userDataController.updateUserData(phone: value);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.07),
              TextButton(
                onPressed: () {
                  userDataController.updateUserData(
                    name: nameController.text,
                    phone: phoneController.text

                  );
                  Get.back();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(redd),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    fixedSize: MaterialStateProperty.all(
                        Size(width * 0.7, height * 0.05))),
                child: const Text(
                  'SAVE',
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
