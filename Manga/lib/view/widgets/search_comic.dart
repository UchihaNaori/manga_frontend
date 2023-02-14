import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/controller/home_controller.dart';
import 'package:manga_read/view/home/widgets/comic_card_list.dart';
import '../../common/utils/extensions.dart';
import '../../routers/router.dart';
import './message.dart';
import '../../common/values/const.dart';

class SearchComic extends SearchDelegate {
  HomeController homeC = Get.find();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
    IconButton(
      onPressed: () {
        if(query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: const Icon(Icons.clear)
    )
  ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {

    return FutureBuilder(
      future: homeC.searchComic(query),
      builder: (context, snapshot) =>  Container(
      padding: EdgeInsets.only(top: 3.0.hp, left: 5.0.wp, right: 5.0.wp),
      color: Colors.white,
      child: homeC.searchComics.isNotEmpty?
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ComicCardList(comic: homeC.searchComics[index], onTapCard: () {
              Get.toNamed(RouterNavigation.detail, arguments: homeC.searchComics[index]);
            },);
          },
          itemCount: homeC.searchComics.length,
          physics:const BouncingScrollPhysics(),
        )
        :Message(message: 'No matching \n results found')
      //),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    int userId = GetStorage().read(Constant.KEY_USER_ID);
    String keys = GetStorage().read(Constant.KEY_SEARCH_COMIC + userId.toString()) ?? '';

    List<String> suggestions = keys.split(', ');

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index ) {
          final suggestion = suggestions[index];

          return Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                suggestion,
                style: TextStyle(
                  fontSize: 13.0.sp,
                ),
              ),
              onTap: () {
                query = suggestion;
                showResults(context);
              },
            )
          );
      }
    );
  }

}