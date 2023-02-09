import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/favorite_controller.dart';
import 'package:manga_read/view/home/widgets/comic_card_list.dart';
import '../../../common/utils/extensions.dart';
import '../../../routers/router.dart';

class FavoriteComic extends GetView {
  @override
  Widget build(BuildContext context) {
     return Container(
      color: Colors.white,
     child:Column(
      children: [
        // AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        //   leading: IconButton(
        //     icon:const Icon(Icons.arrow_back_ios_new_outlined, color: Color.fromRGBO(97, 67, 133, 1),),
        //     onPressed: () {
        //       Get.back();
        //     },
        //   ),
        //   title: Text(
        //     'List favorite',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 13.0.sp,
        //       color:const Color.fromRGBO(97, 67, 133, 1)
        //     ),
        //   ),
        //   centerTitle: true,
        // ),
        Container(
          padding: EdgeInsets.only(top: 2.0.hp, left: 6.0.wp, right: 6.0.wp),
          color: Colors.white,
          child: GetBuilder<FavoriteController>(builder: (controller) {
            if (controller.isLoading.value) {
              EasyLoading.show(status: 'loading...');
            } else {
              EasyLoading.dismiss();
            }
            if (controller.favoriteComics.isNotEmpty) {
              return ListView(
                shrinkWrap: true,
                children: [
                  ...controller.favoriteComics.map((e) => ComicCardList(comic: e, onTapCard: () {
                    Get.toNamed(RouterNavigation.detail, arguments: e);
                  },))
                ]
              );
            }
            return Center(
                child: Text(
                'Your favorite comic is empty',
                style: TextStyle(
                  fontSize: 13.0.sp,
                  color:const Color.fromARGB(255, 225, 225, 224)
                ),
              )
            );
          },),
        )
      ]
     ));
  }

}