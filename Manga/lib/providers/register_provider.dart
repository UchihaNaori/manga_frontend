import 'package:get/get.dart';
import '../common/values/const.dart';

class RegisterProvider extends GetConnect {
  Future<Response> register(data) => post('${Constant.baseUrl}/register', data);
}