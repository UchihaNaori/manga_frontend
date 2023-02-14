import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../providers/reset_password_provider.dart';
import '../common/values/const.dart';

class ResetPasswordRepository {
  final store = GetStorage();
  ResetPasswordProvider resetPasswordProvider;
  ResetPasswordRepository({required this.resetPasswordProvider});

  Future<bool> resetPass(String newPass, String oldPass) async {
    String oldP = await store.read('pass');
    if (oldPass == oldP) {
      Response response = await resetPasswordProvider.resetPass(store.read('userId'), newPass);
      if (response.statusCode == Constant.STATUS_OK) {
        store.write('pass', newPass);
        print('reset oke');
      } else {
        print(response.statusCode);
        return false;
      }
      return true;
    }
    return false;
  }
}