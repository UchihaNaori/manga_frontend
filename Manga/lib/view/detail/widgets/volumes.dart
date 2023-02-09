import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/detail_controller.dart';
import 'package:manga_read/view/widgets/message.dart';
import 'volume_card.dart';
import '../../../routers/router.dart';

class Volume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<DetailController>(builder: (controller) =>
      Expanded(
        child: controller.mapVolumes.isNotEmpty?
        ListView(
          shrinkWrap: true,
          physics:const BouncingScrollPhysics(),
          children: [
            ...controller.volumes.map((element) =>
              InkWell(
                onTap: () {
                  controller.onTapVolumeCard(element);
                },
                child: VolumeCard(chapter: element, showChap: () {
                  controller.onTapVolumeCard(element);
                }, showChapters: controller.mapVolumes[element],),
              )
            ).toList()
          ],
        ): Message(message: 'Your comic \n haven\'t \n volume')
      )
    );
  }
}