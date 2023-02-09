import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/routers/router.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
  configLoading();
}
void configLoading() {
  EasyLoading.instance
  ..loadingStyle = EasyLoadingStyle.dark
  ..maskType = EasyLoadingMaskType.black
  ..indicatorType = EasyLoadingIndicatorType.threeBounce;
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
    title: 'Manga reader',
    // home: Detail(),
    // initialBinding: DetailBinding(),
    initialRoute: RouterNavigation.splash,
    builder: EasyLoading.init(),
    getPages: RouterNavigation.routers
  );
  }

}