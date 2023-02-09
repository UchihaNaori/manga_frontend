import 'package:get/get.dart';
import 'package:manga_read/controller/friend_controller.dart';
import 'package:manga_read/service/share_repository.dart';

import '../data/user.dart';

class ShareController extends GetxController {
  FriendController friendC = Get.find();
  ShareRepository shareRepository;
  ShareController({required this.shareRepository});
  int comicId = Get.arguments;
  List<User> listShared = <User>[].obs;
  List<User> friends = <User>[].obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    await loadListShared();
  }

  Future<void> loadListShared() async {
    listShared = await shareRepository.getListShared(comicId);
    loadFriend();
    update();
  }

  Future<void> create(int ownerId, User user) async {
    if (isFriend(user.id)) {
      friends.removeWhere((element) => element.id == user.id);
    }
    listShared.add(user);
    await shareRepository.create(ownerId, user.id, comicId);
    update();
  }

  bool isShared(User user) {
    for (User userShared in listShared) {
      if (user.id == userShared.id) {
        return true;
      }
    }
    return false;
  }

  void loadFriend() {
    for (User user in friendC.friends) {
      if (!isShared(user)) {
        friends.add(user);
      }
    }
  }

  bool isFriend(int userId) {
    for(User user in friendC.friends) {
      if (user.id == userId) {
        return true;
      }
    }

    return false;
  }

  void unShare(int userId) async {
    for (User user in listShared) {
      if (user.id == userId) {
        listShared.remove(user);
        if (isFriend(userId)) {
          friends.add(user);
        }
        break;
      }
    }
    bool success = await shareRepository.unShare(comicId, userId);
    update();
  }

  bool containShared(User user) {
    for(User userL in listShared) {
      if (userL.id == user.id) return true;
    }
    return false;
  }
}