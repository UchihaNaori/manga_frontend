import 'package:get/get.dart';
import '../common/values/const.dart';

class LoginProvider extends GetConnect {
  Future<Response> login(data) => post('${Constant.baseUrl}/login', data);
}