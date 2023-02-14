import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manga_read/controller/detail_controller.dart';
import 'package:manga_read/routers/router.dart';
import 'package:manga_read/view/detail/widgets/chapters.dart';
import 'package:manga_read/view/detail/widgets/information.dart';
import 'package:manga_read/view/detail/widgets/volumes.dart';
import '../../common/utils/extensions.dart';
import 'package:blur/blur.dart';

import '../../data/chapter.dart';

class Detail extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios_new_outlined, color: Color.fromRGBO(97, 67, 133, 1),),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          controller.comicD.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.0.sp,
            color:const Color.fromRGBO(97, 67, 133, 1)
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Blur(
            blur: 2.5,
            child: Image.network(controller.comicD.coverImage, fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.0.hp),
            height: 67.0.hp,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              color: Colors.white,
            ),
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0.hp,),
                  Center(
                    heightFactor: 1,
                    child: Container(
                      height: 5.0.hp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.1)),
                        color: Colors.white,
                        boxShadow: const[
                          BoxShadow(
                            color: Color.fromARGB(255, 231, 228, 228),
                            blurRadius: 5.0,
                            spreadRadius: 2,
                            offset: Offset(0.0,1.0)
                          )
                        ]
                      ),
                      child: GetX<DetailController>(builder: (controller) =>
                        Row(
                          children: [
                            Container(
                              width: 41.5.wp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: controller.showInfor.value == 0 ? const Color.fromRGBO(97, 67, 133, 1) : Colors.white,
                              ),
                              child: TextButton(
                                child: Text(
                                  'Information',
                                  style: TextStyle(
                                    fontSize: 13.0.sp,
                                    color: controller.showInfor.value == 0 ? Colors.white : const Color.fromRGBO(97, 67, 133, 1)
                                  ),
                                ),
                                onPressed: () {
                                  controller.setShowInfor(0);
                                },
                              ),
                            ),

                            Container(
                              width: 41.5.wp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: controller.showInfor.value == 1 ? const Color.fromRGBO(97, 67, 133, 1): Colors.white
                              ),
                              child: TextButton(
                                child: Text(
                                  'Volume',
                                  style: TextStyle(
                                    fontSize: 13.0.sp,
                                    color:controller.showInfor.value == 1 ? Colors.white :  const Color.fromRGBO(97, 67, 133, 1)
                                  ),
                                ),
                                onPressed: () {
                                  controller.setShowInfor(1);
                                },
                              ),

                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 2.0.hp,),

                  Center(
                    heightFactor: 1,
                    child: Text(
                     controller.comicD.name,
                      style: TextStyle(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0.hp),
                  GetBuilder<DetailController>(builder: (controller) {
                    if (controller.showInfor.value == 0) {
                      return Information();
                    }
                    return Expanded(
                      child:ListView(
                        shrinkWrap: true,
                        physics:const BouncingScrollPhysics(),
                        children: [
                          ...controller.volumes.map((element) =>
                            InkWell(
                              onTap: () {
                                // Get.toNamed(RouterNavigation.read, arguments: {'chapter': controller.chapters.indexOf(element), 'isChapter': true});
                                // controller.onTapChapterCard(element.chapter);
                                controller.onTapVolumeCard(element);
                              },
                              child: ChapterCard(chapter: element, showChapter: controller.mapVolumes[element].length > 0, chapters: controller.mapVolumes[element],),
                            )
                          ).toList()
                        ],
                      )
                    );
                  },)
                ],
              )
            )
          ),
          Center(
            heightFactor: 1,
            child:  ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                    controller.comicD.image,
                    height: 30.0.hp,
                    width: 50.0.wp,
                ),
              ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 7.0.wp),
        width: 100.0.wp,
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child:GetBuilder<DetailController>(builder: (controller) =>
                IconButton(
                  icon: controller.comicD.isShared == 1 ? Image.asset('assets/images/accept.png', height: 35, fit: BoxFit.fitHeight,):Icon(Icons.favorite, color: controller.isFavorite.value? Colors.red :Color.fromARGB(255, 187, 184, 184) ,size: 32,),
                  onPressed: () {
                    (controller.comicD.isShared ==1 ) ? controller.acceptShare() :controller.selectFavoriteComic();
                  },
                ),
              ),
            ),
            SizedBox(width: 3.0.wp,),
            Flexible(
              flex: 2,
              child: GetBuilder<DetailController>(builder: (controller) =>
                IconButton(
                  onPressed: () {
                    controller.comicD.isShared == 1 ? controller.unaccpetShare() : Get.toNamed(RouterNavigation.share, arguments: controller.comicD.id);
                  },
                  icon:controller.comicD.isShared == 1? Image.asset('assets/images/close.png', height: 35, fit: BoxFit.fitHeight,) : Icon(Icons.share_outlined, color: Color.fromARGB(255, 187, 184, 184), size: 32,),
                )
              )
            ),
            SizedBox(width: 3.0.wp,),
            Flexible(
              flex: 15,
              child: GetBuilder<DetailController>(builder: (controller) =>
                InkWell(
                  onTap: () {
                    if (controller.recentChapter.value != null) {
                      Get.toNamed(RouterNavigation.read, arguments: {'chapter': controller.chapters.indexOf(controller.recentChapter.value), 'volume': controller.recentVolume.value});
                    } else {
                      if (controller.chapters.isNotEmpty) {
                        Chapter volume = controller.getVolume(controller.chapters[0]);
                        Get.toNamed(RouterNavigation.read, arguments: {'chapter': 0, 'volume': volume});
                        controller.onTapChapterCard(controller.chapters[0], volume.chapter);
                      }
                    }
                  },
                  child: Container(
                    height: 5.0.hp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromRGBO(97, 67, 133, 1)
                    ),
                    child: Center(
                      child: Text(
                        controller.recentChapter.value == null? 'Start read' : 'Chapter ${controller.recentChapter.value!.chapter} - Volume ${controller.recentVolume.value!.chapter}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0.sp,
                        ),
                      ),
                    )
                  ),
                )
              )
            )
          ],
        ),
      )
    );
  }

}