import 'package:flutter/material.dart';
import 'package:manga_read/common/utils/extensions.dart';
import 'package:manga_read/controller/friend_controller.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/share_controller.dart';
import 'package:manga_read/view/widgets/message.dart';
import './widgets/share_card.dart';
import './widgets/search_user.dart';
import '../../common/values/const.dart';
import 'widgets/unshare_card.dart';

class ShareComic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.mainColor,
        title: Text(
          'Share comic',
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
      body: Container(
        padding: EdgeInsets.only(top: 2.0.hp, left: 5.0.wp, right: 5.0.wp),
        color: Colors.white,
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: GetBuilder<ShareController>(builder:(controller) =>
            Column(
              children: [
                Text(
                  'Friends',
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 1.0.hp,),
                controller.friends.length > 0 ?
                  ListView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ShareCard(user: controller.friends[index]);
                    },
                    itemCount: controller.friends.length,
                  ) : Message(message: 'You don\'t have \nfriends to share'),
                SizedBox(height: 1.0.hp,),
                Text(
                  'Shared',
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 1.0.hp,),
                controller.listShared.length > 0 ?
                  ListView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return UnShareCard(user: controller.listShared[index]);
                    },
                    itemCount: controller.listShared.length,
                  ) : Message(message: ' You have not \n shared with \n anyone yet')
              ],
            ),
          )
        )
      ),
    );
  }
}