import 'package:get/get.dart';
import 'package:manga_read/providers/share_provider.dart';
import '../common/values/const.dart';
import '../data/user.dart';

class ShareRepository {
  ShareProvider shareProvider;
  ShareRepository({required this.shareProvider});

  Future<void> create(int ownerId, int userId, int comicId) async {
    Response response = await shareProvider.create(ownerId, userId, comicId);

    if (response.statusCode == Constant.STATUS_OK) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future<List<User>> getListShared(int comicId) async {
    List<User> users = [];
    Response responses = await shareProvider.getListUserShared(comicId);

    if (responses.statusCode == Constant.STATUS_OK) {
      for (Map<String, dynamic> map in responses.body) {
        users.add(User.fromJson(map));
      }
    } else {
      print(responses.statusCode);
    }
    return users;
  }

  Future<bool> unShare(comicId, userId) async {
    Response response = await shareProvider.deleteShared(comicId, userId);

    if (response.statusCode == Constant.STATUS_OK) {
      return true;
    } else {
      print(response.statusCode);
    }
    
    return false;
  }
}