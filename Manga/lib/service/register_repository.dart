import 'package:get/get.dart';
import 'package:manga_read/providers/register_provider.dart';

class RegisterRepository {
  RegisterProvider registerProvider;
  RegisterRepository({required this.registerProvider});

  Future<Response> register(Map<String, dynamic> data) async {
    return await registerProvider.register(data);
  }
}