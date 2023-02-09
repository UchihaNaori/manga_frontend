import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/data/comic.dart';
import 'package:manga_read/routers/router.dart';
import 'package:manga_read/service/home_repository.dart';
import '../data/category.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository;
  HomeController({required this.homeRepository});
  late List<Category> categories = <Category>[].obs;
  RxInt selectedIndex = 0.obs;
  RxInt selectCategoryId = 0.obs;
  late List<Comic> allComic = [];
  late List<Comic> comics = <Comic>[].obs;
  late List<Comic> searchComics = [];
  RxBool loading = true.obs;
  RxBool isShowGrid = true.obs;


  @override
  Future<void> onInit() async{
    EasyLoading.show(status: 'loading....');
    await loadHome();
    super.onInit();
  }

  Future<void> loadHome() async {
    categories.assignAll(await homeRepository.getCategories());
    comics = await homeRepository.getComics();
    allComic = comics;
    loading.value = false;
    EasyLoading.dismiss();
    update();
  }

  Future<List<Comic>> searchComic(String key) async {
    int userId = await GetStorage().read('userId');
    searchComics = await homeRepository.searchComic(userId, key);
    print(searchComics.length);
    return searchComics;
  }

  void selectNavigation( int selected) {
    selectedIndex.value = selected;
  }

  void logout() async {
    GetStorage().remove('userId');
    Get.offAllNamed(RouterNavigation.login);
  }

  void setSelectCategoryId(int value, String title) {
    selectCategoryId.value = value;
    List<Comic> comicsByCategory = [];
    if (value == 0) {
      comicsByCategory = allComic;
    } else {
      for(Comic comic in allComic) {
        if (comic.listCategory.contains(title)) {
          comicsByCategory.add(comic);
        }
      }
    }
    comics = comicsByCategory;
    update();
  }
  void setIsShowGrid () {
    isShowGrid.value = !isShowGrid.value;
  }
  void setSelectedIndex(int value) {
    selectedIndex.value = value;
  }
}