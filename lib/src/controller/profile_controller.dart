import 'package:get/get.dart';

class UserDataController extends GetxController {
  var userName = 'John Doe'.obs;
  var phoneNumber = '1234567890'.obs;

  void updateUserData({String? name, String? phone}) {
    if (name != null) userName.value = name;
    if (phone != null) phoneNumber.value = phone;
  }
}
