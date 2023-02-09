import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/detail_controller.dart';
import 'package:readmore/readmore.dart';
import '../../../common/utils/extensions.dart';

class Information extends GetView {
  DetailController detailController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetX<DetailController>(builder: (controller) {
      if (controller.isLoading.value) {
        EasyLoading.show(status: 'loading');
      } else {
        EasyLoading.dismiss();
      }
      // ignore: unnecessary_null_comparison
      return (detailController.comicD != null) ?
        Expanded(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Author',
              style: TextStyle(
                fontSize: 13.0.sp,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 1.0.hp,),
            Text(
              detailController.comicD.author,
              style: TextStyle(
                fontSize: 11.0.sp,
              ),
            ),
            SizedBox(height: 3.0.hp,),
            Text(
              'Status',
              style: TextStyle(
                fontSize: 13.0.sp,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 1.0.hp,),
            Text(
              'Progression',
              style: TextStyle(
                fontSize: 11.0.sp,
              ),
            ),
            SizedBox(height: 3.0.hp,),
            Text(
              'Last Chapter',
              style: TextStyle(
                fontSize: 13.0.sp,
                fontWeight: FontWeight.bold
              )
            ),

            SizedBox(height: 1.0.hp,),
            Text(
              controller.comicD.last_chapter,
              maxLines: 2,
              style: TextStyle(
                fontSize: 11.0.sp
              )
            ),

            SizedBox(height: 3.0.hp,),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 13.0.sp,
                fontWeight: FontWeight.bold
              )
            ),

            SizedBox(height: 1.0.hp,),
            Text(
              detailController.comicD.listCategory.join(', '),
              maxLines: 2,
              style: TextStyle(
                fontSize: 11.0.sp
              )
            ),
            SizedBox(height: 3.0.hp),
            Text(
              'Content',
              style: TextStyle(
                fontSize: 13.0.sp,
                fontWeight: FontWeight.bold
              )
            ),

            SizedBox(height: 1.0.hp,),

            ReadMoreText(
              detailController.comicD.introductionContent,
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'More',
              trimExpandedText: ' Less',
              moreStyle: TextStyle(
                fontSize: 11.0.sp,
                fontWeight: FontWeight.bold
              ),
              lessStyle: TextStyle(
                fontSize: 11.0.sp,
                fontWeight: FontWeight.bold
              ),
            )

          ],
        )
      ):
      Container();
    }
    );
  }

}