import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/service/friend_repository.dart';
import '../data/user.dart';
import '../common/values/const.dart';

class FriendController extends GetxController {
  FriendRepository friendRepository;
  FriendController({required this.friendRepository});
  List<User> friends = <User>[].obs;
  List<User> users = <User>[].obs;
  List<User> requsetFriends = <User>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadListFriend();
  }

  Future<void> loadListFriend() async {
    friends = await friendRepository.getListFriendByUserId();
    requsetFriends = await friendRepository.getListRequest();
    update();
  }

  Future<void> searchUser(String key) async {
    int userId = await GetStorage().read(Constant.KEY_USER_ID);
    String keys = GetStorage().read(Constant.KEY_SEARCH_USER + userId.toString()) ?? '';
    if (keys != '') {
      if (!keys.contains(key)) {
        GetStorage().write(Constant.KEY_SEARCH_USER + userId.toString(), '$keys, $key');
      }
    } else {
      GetStorage().write(Constant.KEY_SEARCH_USER + userId.toString(), key);
    }
    users = await friendRepository.searchUser(key);
  }

  Future<void> deleteFirend(User user) async {
    friends.remove(user);
    int userId = await GetStorage().read('userId');
    await friendRepository.deleteFirend(userId, user.id);
    EasyLoading.showSuccess('Delete friend success', dismissOnTap: true);
    update();
  }

  Future<void> createFriend(User user) async {
    int userId = await GetStorage().read('userId');
    EasyLoading.showSuccess('Request friend success', dismissOnTap: true);
    await friendRepository.create(userId, user.id);
    Get.back();
    update();
  }

  Future<void> accept(User user) async {
    requsetFriends.remove(user);
    friends.add(user);
    await friendRepository.accept(user.id);
    update();
  }

  Future<void> unAccept(User user) async {
    requsetFriends.remove(user);
    await friendRepository.unAccept(user.id);
    update();
  }

}