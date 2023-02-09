import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:manga_read/service/reset_password_repository.dart';

class ResetPasswordController extends GetxController {
  ResetPasswordRepository resetPasswordRepository;
  final resetPasswordKey = GlobalKey<FormState>();
  ResetPasswordController({required this.resetPasswordRepository});
  final oldPass = TextEditingController();
  final newPass = TextEditingController();
  final confirmPass = TextEditingController();
  RxBool showOldPass = false.obs;
  RxBool showNewPass = false.obs;
  RxBool showConfirmPass = false.obs;

  void setShowOldPass (bool value) {
    showOldPass.value = value;
    update();
  }

  void setShowNewPass(bool value) {
    showNewPass.value = value;
    update();
  }

  void setShowConfirmPass(bool value) {
    showConfirmPass.value = value;
    update();
  }

  Future<void> resetPass(String newPass, String oldPass) async {
    bool success = await resetPasswordRepository.resetPass(newPass, oldPass);
     if (success) {
      Get.back();
    } else {
      EasyLoading.showError('Wrong password!');
    }
  }
}