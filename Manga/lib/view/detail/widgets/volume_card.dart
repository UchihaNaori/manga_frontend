import 'package:flutter/material.dart';
import 'package:manga_read/controller/detail_controller.dart';
import 'package:manga_read/routers/router.dart';
import '../../../common/utils/extensions.dart';
import '../../../data/chapter.dart';
import 'package:get/get.dart';

class VolumeCard extends StatelessWidget {
  Function showChap;
  Chapter chapter;
  bool showChapters;
  VolumeCard({required this.chapter,required this.showChap, required this.showChapters});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: showChapters ? 6.0.hp + 4.0.hp * chapter.listPaths.length : 6.0.hp,
      decoration:const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color.fromARGB(255, 187, 184, 184), width: 0.5)),
        color: Colors.white
      ),
      child: Column(
        children: [
          Row(
            children: [
              // const Icon(Icons.collections_bookmark_outlined, size: 32),
              // SizedBox(width: 2.0.wp,),
              Text(
                'Volume ${chapter.chapter}',
                style: TextStyle(
                  fontSize: 13.0.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 3.0.wp,),
              SizedBox(
                width: 51.2.wp,
                child: Text(
                chapter.name,
                style: TextStyle(
                    fontSize: 13.0.sp,
                    color: const Color.fromARGB(255, 97, 97, 96),
                    overflow: TextOverflow.ellipsis
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showChap();
                },
                icon: const Icon(Icons.arrow_right, size: 25,)
              )
            ],
          ),
          if(showChapters)...chapter.listPaths.map((e) => chapterInVolume(e.toString()))
        ],
      )
    );
  }

  Widget chapterInVolume(String path) {
    DetailController detailC = Get.find();
    List<String> arrStr = path.split('/');
    return InkWell(
      onTap: () {
        Get.toNamed(RouterNavigation.readVolume, arguments: {'volume': chapter, 'isChapter': false, 'path': path});
      },
      child: Container(
        height: 4.0.hp,
        child: Row(
          children: [
            SizedBox(width: 3.0.wp,),
            Container(
              width: 2.0.wp,
              height: 2.0.wp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0.wp),
                color: Colors.black
              ),
            ),
             SizedBox(width: 3.0.wp,),
             SizedBox(
              width: 75.0.wp,
              child: Text(
                chapter.listPaths.length == 1? 'All chap' : arrStr[arrStr.length - 1],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11.0.sp,
                  color: const Color.fromARGB(255, 97, 97, 96)
                ),
              ),
             )
          ],
        ),
      )
    );
  }

}