import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/splash_controller.dart';

class Splash extends GetView<SplashController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: Image.asset(
        'assets/images/splash.jpg',
        fit: BoxFit.fitHeight,
      )
    );
  }

}