import 'package:get/get.dart';
import '../common/values/const.dart';
class FriendProvider extends GetConnect {
  Future<Response> getListFriendByUserId(userId) => get('${Constant.baseUrl}/friend/$userId');
  Future<Response> searchUser(key) => post('${Constant.baseUrl}/user/search?key=$key', {});
  Future<Response> deleteFirend(userId, friendId) => post('${Constant.baseUrl}/friend/delete?userId=$userId&friendId=$friendId', {});
  Future<Response> create(firstUser, secondUser) => post('${Constant.baseUrl}/friend/create?firstUser=$firstUser&secondUser=$secondUser', {});
}