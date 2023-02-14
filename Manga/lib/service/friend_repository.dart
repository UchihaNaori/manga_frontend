import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/common/values/const.dart';
import 'package:manga_read/data/user.dart';
import 'package:manga_read/providers/friend_provider.dart';

class FriendRepository {
  FriendProvider friendProvider;
  FriendRepository({required this.friendProvider});

  Future<List<User>> getListFriendByUserId() async {
    List<User> friends = [];
    int userId = await GetStorage().read(Constant.KEY_USER_ID);
    Response responses = await friendProvider.getListFriendByUserId(userId);

    if (responses.statusCode == Constant.STATUS_OK) {
      for(Map<String, dynamic> map in responses.body) {
        friends.add(User.fromJson(map));
      }
    } else {
      print(responses.statusCode);
    }

    return friends;
  }

  Future<List<User>> searchUser(String key) async {
    List<User> users = [];
    Response responses = await friendProvider.searchUser(key);

    if (responses.statusCode == Constant.STATUS_OK) {
      for(Map<String, dynamic> map in responses.body) {
        users.add(User.fromJson(map));
      }
    } else {
      print(responses.statusCode);
    }

    return users;
  }

  Future<void> deleteFirend(int userId, int friendId) async {
    Response response = await friendProvider.deleteFirend(userId, friendId);

    if (response.statusCode == Constant.STATUS_OK) {
      print('delete ok');
    } else {
      print(response.statusCode);
    }
  }

  Future<void> create(int userId, int friendId) async {
    Response response = await friendProvider.create(userId, friendId);

    if (response.statusCode == Constant.STATUS_OK) {
      print('create ok');
    } else {
      print(response.statusCode);
    }
  }

  Future<List<User>> getListRequest() async {
    List<User> requsetFriends = [];
    int userId = await GetStorage().read(Constant.KEY_USER_ID);
    Response responses = await friendProvider.getListRequest(userId);

    if (responses.statusCode == Constant.STATUS_OK) {
      for (Map<String, dynamic> map in responses.body) {
        requsetFriends.add(User.fromJson(map));
      }
    } else  {
      print(responses.statusCode);
    }
    return requsetFriends;
  }

  Future<void> accept(int friendRequestId) async {
    int userId = await GetStorage().read(Constant.KEY_USER_ID);
    Response response = await friendProvider.accpet(friendRequestId, userId);

    if (response.statusCode == Constant.STATUS_OK) {
      print('accept friend');
    } else {
      print(response.statusCode);
    }
  }

  Future<void> unAccept(int friendRequestId) async {
    int userId = await GetStorage().read(Constant.KEY_USER_ID);
    Response response = await friendProvider.unAccpet(friendRequestId, userId);

    if (response.statusCode == Constant.STATUS_OK) {
      print('unAccept friend');
    } else {
      print(response.statusCode);
    }
  }
}