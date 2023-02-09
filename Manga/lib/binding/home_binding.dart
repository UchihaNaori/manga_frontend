import 'package:get/get.dart';
import 'package:manga_read/controller/friend_controller.dart';
import 'package:manga_read/controller/home_controller.dart';
import 'package:manga_read/controller/profile_controller.dart';
import 'package:manga_read/controller/recent_controller.dart';
import 'package:manga_read/providers/friend_provider.dart';
import 'package:manga_read/providers/home_provider.dart';
import 'package:manga_read/providers/profile_provider.dart';
import 'package:manga_read/providers/recent_provider.dart';
import 'package:manga_read/service/home_repository.dart';

import '../controller/favorite_controller.dart';
import '../providers/favorite_provider.dart';
import '../service/favorite_repository.dart';
import '../service/friend_repository.dart';
import '../service/profile_repository.dart';
import '../service/recent_repository.dart';

class Homeinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(homeRepository: HomeRepository(homProvider: HomProvider())));
    Get.put(FavoriteController(favoriteRepository: FavoriteRepository(favoriteProvider: FavoriteProvider())));
    Get.put(RecentController(recentRepsitory: RecentRepsitory(recentProvider: RecentProvider())));
    Get.put(FriendController(friendRepository: FriendRepository(friendProvider: FriendProvider())));
    Get.put(ProfileController(profileRepository: ProfileRepository(profileProvider: ProfileProvider())));
  }

}