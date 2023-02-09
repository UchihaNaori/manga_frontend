import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/data/comic.dart';
import '../../../common/utils/extensions.dart';

class ComicCard extends GetView {
  final Comic comic;
  ComicCard({required this.comic});
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
              comic.image.toString(),
              height: 18.0.hp,
              width: 30.0.wp,
          ),
        ),
        SizedBox(height: 1.0.hp,),
        Container(
          width: 28.0.wp,
 //         height: 6.0.hp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:const Color.fromRGBO(97, 67, 133, 1),
            boxShadow:const [
              BoxShadow(
                color: Color.fromARGB(255, 231, 228, 228),
                blurRadius: 8.0,
                spreadRadius: 2,
                blurStyle: BlurStyle.solid,
                offset: Offset(
                  0.0,
                  3.0, // Move to bottom 8.0 Vertically
                )
              )
            ]
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.0.wp, right: 3.0.wp, top: 0.5.hp),
                child: Text(
                comic.name.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.0.sp,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 0.5.hp,),
              Text(
                comic.last_chapter,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.0.sp
                ),
              )
            ],
          ),
        ),
 //       SizedBox(height: 3.0.hp,)
        ]
      );
  }

}