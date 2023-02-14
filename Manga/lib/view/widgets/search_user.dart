import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/controller/friend_controller.dart';
import 'package:get/get.dart';
import '../../common/utils/extensions.dart';
import './friend_card.dart';
import './message.dart';
import '../../common/values/const.dart';

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
      child: friendC.users.length > 0 ?
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return FriendCard(user: friendC.users[index]);
          },
          itemCount: friendC.users.length,
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
    int userId = GetStorage().read(Constant.KEY_USER_ID);
    String keys = GetStorage().read(Constant.KEY_SEARCH_USER + userId.toString()) ?? '';

    List<String> suggestions = keys.split(', ');

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index ) {
            final suggestion = suggestions[index];

            return ListTile(
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
            );
        }
      );
  }

}