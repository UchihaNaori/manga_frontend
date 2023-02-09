import 'package:flutter/material.dart';
import '../../../common/utils/extensions.dart';
import 'package:get/get.dart';
import '../../../data/chapter.dart';
import '../../../common/values/const.dart';

class ChapterCard extends GetView {
  final Chapter chapter;
  ChapterCard({required this.chapter});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0.hp,
      margin: EdgeInsets.only(bottom: 0.5.hp),
      decoration:const BoxDecoration(
        border: Border(left: BorderSide(color: Color.fromARGB(255, 187, 184, 184), width: 5), bottom: BorderSide(color: Color.fromARGB(255, 187, 184, 184), width: 0.5)),
        color: Colors.white
      ),
      child: Row(
        children: [
          SizedBox(width: 3.0.wp,),
          Text(
            'Chapter ${chapter.chapter}',
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
          if (chapter.isRecent) const Icon(Icons.book_outlined, color: Constant.mainColor,size: 25,)

        ],
      ),
    );
  }

}