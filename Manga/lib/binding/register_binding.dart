import 'package:get/get.dart';
import 'package:manga_read/controller/register_controller.dart';
import 'package:manga_read/providers/register_provider.dart';

import '../service/register_repository.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(registerRepository: RegisterRepository(registerProvider: RegisterProvider())));
  }

}