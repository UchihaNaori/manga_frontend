import 'package:get/get.dart';
import 'package:manga_read/controller/favorite_controller.dart';
import 'package:manga_read/providers/favorite_provider.dart';

import '../service/favorite_repository.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController(favoriteRepository: FavoriteRepository(favoriteProvider: FavoriteProvider())));
  }

}