import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/service/friend_repository.dart';
import '../data/user.dart';

class FriendController extends GetxController {
  FriendRepository friendRepository;
  FriendController({required this.friendRepository});
  List<User> friends = <User>[].obs;
  List<User> users = <User>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadListFriend(1);
  }

  Future<void> loadListFriend(int userId) async {
    friends = await friendRepository.getListFriendByUserId(userId);
    update();
  }

  Future<void> searchUser(String key) async {
    users = await friendRepository.searchUser(key);
  }

  Future<void> deleteFirend(User user) async {
    friends.remove(user);
    int userId = await GetStorage().read('userId');
    await friendRepository.deleteFirend(userId, user.id);
    update();
  }

  Future<void> createFriend(User user) async {
    friends.add(user);
    int userId = await GetStorage().read('userId');
    await friendRepository.create(userId, user.id);
    update();
  }

}