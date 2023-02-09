import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:manga_read/routers/router.dart';
import 'package:manga_read/service/register_repository.dart';
import '../data/user.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> registerFromKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  RegisterRepository registerRepository;
  RegisterController({required this.registerRepository});
  final hidePassword = false.obs;
  final checkEmailDuplicate = false.obs;


  void isHidePasswordIcon(bool value) {
    hidePassword.value = value;
  }

  Future<void> register(Map<String, dynamic > data) async{
      Response response = await registerRepository.register(data);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseJson = Map<String, dynamic>.from(response.body);

        if (responseJson['message'] == 'Error') {
          checkEmailDuplicate.value = true;
        } else {
          Get.toNamed(RouterNavigation.home);
        }
      } else {
        print('Error load');
      }
  }
}