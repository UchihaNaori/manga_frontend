
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/data/comic.dart';
import 'package:manga_read/providers/detail_provider.dart';
import '../common/values/const.dart';
import '../data/chapter.dart';
import '../data/user.dart';

class DetailRepository {
  DetailProvider detailProvider;
  DetailRepository({ required this.detailProvider});

  Future<int> checkFavorite(int id) async {
    int favoriteComicId = 0;
    Response response = await detailProvider.checkFavorite(id);
    if (response.statusCode == Constant.STATUS_OK) {
      favoriteComicId =  response.body;
    }
    return favoriteComicId;
  }

  Future<int> selectFavorite(int comicId, int userId) async {
    int idFavorite = 0;
    Response response = await detailProvider.createFavorite(comicId, userId);
    if (response.statusCode == Constant.STATUS_OK) {
      idFavorite = int.parse(response.body);
    } else {
      print(response.statusCode);
    }

    return idFavorite;
  }

  Future<void> deleteFavorite (int comicId) async {
    Response response = await detailProvider.deleteFavorite(comicId);

    if (response.statusCode == Constant.STATUS_OK) {
      print('delete success');
    } else {
      print('fail');
    }
  }

  Future<Map<String, List<Chapter>>> getListChapters(int comicId, int userId) async {
    Map<String, List<Chapter>> map = {};
    Response responses = await detailProvider.getListChapter(comicId, userId);

    if (responses.statusCode == Constant.STATUS_OK) {
      List<Chapter> chapters = [];
      int cnt = 0;
      for(final map in responses.body['chapters']) {
        chapters.add(Chapter.fromMap(map));
        if (map['volume'] == null) cnt++;
      }
      map['chapters'] = chapters;

      List<Chapter> volumes = [];
      if (cnt > 0) {
        Chapter defaultVolume = Chapter(id: 0, name: 'All chap', chapter: 0, comicId: comicId, isRecent: false, listPaths: [], volume: 0);
        volumes.add(defaultVolume);
      }
      for(final map in responses.body['volumes']) {
        volumes.add(Chapter.fromMap(map));
      }
      map['volumes'] = volumes;
    } else {
      print(responses.statusCode);
    }

    return map;
  }

  Future<List<User>> getInfor(int userId) async {
    List<User> infor = [];
    Response response = await detailProvider.getInformation(userId);

    if (response.statusCode == Constant.STATUS_OK) {
      infor.add(User.fromJson(response.body));
    } else {
      print(response.statusCode);
    }
    return infor;
  }

  Future<void> acceptShare(int comicId) async {
    int userId = await GetStorage().read(Constant.KEY_USER_ID);
    Response response = await detailProvider.acceptShare(userId, comicId);

    if (response.statusCode == Constant.STATUS_OK) {
      print('accept success');
    } else {
      print(response.statusCode);
    }
  }

  Future<void> unAcceptShare(int comicId) async {
    int userId = await GetStorage().read(Constant.KEY_USER_ID);
    Response response = await detailProvider.unAcceptShare(userId, comicId);

    if (response.statusCode == Constant.STATUS_OK) {
      print('unaccept success');
    } else {
      print(response.statusCode);
    }
  }

}