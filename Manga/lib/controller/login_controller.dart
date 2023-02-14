import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/routers/router.dart';
import 'package:manga_read/service/login_repository.dart';
import '../data/user.dart';
import '../common/values/const.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final isSuccess = false.obs;
  final hidePassword = true.obs;

  LoginController({required this.loginRepository});

  Future<void> checkLogin(Map<String, dynamic> user) async {
    final response = await loginRepository.login(user);

    if (response.statusCode == Constant.STATUS_OK) {
      if (response.body['message']) {
        GetStorage().write('userId', response.body['userId']);
        GetStorage().write('pass', user['password']);
        Get.offNamed(RouterNavigation.home);
      } else {
         EasyLoading.showError( 'Login failed',dismissOnTap: true);
      }
    } else {
      print(response.statusCode);
    }
  }

  void isHidePasswordIcon(bool value) {
    hidePassword.value = value;
  }

}