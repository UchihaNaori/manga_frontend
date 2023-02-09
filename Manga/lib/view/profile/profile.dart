import 'package:flutter/material.dart';
import 'package:manga_read/controller/home_controller.dart';
import 'package:manga_read/controller/profile_controller.dart';
import 'package:manga_read/routers/router.dart';
import '../../common/values/const.dart';
import '../../common/utils/extensions.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
        child: GetX<ProfileController>(builder: (controller) =>
          Column(
            children: [
              Container(
                height: 10.0.hp,
                decoration: BoxDecoration(
                  color: Constant.mainColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: const Color.fromARGB(255, 178, 177, 177))
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 56,
                      backgroundColor: Constant.mainColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.0.hp),// Border radius
                        child: ClipOval(child: Image.network(controller.user.value!.image)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.user.value!.name,
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 2.0.hp,),
                        Text(
                          controller.user.value!.email,
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            color: Colors.white
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.0.hp,),
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 2.0.hp,),
              Container(
                height: 40.0.hp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 2.0.hp,),
                    Row(
                      children: [
                        SizedBox(width: 2.0.wp,),
                        const Icon(Icons.phone_android, size: 30,),
                        SizedBox(width: 2.0.wp,),
                        Text(
                          'Phone number',
                          style: TextStyle(
                            fontSize: 13.0.sp,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 4.0.hp,
                      width: 90.0.wp,
                      margin: EdgeInsets.symmetric(horizontal: 11.0.wp),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))
                      ),
                      child: Text(
                        controller.user.value!.phone,
                        style: TextStyle(
                          fontSize: 11.0.sp,
                          color: const Color.fromARGB(255, 178, 177, 177)
                        ),
                      ),
                    ),

                    SizedBox(height: 2.0.hp,),
                    Row(
                      children: [
                        SizedBox(width: 2.0.wp,),
                        const Icon(Icons.book_outlined, size: 30,),
                        SizedBox(width: 2.0.wp,),
                        Text(
                          'Amount comic owned',
                          style: TextStyle(
                            fontSize: 13.0.sp,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 4.0.hp,
                      width: 90.0.wp,
                      margin: EdgeInsets.symmetric(horizontal: 11.0.wp),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))
                      ),
                      child: Text(
                        '${controller.user.value!.amountComic} comics',
                        style: TextStyle(
                          fontSize: 11.0.sp,
                          color: const Color.fromARGB(255, 178, 177, 177)
                        ),
                      ),
                    ),

                    SizedBox(height: 2.0.hp,),
                    Row(
                      children: [
                        SizedBox(width: 2.0.wp,),
                        const Icon(Icons.collections_bookmark_outlined, size: 30,),
                        SizedBox(width: 2.0.wp,),
                        Text(
                          'Amount comic shared',
                          style: TextStyle(
                            fontSize: 13.0.sp,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 4.0.hp,
                      width: 90.0.wp,
                      margin: EdgeInsets.symmetric(horizontal: 11.0.wp),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))
                      ),
                      child: Text(
                        '${controller.user.value!.cntToShared} comics',
                        style: TextStyle(
                          fontSize: 11.0.sp,
                          color: const Color.fromARGB(255, 178, 177, 177)
                        ),
                      ),
                    ),

                    SizedBox(height: 2.0.hp,),
                    Row(
                      children: [
                        SizedBox(width: 2.0.wp,),
                        const Icon(Icons.group_outlined, size: 30,),
                        SizedBox(width: 2.0.wp,),
                        Text(
                          'Friends',
                          style: TextStyle(
                            fontSize: 13.0.sp,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 4.0.hp,
                      width: 90.0.wp,
                      margin: EdgeInsets.symmetric(horizontal: 11.0.wp),
                      child: Text(
                        '${controller.user.value!.cntFriend} friends',
                        style: TextStyle(
                          fontSize: 11.0.sp,
                          color: const Color.fromARGB(255, 178, 177, 177)
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 2.0.hp,),
              Text(
                'Actions',
                style: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 2.0.hp,),
              Container(
                height: 25.0.hp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 2.0.hp,),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 3.0.wp),
                          child: Image.asset('assets/images/icon_vip.png', height: 30,),
                        ),
                        SizedBox(width: 2.0.wp,),
                        Container(
                          height: 5.0.hp,
                          width: 65.0.wp,
                          padding: EdgeInsets.only(top: 1.0.hp, right: 10.0.wp,bottom: 1.6.hp),
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1))
                          ),
                          child: Text(
                            'Up to vip member',
                            style: TextStyle(
                              fontSize: 13.0.sp,
                            ),
                          )
                        )
                      ]
                    ),

                    SizedBox(height: 2.0.hp,),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouterNavigation.resetPass);
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 3.0.wp),
                            child:const Icon(Icons.key, size: 30,),
                          ),
                          SizedBox(width: 2.0.wp,),
                          Container(
                            height: 5.0.hp,
                            width: 65.0.wp,
                            padding: EdgeInsets.only(top: 1.0.hp, right: 10.0.wp,bottom: 1.6.hp),
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1))
                            ),
                            child: Text(
                              'Reset password',
                              style: TextStyle(
                                fontSize: 13.0.sp,
                              ),
                            )
                          )
                        ]
                      ),
                    ),
                    SizedBox(height: 2.0.hp,),
                    InkWell(
                      onTap: () {
                        Get.find<HomeController>().logout();
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 3.0.wp),
                            child: const Icon(Icons.logout, size: 30,),
                          ),
                          SizedBox(width: 2.0.wp,),
                          Container(
                            height: 5.0.hp,
                            width: 65.0.wp,
                            padding: EdgeInsets.only(top: 1.0.hp, right: 10.0.wp,bottom: 1.6.hp),
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1))
                            ),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 13.0.sp,
                              ),
                            )
                          )
                        ]
                      ),
                    )
                  ],
                ),
              )
            ]
          ),
        )
      ),
    );
  }

}