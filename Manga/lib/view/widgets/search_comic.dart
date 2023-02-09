import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/home_controller.dart';
import 'package:manga_read/view/home/widgets/comic_card_list.dart';
import '../../common/utils/extensions.dart';
import '../../routers/router.dart';
import './message.dart';

class SearchComic extends SearchDelegate {
  HomeController homeC = Get.find();
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    // throw UnimplementedError();
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
    // TODO: implement buildLeading
    // throw UnimplementedError();
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    // throw UnimplementedError();

    return FutureBuilder(
      future: homeC.searchComic(query),
      builder: (context, snapshot) =>  Container(
      padding: EdgeInsets.only(top: 3.0.hp, left: 5.0.wp, right: 5.0.wp),
      color: Colors.white,
      child: homeC.searchComics.length > 0?
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
    // TODO: implement buildSuggestions
    // throw UnimplementedError();
    List<String> suggestions = [
      'Manga',
      'Manhwa'
      'Comedia',
      'Horrow'
    ];

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index ) {
            final suggestion = suggestions[index];

            return ListTile(
              title: Text(suggestion),
              onTap: () {
                query = suggestion;
                showResults(context);
              },
            );
        }
      );
  }

}