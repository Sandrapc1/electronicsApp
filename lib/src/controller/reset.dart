import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  var resetEmail = ''.obs;

  void setResetEmail(String email) {
    resetEmail.value = email;
  }
}
