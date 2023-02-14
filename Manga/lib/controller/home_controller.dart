import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/data/comic.dart';
import 'package:manga_read/routers/router.dart';
import 'package:manga_read/service/home_repository.dart';
import '../data/category.dart';
import '../common/values/const.dart';

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
    allComic = await homeRepository.getComics();
    for(Comic comic in allComic) {
      if (comic.isShared != 1) {
        comics.add(comic);
      }
    }
    loading.value = false;
    EasyLoading.dismiss();
    update();
  }

  Future<List<Comic>> searchComic(String key) async {
    int userId = await GetStorage().read(Constant.KEY_USER_ID);
    String keys = GetStorage().read(Constant.KEY_SEARCH_COMIC + userId.toString()) ?? '';
    if (keys != '') {
      if (!keys.contains(key)) {
        GetStorage().write(Constant.KEY_SEARCH_COMIC + userId.toString(), '$keys, $key');
      }
    } else {
      GetStorage().write(Constant.KEY_SEARCH_COMIC + userId.toString(), key);
    }
    searchComics = await homeRepository.searchComic(userId, key);
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
      for(Comic comic in allComic) {
        if (comic.isShared != 1) {
          comicsByCategory.add(comic);
        }
      }
    }
    if (value == -1) {
      for(Comic comic in allComic) {
        if (comic.isShared == 1) {
          comicsByCategory.add(comic);
        }
      }
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

  void unaccpetShare(Comic comic) {
    allComic.remove(comic);
    comics.remove(comic);
    update();
  }

  void accept(Comic comic) {
    comics.remove(comic);
    update();
  }
}