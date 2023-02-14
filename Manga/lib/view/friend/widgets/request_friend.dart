import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/common/values/const.dart';
import 'package:manga_read/controller/friend_controller.dart';
import '../../../common/utils/extensions.dart';
import '../../../data/user.dart';

class FriendRequestCard extends StatelessWidget {
  final User user;
  FriendRequestCard({required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.0.hp),
      height: 12.0.hp,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0.hp),
            child: Image.network(
                user.image,
                height: 10.0.hp,
                width: 10.0.hp,
            ),
          ),
          SizedBox(width: 5.0.wp,),
          SizedBox(
            width: 50.0.wp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 13.0.sp,
                    fontWeight: FontWeight.bold
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 0.5.hp,),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 11.0.sp,
                    color: const Color.fromARGB(255, 178, 177, 177)
                  ),
                ),
                SizedBox(height: 1.0.hp,),
                Text(
                  'Owned ${user.amountComic} comics',
                  style: TextStyle(
                    fontSize: 11.0.sp,
                    color: const Color.fromARGB(255, 178, 177, 177)
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed:  () {
                  Get.find<FriendController>().accept(user);
                  Get.back();
                },
                iconSize: 30,
                icon:Image.asset('assets/images/accept_user.png', width: 25, fit: BoxFit.fitWidth,)
              ),
              IconButton(
                onPressed:  () {
                  Get.find<FriendController>().unAccept(user);
                  Get.back();
                },
                iconSize: 30,
                icon:Image.asset('assets/images/user_unaccept.png', height: 25, fit: BoxFit.fitWidth,)
              ),
            ],
          )
        ],
      ),
    );
  }

}