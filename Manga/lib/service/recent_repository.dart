import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/data/comic.dart';
import 'package:manga_read/providers/recent_provider.dart';
import '../common/values/const.dart';

class RecentRepsitory {
  RecentProvider recentProvider;
  RecentRepsitory({required this.recentProvider});

  Future<Map<Comic, String>> listComics(int userId) async {
    Map<Comic, String> recents = {};
    Response responses = await recentProvider.listComics(userId);
    if (responses.statusCode == Constant.STATUS_OK) {
      List maps = responses.body;
      for (int i = 0; i<maps.length; i++) {
        recents[Comic.fromMap(maps[i]['comic'])] = maps[i]['chapter_recent'].toString();
      }
    } else {
      print(responses.statusCode);
    }
    return recents;
  }
  Future<void> updateRecent(int comicId, int userId, int recent) async {
    Response response = await recentProvider.updateRecent(comicId, userId, recent);
    if(response.statusCode == Constant.STATUS_OK) {
      print('ok');
    } else {
      print(response.statusCode);
    }
  }

  Future<void> createRecent(int comicId, int recent) async {
    int userId = await GetStorage().read('userId');
    Response response = await recentProvider.create(userId, comicId, recent);

    if(response.statusCode == Constant.STATUS_OK) {
      print('ok');
    } else {
      print(response.statusCode);
    }
  }

}