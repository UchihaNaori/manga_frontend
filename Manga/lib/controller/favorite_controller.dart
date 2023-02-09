import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/service/favorite_repository.dart';
import '../data/comic.dart';

class FavoriteController extends GetxController {
  FavoriteRepository favoriteRepository;
  FavoriteController({required this.favoriteRepository});
  List<Comic> favoriteComics = <Comic>[].obs;
  RxBool isLoading = true.obs;
  RxBool isFavoriteView = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadComics();
  }

  Future<void> loadComics() async {
    int userId = await GetStorage().read('userId');
    favoriteComics = await favoriteRepository.favoriteComics(userId);
    isLoading.value = false;
    update();
  }

  void addNewFavorite(Comic comic) {
    favoriteComics.add(comic);
    update();
  }

  void deleteFavorite(Comic comic) {
    favoriteComics.remove(comic);
    update();
  }

  void setIsFavoriteView(bool value) {
    isFavoriteView.value = value;
  }
}