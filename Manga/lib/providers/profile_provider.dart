import 'package:get/get.dart';
import '../common/values/const.dart';

class ProfileProvider extends GetConnect {
  Future<Response> getInformation(userId) => get('${Constant.baseUrl}/user/profile/$userId');
}