import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/routers/router.dart';

class  SplashController extends GetxController {
  final store = GetStorage();

  Future<bool> checkLogin() async{
    var userId = await store.read('userId');
    if (userId != null) {
      return true;
    }

    return false;
  }
  @override
  void onReady() async {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        bool isLogin = await checkLogin();
        if (isLogin) {
          Get.offNamed(RouterNavigation.home);
        } else  {
          Get.offNamed(RouterNavigation.login);
        }
      }
    );
    super.onReady();
  }
}