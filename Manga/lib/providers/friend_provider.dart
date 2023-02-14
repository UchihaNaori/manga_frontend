import 'package:get/get.dart';
import '../common/values/const.dart';
class FriendProvider extends GetConnect {
  Future<Response> getListFriendByUserId(userId) => get('${Constant.baseUrl}/friend/$userId');
  Future<Response> searchUser(key) => post('${Constant.baseUrl}/user/search?key=$key', {});
  Future<Response> deleteFirend(userId, friendId) => post('${Constant.baseUrl}/friend/delete?userId=$userId&friendId=$friendId', {});
  Future<Response> create(firstUser, secondUser) => post('${Constant.baseUrl}/friend/create?firstUser=$firstUser&secondUser=$secondUser', {});
  Future<Response> getListRequest(userId) => get('${Constant.baseUrl}/friend/requestFriend/$userId');
  Future<Response> accpet(firstUser, secondUser) => post('${Constant.baseUrl}/friend/accept?firstUser=$firstUser&secondUser=$secondUser', {});
  Future<Response> unAccpet(firstUser, secondUser) => post('${Constant.baseUrl}/friend/unAccept?firstUser=$firstUser&secondUser=$secondUser', {});
}