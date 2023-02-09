import '../../../common/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../../../common/values/const.dart';
import '../../../data/chapter.dart';

class ChapterUI extends StatelessWidget {
  final Chapter chapter;
  ChapterUI({required this.chapter});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0.hp,
      margin:const EdgeInsets.only(bottom: 10),
      decoration:const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color.fromARGB(255, 187, 184, 184), width: 0.5))
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