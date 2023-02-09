import 'package:flutter/material.dart';
import 'package:manga_read/controller/friend_controller.dart';
import 'package:get/get.dart';
import '../../../common/utils/extensions.dart';
import './share_card.dart';

class SearchUser extends SearchDelegate {
  FriendController friendC = Get.find();
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
    if (query.trim() == '') {
      return Container();
    }

    return FutureBuilder(
      future: friendC.searchUser(query),
      builder: (context, snapshot) =>  Container(
      padding: EdgeInsets.only(top: 3.0.hp, left: 5.0.wp, right: 5.0.wp),
      color: Colors.white,
      child:ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ShareCard(user: friendC.users[index]);
          },
          itemCount: friendC.users.length,
          physics:const BouncingScrollPhysics(),
        ),
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