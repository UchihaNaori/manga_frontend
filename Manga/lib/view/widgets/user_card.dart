import 'package:flutter/material.dart';
import '../../data/user.dart';
import '../../common/utils/extensions.dart';

class UserCard extends StatelessWidget {
  bool haveIcon;
  Widget? icon;
  User user;
  UserCard({Key? key, required this.haveIcon, required this.user, this.icon}): super(key: key);
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

          // if (haveIcon)
          // icon
        ],
      ),
    );
  }

}