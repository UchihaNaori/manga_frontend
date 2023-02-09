import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/favorite_controller.dart';
import 'package:manga_read/view/bookcase/favorite/favorite.dart';
import 'package:manga_read/view/bookcase/recent/recent.dart';
import '../../common/utils/extensions.dart';
import '../../common/values/const.dart';

class BookcaseUI extends StatelessWidget {
  PageController pageC = PageController();
  FavoriteController favoriteC = Get.find();

  void nextPage(int page) {
    pageC.animateToPage(
      page,
      duration:const Duration(milliseconds: 500),
      curve: Curves.easeInOut
    );
  }
  @override
  Widget build(BuildContext context) {
    favoriteC.setIsFavoriteView(true);
     return Scaffold(
      // appBar:  AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   title: Text(
      //     'Bookcase',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 13.0.sp,
      //       color:const Color.fromRGBO(97, 67, 133, 1)
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Container(
            color: Constant.mainColor,
            height: 7.0.hp,
            padding: EdgeInsets.only(bottom: 1.0.wp),
            child:GetX<FavoriteController>(builder: (controller) =>
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.setIsFavoriteView(true);
                      nextPage(0);
                    },
                    child: Container(
                      width: 50.0.wp,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: controller.isFavoriteView.value ? Colors.white : Constant.mainColor, width: 3))
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 25.0.wp,
                          child: Row(
                            children: [
                              const Icon(Icons.favorite, size: 25, color: Colors.white,),
                              SizedBox(width: 1.0.wp,),
                              Text(
                                'Favorite',
                                style: TextStyle(
                                  fontSize: 13.0.sp,
                                  color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      nextPage(1);
                      controller.setIsFavoriteView(false);
                    },
                    child: Container(
                      width: 50.0.wp,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: controller.isFavoriteView.value ? Constant.mainColor : Colors.white, width: 3))
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 25.0.wp,
                          child: Row(
                            children: [
                              const Icon(Icons.watch_later, size: 25, color: Colors.white,),
                              SizedBox(width: 1.0.wp,),
                              Text(
                                'Recent',
                                style: TextStyle(
                                  fontSize: 13.0.sp,
                                  color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    )
                  )
                ],
              )
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageC,
            onPageChanged: (int? value) {
              if (value == 0) {
                favoriteC.setIsFavoriteView(true);
              } else {
                favoriteC.setIsFavoriteView(false);
              }
            },
            children: [
              FavoriteComic(),
              RecentComic()
            ],
          )
          )
        ],
      ),
     );
  }

}