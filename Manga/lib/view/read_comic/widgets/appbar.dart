import 'package:flutter/material.dart';
import 'package:manga_read/data/chapter.dart';
import '../../../common/utils/extensions.dart';
import '../../../common/values/const.dart';
import 'package:get/get.dart';
import '../../../common/values/const.dart';
import '../../../controller/read_controller.dart';

class AppBarComic extends StatelessWidget {
  final int chapter;
  bool isChapter;
  AppBarComic({required this.chapter, required this.isChapter});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon:const Icon(Icons.chevron_left_outlined, color: Color.fromRGBO(97, 67, 133, 1),),
        onPressed:() {
          Get.back();
        },
      ),
      title: Text(
        isChapter? 'Chapter $chapter' : 'Volume $chapter',
        style: TextStyle(
          fontSize: 13.0.sp,
          fontWeight: FontWeight.bold,
          color: Constant.mainColor
        ),
      ),
      centerTitle: true,
      actions: [
        GetX<ReadComicController>(builder: ((controller) =>
        IconButton(
          onPressed: () {
            controller.setIsPageTurnView();
          },
          icon:
            Icon(!controller.isPageTurnView.value ? Icons.playlist_play_rounded : Icons.menu_book, size: 30, color: Constant.mainColor,)
          ))
        )
      ],
    );
  }

}