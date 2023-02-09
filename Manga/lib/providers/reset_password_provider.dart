import 'package:get/get.dart';
import '../common/values/const.dart';

class ResetPasswordProvider extends GetConnect {
  Future<Response> resetPass(userId, newPass) => post('${Constant.baseUrl}/user/resetPass?userId=$userId&newPass=$newPass', {});
}