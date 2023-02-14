import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/detail_controller.dart';
import 'package:readmore/readmore.dart';
import '../../../common/utils/extensions.dart';
import '../../../common/values/const.dart';

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
            ),


            if (controller.comicD.isShared != 0)Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.0.hp),
                Text(
                  'Owner',
                  style: TextStyle(
                    fontSize: 13.0.sp,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: 1.0.hp,),
                if (controller.owner.value != null)
                Container(
                height: 10.0.hp,
                decoration: BoxDecoration(
                  color: Constant.mainColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: const Color.fromARGB(255, 178, 177, 177))
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 56,
                      backgroundColor: Constant.mainColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.0.hp),// Border radius
                        child: ClipOval(child: Image.network(controller.owner.value!.image)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.owner.value!.name,
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 2.0.hp,),
                        Text(
                          controller.owner.value!.email,
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            color: Colors.white
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              ],
            )
          ],
        )
      ):
      Container();
    }
    );
  }

}