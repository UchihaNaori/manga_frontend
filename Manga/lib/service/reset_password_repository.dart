import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../providers/reset_password_provider.dart';
import '../common/values/const.dart';

class ResetPasswordRepository {
  final store = GetStorage();
  ResetPasswordProvider resetPasswordProvider;
  ResetPasswordRepository({required this.resetPasswordProvider});

  Future<bool> resetPass(String newPass, String oldPass) async {
    Response response = await resetPasswordProvider.resetPass(store.read('userId'), newPass);
    String oldP = await store.read('pass');
    if (oldPass == oldP) {
      if (response.statusCode == Constant.STATUS_OK) {
        print('reset oke');
      } else {
        print(response.statusCode);
      }
      return true;
    }
    return false;
  }
}