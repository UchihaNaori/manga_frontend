import 'package:flutter/material.dart';
import 'package:manga_read/common/utils/extensions.dart';
import 'package:manga_read/controller/friend_controller.dart';
import 'package:get/get.dart';
import 'package:manga_read/view/friend/widgets/friend_card.dart';
import 'package:manga_read/view/widgets/search_user.dart';
import '../../common/values/const.dart';

class FriendUI extends StatelessWidget {
  FriendController friendC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.mainColor,
        title: Text(
          'Friends',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.0.sp,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchUser());
            },
            icon: const Icon(Icons.search, size: 28,)
          )
        ],
      ),
      body: GetBuilder<FriendController>(builder: (controller) =>
        Container(
          padding: EdgeInsets.only(top: 2.0.hp, left: 5.0.wp, right: 5.0.wp),
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: [
              ...controller.friends.map((e) => FriendCard(user: e))
            ],
            physics:const BouncingScrollPhysics(),
          ),
        ),
      )
    );
  }

}