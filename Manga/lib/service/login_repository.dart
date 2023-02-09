import 'package:get/get.dart';
import 'package:manga_read/providers/login_provider.dart';

import '../data/user.dart';

class LoginRepository {
  LoginProvider loginProvider;
  LoginRepository({required this.loginProvider});

  Future<Response> login(Map<String, dynamic> user) async {
    final response = await loginProvider.login(user);
    return response;
  }
}