import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/values/const.dart';
import '../../controller/detail_controller.dart';
import '../page_turn/page_turn.dart';
import './widgets/appbar.dart';
import '../../controller/read_controller.dart';
import '../../common/utils/extensions.dart';

class ReadVolumeChapter extends StatelessWidget {
  DetailController detailC = Get.find();
  @override
  Widget build(BuildContext context) {
    final _controller = GlobalKey<PageTurnState>();
    return Scaffold(
      body: Column(
        children: [
          GetX<ReadComicController>(builder: (controller) =>
            controller.showAppBar.value ? AppBarComic(chapter: controller.chapter.value!.chapter, isChapter: false,) : Container()
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
              : PageTurn(
                key: _controller,
                children: [
                  ...controller.links.map((e) => NetworkImage(e)).toList()
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
                        controller.setContentVolume(controller.chapterIndex - 1);
                      }
                    },
                    icon: Icon(Icons.arrow_back, size: 30,color: controller.chapterIndex > 0 ? Colors.black : const Color.fromARGB(255, 97, 97, 96),)
                  ),
                  SizedBox(
                    width: 75.0.wp,
                    child: Center(
                      child: Text(
                        controller.chapName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.bold,
                            color: Constant.mainColor
                        ),
                      ),
                    )
                  ),
                  IconButton(
                    onPressed: () {
                      if (controller.chapterIndex < controller.chapter.value!.listPaths.length - 1) {
                        controller.setContentVolume(controller.chapterIndex + 1);
                      }
                    },
                    icon: Icon(Icons.arrow_forward, size: 30, color: controller.chapterIndex <  controller.chapter.value!.listPaths.length - 1 ? Colors.black : const Color.fromARGB(255, 97, 97, 96))
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