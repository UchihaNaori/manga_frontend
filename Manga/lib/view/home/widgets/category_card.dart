import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/home_controller.dart';
import '../../../common/utils/extensions.dart';
import '../../../data/category.dart';

class CategoryCard extends GetView {
  final Category category;
  CategoryCard({required this.category});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 0.0.wp),
      child: GetX<HomeController>(builder: (controller) =>
        Container(
          width: 25.0.wp,
          height: 2.0.hp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: (controller.selectCategoryId.value == category.id) ? const Color.fromRGBO(97, 67, 133, 1) : Colors.white,
          ),
          child:TextButton(
              child: Text(
                category.title,
                style: TextStyle(
                  fontSize: 11.0.sp,
                  color: (controller.selectCategoryId.value == category.id) ? Colors.white : Colors.black
                ),
              ),
              onPressed: () {
                controller.setSelectCategoryId(category.id, category.title);
              },
            )
        )
      ,)
      );
  }

}