import 'package:get/get.dart';
import 'package:manga_read/controller/reset_password_controller.dart';
import 'package:manga_read/providers/reset_password_provider.dart';

import '../service/reset_password_repository.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController(resetPasswordRepository: ResetPasswordRepository(resetPasswordProvider: ResetPasswordProvider())));
  }

}