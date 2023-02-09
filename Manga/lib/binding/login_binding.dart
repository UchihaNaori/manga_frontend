import 'package:get/get.dart';
import 'package:manga_read/controller/login_controller.dart';
import 'package:manga_read/providers/login_provider.dart';
import 'package:manga_read/service/login_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(loginRepository: LoginRepository(loginProvider: LoginProvider())));
  }

}