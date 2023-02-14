import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/common/utils/extensions.dart';
import 'package:manga_read/controller/detail_controller.dart';
import 'package:manga_read/controller/read_controller.dart';
import 'package:manga_read/controller/recent_controller.dart';
import 'package:manga_read/data/chapter.dart';
import 'package:manga_read/view/page_turn/page_turn.dart';
import 'package:manga_read/view/read_comic/widgets/appbar.dart';
import 'package:manga_read/view/read_comic/widgets/chapter.dart';

class ReadComicChap extends GetView<ReadComicController> {
  DetailController detailC = Get.find();
  @override
  Widget build(BuildContext context) {
    GlobalKey<PageTurnState> _controller = GlobalKey<PageTurnState>();
    return Scaffold(
      body: Column(
        children: [
          GetX<ReadComicController>(builder: (controller) =>
            controller.showAppBar.value ? AppBarComic(chapter: controller.chapter.value!.chapter,isChapter: true,) : Container()
          ),
          GetBuilder<ReadComicController> (builder: (controller) =>
            controller.links.isNotEmpty?
            Expanded(
              child: InkWell(
                onDoubleTap:() {
                  controller.setShowAppBar();
                },
                child: !controller.isPageTurnView.value ?  ListView.builder(
                  itemCount: controller.links.length -1 ,
                  itemBuilder: (context, index) {
                    return Image.network(controller.links[index], fit: BoxFit.cover,);
                  },
                )
                : PageTurn(
                  key: _controller,
                  children: [
                    ...controller.links.map((e) => Image.network(e, fit: BoxFit.fitWidth,).image).toList()
                  ],
                  lastPage: Container(),
                ),
              )
            ):Container()
          ),
          GetBuilder<ReadComicController>(builder: (controller) =>
            controller.showAppBar.value ?
            Container(
              height: 6.0.hp,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if (controller.indexInVolume > 0) {
                        controller.setIndexInVolume(controller.indexInVolume - 1);
                        controller.setContent(detailC.chapters.indexOf(controller.chapters[controller.indexInVolume]));
                      }
                    },
                    icon: Icon(Icons.arrow_back, size: 30,color: controller.indexInVolume > 0 ? Colors.black : const Color.fromARGB(255, 97, 97, 96),)
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                          context: context,
                          shape:const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                          ),
                          builder: (BuildContext context) {
                            List<Chapter> chaps = detailC.getChaptersInVolume(controller.volume);
                            return Container(
                              height: 30.0.hp,
                              child: Column(
                                children: [
                                  Container(
                                    height: 5.0.hp,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // IconButton(
                                        //   onPressed: () {
                                        //     int indexVolume = detailC.volumes.indexOf(controller.volume);
                                        //     if (indexVolume > 0) {
                                        //       controller.setVolume(detailC.volumes[indexVolume-1]);
                                        //       print(controller.volume.id);
                                        //     }
                                        //   },
                                        //   icon: Icon(Icons.arrow_back, size: 20,color: detailC.volumes.indexOf(controller.volume) > 0 ? Colors.black : const Color.fromARGB(255, 97, 97, 96),)
                                        // ),
                                        SizedBox(
                                          width: 70.0.wp,
                                          child: Center(
                                            child: Text(
                                              'Volume ${controller.volume.chapter} - ${controller.volume.name}',
                                              style: TextStyle(
                                                fontSize: 13.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ),
                                        ),
                                        // IconButton(
                                        //   onPressed: () {
                                        //     int indexVolume = detailC.volumes.indexOf(controller.volume);
                                        //     if (indexVolume <= detailC.volumes.length - 1) {
                                        //       controller.setVolume(detailC.volumes[indexVolume + 1]);
                                        //       print(controller.volume.id);
                                        //     }
                                        //   },
                                        //   icon: Icon(Icons.arrow_forward, size: 20, color: detailC.volumes.indexOf(controller.volume) <= detailC.volumes.length - 1 ? Colors.black : const Color.fromARGB(255, 97, 97, 96))
                                        // )
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 1.0.hp),
                                    itemCount: chaps.length,
                                    shrinkWrap: true,
                                    itemBuilder:  (context, index) =>
                                    InkWell(
                                      onTap: () {
                                        controller.setContent(detailC.chapters.indexOf(chaps[index]));
                                        Navigator.of(context).pop();
                                      },
                                      child: ChapterUI(
                                        chapter: chaps[index]
                                      ),
                                    )
                                  )
                                ],
                              )
                            );
                          }
                        );
                        },
                        icon:const Icon(Icons.format_list_bulleted, size: 30, )
                      ),
                      GetX<DetailController>(builder:(controller) =>
                        IconButton(
                          onPressed: () {
                            controller.selectFavoriteComic();
                          },
                          icon:Icon(Icons.favorite, size: 30,color: controller.isFavorite.value? Colors.red : const Color.fromARGB(255, 187, 184, 184))
                        )
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      if (controller.indexInVolume < controller.chapters.length -1) {
                        controller.setIndexInVolume(controller.indexInVolume + 1);
                        controller.setContent(detailC.chapters.indexOf(controller.chapters[controller.indexInVolume]));
                        //Get.find<RecentController>().updateRecent(detailC.comicD, detailC.chapters[controller.chapterIndex], detailC.recentVolume.value!.id);
                      }
                    },
                    icon: Icon(Icons.arrow_forward, size: 30, color: controller.indexInVolume < controller.chapters.length - 1 ? Colors.black : const Color.fromARGB(255, 97, 97, 96))
                  )
                ]
              ),
            ): Container()
          )
        ],
      )
    );
  }

}