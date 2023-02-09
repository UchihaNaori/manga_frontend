import 'package:get/get.dart';
import 'package:manga_read/service/recent_repository.dart';

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

  Future<void> updateRecent(Comic comic, int chapter) async {
    bool isContainmap = false;
    mapRecents.forEach((key, value) async {
      if (key.id == comic.id) {
        isContainmap = true;
        if (int.parse(value) < chapter) {
          mapRecents[key] = chapter.toString();
          await recentRepsitory.updateRecent(comic.id, 1, chapter);
        }
        return;
      }
    });

    if (!isContainmap) {
      mapRecents[comic] = chapter.toString();
      await recentRepsitory.createRecent(comic.id, chapter);
    }
  }
}