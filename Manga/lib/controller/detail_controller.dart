import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/view/detail/widgets/volumes.dart';
import '../data/user.dart';
import './favorite_controller.dart';
import './recent_controller.dart';
import './home_controller.dart';
import 'package:manga_read/service/detail_repository.dart';
import '../data/comic.dart';
import '../data/chapter.dart';
import '../common/values/const.dart';

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
  HomeController homeC = Get.find();
  Rxn<Chapter> recentChapter = Rxn<Chapter>();
  Rxn<Chapter> recentVolume = Rxn<Chapter>();
  Rxn<User> owner = Rxn<User>();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await loadChapters(comicD.id);
    await checkFavorite(comicD.id);
    await loadOwner();
  }

  void setRecentChapter() {
    for(Chapter chapter in chapters) {
      if (chapter.isRecent) {
        recentChapter.value = chapter;
        break;
      }
    }
    recentVolume.value = Chapter(id: 0, name: 'All chap', chapter: 0, comicId: comicD.id, isRecent: false, listPaths: [], volume: 0);
    if (recentChapter.value != null) {
      for (Chapter chapter in volumes) {
        if (chapter.id == recentChapter.value!.volume) {
          recentVolume.value = chapter;
          chapter.isRecent = true;
          break;
        }
      }
    }
  }
  Future<void> loadOwner() async {
    if(comicD.isShared != 0)owner.value = (await detailRepository.getInfor(comicD.userId))[0];
  }
  Future<void> loadChapters(int comicId) async {
    int userId = await GetStorage().read('userId');
    Map<String, List<Chapter>> map = await detailRepository.getListChapters(comicId, userId);
    chapters.value = map['chapters']!;
    volumes.value = map['volumes']!;
    for(Chapter chapter in volumes) {
      mapVolumes[chapter] = <Chapter> [];
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
    update();
  }

  void onTapVolumeCard(Chapter chapter) {
    List<Chapter> chaptersInVolume = [];
    if (mapVolumes[chapter].length == 0) {
      // for(Chapter chapterF in chapters) {
      //   if (chapterF.volume == chapter.id) {
      //     chaptersInVolume.add(chapterF);
      //   }
      // }
      chaptersInVolume = getChaptersInVolume(chapter);
    }

    mapVolumes[chapter] = chaptersInVolume;
    update();
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

  Future<void> onTapChapterCard(Chapter chapter, int volume) async {
    await recentC.updateRecent(comicD, chapter, volume);
  }

  Future<void> acceptShare() async {
    comicD.isShared = 2;
    await detailRepository.acceptShare(comicD.id);
    homeC.accept(comicD);
    update();
  }

  Future<void> unaccpetShare() async {
    homeC.unaccpetShare(comicD);
    await detailRepository.unAcceptShare(comicD.id);
    Get.back();
  }

  List<Chapter> getChaptersInVolume (Chapter? chapter) {
    List<Chapter> chapsInVolume = [];

    for(Chapter chapterF in chapters) {
        if (chapterF.volume == chapter!.id) {
          chapsInVolume.add(chapterF);
        }
      }

    return  chapsInVolume;
  }

  Chapter getVolume(Chapter chapter) {
    Chapter volumeS = Chapter(id: 0, name: 'All chap', chapter: 0, comicId: comicD.id, isRecent: false, listPaths: [], volume: 0);
    for (Chapter volume in volumes) {
      if (volume.id == chapter.volume) {
        return volume;
      }
    }

    return volumeS;
  }
}