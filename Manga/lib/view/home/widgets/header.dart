import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/values/const.dart';
import 'package:manga_read/controller/home_controller.dart';
import '../../../common/utils/extensions.dart';
import '../../../common/values/icons.dart';
import '../../widgets/search_comic.dart';

class Header extends GetView {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // leading:IconButton(
      //   onPressed: () {
      //     showSearch(context: context, delegate: SearchComic());
      //   },
      //   icon: const Icon(Icons.search, color: Constant.mainColor, size: 40)
      // ),
      actions: [
        GetX<HomeController>(builder: (controller) =>
        TextButton(
          child: Icon(controller.isShowGrid.value ? Icons.grid_view_outlined : Icons.format_list_bulleted, color: Constant.mainColor, size: 32,),
          onPressed: () {
            controller.setIsShowGrid();
          },
        )
        ,),
      ],
    );
  }

}