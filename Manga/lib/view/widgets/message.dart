import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/utils/extensions.dart';

class Message extends StatelessWidget {
  final String message;
  Message({required this.message});
  @override
  Widget build(BuildContext context) {
      return Container(
        height: Get.height*0.5,
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/icon_background.png',
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0.hp, left: 45.0.wp),
              child: Text(
                message
              ),
            )
          ],
        ),
      );
  }

}