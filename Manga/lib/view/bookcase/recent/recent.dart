import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/favorite_controller.dart';
import 'package:manga_read/controller/recent_controller.dart';
import 'package:manga_read/view/home/widgets/comic_card_list.dart';
import '../../../../common/utils/extensions.dart';
import '../../../../data/comic.dart';
import '../../../../routers/router.dart';

class RecentComic extends GetView<RecentController> {
  @override
  Widget build(BuildContext context) {
     return Container(
      color: Colors.white,
     child:SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 2.0.hp, left: 6.0.wp, right: 6.0.wp),
          color: Colors.white,
          child: GetX<RecentController>(builder: (controller) {
            if (controller.isLoading.value) {
              EasyLoading.show(status: 'loading...');
            } else {
              EasyLoading.dismiss();
            }
            if (controller.mapRecents.isNotEmpty) {
              return ListView(
                shrinkWrap: true,
                children: recentComics()
              );
            }
            return Center(
                child: Text(
                'You haven\'t read any stories yet',
                style: TextStyle(
                  fontSize: 13.0.sp,
                  color:const Color.fromARGB(255, 225, 225, 224)
                ),
              )
            );
          },),
        )
      ]
     )));
  }

  List<Widget> recentComics() {
    List<Widget> comics = [];
    controller.mapRecents.forEach((key, value) {
      comics.add(items(key, value));
    });
    return comics;
  }

  ComicCardList items(Comic comic, String recent) {
    String latestChapter = comic.last_chapter;
    comic.last_chapter = recent;
    return ComicCardList(comic: comic, onTapCard: () {
      comic.last_chapter = latestChapter;
      Get.toNamed(RouterNavigation.detail, arguments: comic);
    });
  }
}