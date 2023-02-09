import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/common/utils/extensions.dart';
import 'package:manga_read/controller/detail_controller.dart';
import 'package:manga_read/controller/read_controller.dart';
import 'package:manga_read/controller/recent_controller.dart';
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
            Expanded(child:
             InkWell(
              onDoubleTap:() {
                controller.setShowAppBar();
              },
              child: !controller.isPageTurnView.value ?  ListView(
                children: [
                  ...controller.links.map((e) => Image.network(e, fit: BoxFit.cover,)).toList()
                ],
              )
              // child: PageView(
              //   children: [...controller.links.map((e) => Image.network(e, fit: BoxFit.cover,)).toList()],
              // )
              : PageTurn(
                key: _controller,
                children: [
                  ...controller.links.map((e) => Image.network(e, fit: BoxFit.fitWidth,).image).toList()
                ],
                lastPage: Container(),
              ),
            )
            )
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
                      if (controller.chapterIndex > 0) {
                        controller.setContent(controller.chapterIndex - 1);
                      }
                    },
                    icon: Icon(Icons.arrow_back, size: 30,color: controller.chapterIndex > 0 ? Colors.black : const Color.fromARGB(255, 97, 97, 96),)
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
                            return Container(
                              height: 30.0.hp,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 1.0.hp),
                                itemCount: detailC.chapters.length,
                                shrinkWrap: true,
                                itemBuilder:  (context, index) =>
                                InkWell(
                                  onTap: () {
                                    controller.setContent(index);
                                    Navigator.of(context).pop();
                                  },
                                  child: ChapterUI(
                                    chapter: detailC.chapters[index]
                                  ),

                                )
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
                      if (controller.chapterIndex < detailC.chapters.length -1) {
                        controller.setContent(controller.chapterIndex + 1);
                        Get.find<RecentController>().updateRecent(detailC.comicD, detailC.chapters[controller.chapterIndex].chapter);
                      }
                    },
                    icon: Icon(Icons.arrow_forward, size: 30, color: controller.chapterIndex < detailC.chapters.length - 1 ? Colors.black : const Color.fromARGB(255, 97, 97, 96))
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