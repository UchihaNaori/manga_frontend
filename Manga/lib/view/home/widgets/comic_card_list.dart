import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/data/comic.dart';
import '../../../common/utils/extensions.dart';

class ComicCardList extends GetView {
  final Comic comic;
  Function onTapCard;
  ComicCardList({required this.comic, required this.onTapCard});
  @override
  Widget build(BuildContext context) {
     return InkWell(
      onTap: () {
        onTapCard();
      },
      child: Container(
        height: 18.0.hp,
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 2.0.hp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0.wp),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    comic.image,
                    height: 15.0.hp,
                    width: 20.0.wp,
                    fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 5.0.wp,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                  width: 60.0.wp,
                  child: Text(
                    comic.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.0.sp,
                      fontWeight: FontWeight.bold,

                    ),
                  ),),
                  SizedBox(height: 1.0.hp,),
                  Wrap(
                    direction: Axis.horizontal,
                    children:
                    (comic.listCategory.length > 3) ?
                    <Widget>[
                      CategoryButton(comic.listCategory[0]),
                      CategoryButton(comic.listCategory[1]),
                      CategoryButton(comic.listCategory[2]),
                    ]
                    : comic.listCategory.map((e) => CategoryButton(e)).toList()
                  ),
                  SizedBox(height: 1.0.hp,),
                  Text(
                    'by ${comic.author}',
                    style: TextStyle(
                      fontSize: 10.0.sp,
                      color: const Color.fromARGB(255, 178, 177, 177)
                    ),
                  ),
                  SizedBox(height: 1.0.hp,),
                  Text(
                    comic.last_chapter,
                    style: TextStyle(
                      fontSize: 10.0.sp,
                      color: const Color.fromARGB(255, 178, 177, 177)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  Widget CategoryButton(String name) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        margin: EdgeInsets.only(right: 1.0.wp),
        padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
        // height: 3.0.hp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(249, 204, 201, 201)
        ),
        child: Center(
          heightFactor: 1.2,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 10.0.sp,
              color: const Color.fromARGB(255, 97, 96, 96)
            ),
          ),
        )
      ),
    );
  }

}