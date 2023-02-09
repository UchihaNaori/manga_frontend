import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/controller/favorite_controller.dart';
import 'package:manga_read/controller/recent_controller.dart';
import 'package:manga_read/service/detail_repository.dart';
import '../data/comic.dart';
import '../data/chapter.dart';

class DetailController extends GetxController {
  DetailRepository detailRepository;
  DetailController({ required this.detailRepository });
  RxInt showInfor = 0.obs;
  Comic comicD = Get.arguments;
  RxBool isLoading = true.obs;
  RxBool isFavorite = false.obs;
  late int idFavorite = 0;
  RxList<Chapter> chapters = <Chapter>[].obs;
  RxMap mapVolumes = {}.obs;
  RxList<Chapter> volumes = <Chapter>[].obs;
  FavoriteController favoriteC = Get.find();
  RecentController recentC = Get.find();
  Rxn<Chapter> recentChapter = Rxn<Chapter>();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await loadChapters(comicD.id);
    await checkFavorite(comicD.id);
  }

  void setRecentChapter() {
    for(Chapter chapter in chapters) {
      if (chapter.isRecent) {
        recentChapter.value = chapter;
        update();
        break;
      }
    }
  }

  Future<void> loadChapters(int comicId) async {
    int userId = await GetStorage().read('userId');
    Map<String, List<Chapter>> map = await detailRepository.getListChapters(comicId, userId);
    chapters.value = map['chapters']!;
    volumes.value = map['volumes']!;
    for(Chapter chapter in volumes) {
      mapVolumes[chapter] = false;
    }

    setRecentChapter();
  }

  Future<void> checkFavorite(int comicId) async {
    idFavorite = await detailRepository.checkFavorite(comicId);
    isFavorite.value = idFavorite > 0;
    isLoading.value = false;
    update();
  }

  Future<void> setShowInfor(int value) async {
    showInfor.value = value;
  }

  void onTapVolumeCard(Chapter chapter) {
    mapVolumes[chapter] = !mapVolumes[chapter];
  }

  Future<void> selectFavoriteComic() async {
    isFavorite.value = !isFavorite.value;
    if (isFavorite.value) {
      favoriteC.addNewFavorite(comicD);
      idFavorite = await detailRepository.selectFavorite(comicD.id, 1);
    } else {
      favoriteC.deleteFavorite(comicD);
      await detailRepository.deleteFavorite(idFavorite);
    }
    update();
  }

  Future<void> onTapChapterCard(int chapter) async {
    await recentC.updateRecent(comicD, chapter);
  }

  Future<void> acceptShare() async{
    comicD.isShared = 0;
    update();
  }
}