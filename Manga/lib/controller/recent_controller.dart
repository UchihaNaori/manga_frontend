import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/service/recent_repository.dart';

import '../data/chapter.dart';
import '../data/comic.dart';

class RecentController extends GetxController {
  RecentRepsitory recentRepsitory;
  RecentController({required this.recentRepsitory});
  RxMap mapRecents = {}.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    await loadComics(1);
  }

  Future<void> loadComics(int userId) async {
    mapRecents.value = await recentRepsitory.listComics(userId);
  }

  Future<void> updateRecent(Comic comic, Chapter chapter, int volume) async {
    bool isContainmap = false;
    mapRecents.forEach((key, value) async {
      if (key.id == comic.id) {
        isContainmap = true;
        mapRecents[key] = 'Chapter ${chapter.chapter} - Volume $volume';
        await recentRepsitory.updateRecent(comic.id, chapter.id, volume);
        return;
      }
    });

    if (!isContainmap) {
      mapRecents[comic] = 'Chapter ${chapter.chapter} - Volume $volume';
      await recentRepsitory.createRecent(comic.id, chapter.id, volume);
    }
  }
}