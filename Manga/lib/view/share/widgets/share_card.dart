import 'package:flutter/material.dart';
import 'package:manga_read/controller/share_controller.dart';
import 'package:manga_read/routers/router.dart';
import '../../../common/utils/extensions.dart';
import '../../../data/user.dart';
import 'package:get/get.dart';

class ShareCard extends StatelessWidget {
  final User user;
  ShareController shareC = Get.find();
  ShareCard({required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.0.hp),
      height: 10.0.hp,
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
            width: 55.0.wp,
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
          IconButton(
            onPressed:  () {
              shareC.containShared(user) ? shareC.unShare(user.id) :shareC.create(1, user);
              Get.toNamed(RouterNavigation.share);
            },
            icon:shareC.containShared(user) ? Image.asset('assets/images/icon_unshare.png', height: 30, fit: BoxFit.fitHeight,)
            :const Icon(Icons.share, color: Colors.black, size: 30,)
          )
        ],
      ),
    );
  }

}