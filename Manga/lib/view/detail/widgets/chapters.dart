import 'package:flutter/material.dart';
import '../../../common/utils/extensions.dart';
import 'package:get/get.dart';
import '../../../controller/detail_controller.dart';
import '../../../data/chapter.dart';
import '../../../common/values/const.dart';
import '../../../routers/router.dart';

class ChapterCard extends GetView {
  DetailController detailC = Get.find();
  final Chapter chapter;
  bool showChapter;
  List<Chapter> chapters;
  ChapterCard({required this.chapter, required this.showChapter, required this.chapters});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: showChapter ? 4.0.hp + 4.0.hp * chapters.length : 4.0.hp,
      margin: EdgeInsets.only(bottom: 1.0.hp),
      decoration:const BoxDecoration(
        border: Border(left: BorderSide(color: Color.fromARGB(255, 187, 184, 184), width: 5), bottom: BorderSide(color: Color.fromARGB(255, 187, 184, 184), width: 0.5)),
        color: Colors.white
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 3.0.wp,),
              Text(
                'Volume ${chapter.chapter}',
                style: TextStyle(
                  fontSize: 13.0.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 3.0.wp,),
              SizedBox(
                width: chapter.isRecent ? 52.0.wp : 55.0.wp,
                child: Text(
                chapter.name,
                style: TextStyle(
                    fontSize: 13.0.sp,
                    color: const Color.fromARGB(255, 97, 97, 96),
                    overflow: TextOverflow.ellipsis
                  ),
                ),
              ),
              if (chapter.isRecent) const Icon(Icons.bookmark, color: Constant.mainColor,size: 25,)
            ],
          ),

          if (showChapter)...chapters.map((e) => chapterInVolume(e))
        ]
      )
    );
  }

  Widget chapterInVolume(Chapter chap) {
    DetailController detailC = Get.find();
    return InkWell(
      onTap: () {
        Get.toNamed(RouterNavigation.read, arguments: {'chapter': detailC.chapters.indexOf(chap), 'volume': chapter});
        // detailC.onTapChapterCard(chap, chapter.chapter);
      },
      child: Container(
        height: 4.0.hp,
        child: Row(
          children: [
            SizedBox(width: 5.0.wp,),
            Container(
              width: 2.0.wp,
              height: 2.0.wp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0.wp),
                color: Colors.black
              ),
            ),
            SizedBox(width: 3.0.wp,),
            Text(
              'Chapter ${chap.chapter}',
              style: TextStyle(
                fontSize: 13.0.sp,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 3.0.wp,),
            SizedBox(
              width: chap.isRecent ? 42.0.wp : 45.0.wp,
              child: Text(
              chap.name,
              style: TextStyle(
                  fontSize: 13.0.sp,
                  color: const Color.fromARGB(255, 97, 97, 96),
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
            if (chap.isRecent) const Icon(Icons.book_outlined, color: Constant.mainColor,size: 25,)
          ],
        ),
      )
    );
  }
}