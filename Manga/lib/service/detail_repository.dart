
import 'package:get/get.dart';
import 'package:manga_read/data/comic.dart';
import 'package:manga_read/providers/detail_provider.dart';
import '../common/values/const.dart';
import '../data/chapter.dart';

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
      for(final map in responses.body['chapters']) {
        chapters.add(Chapter.fromMap(map));
      }
      map['chapters'] = chapters;

      List<Chapter> volumes = [];
      for(final map in responses.body['volumes']) {
        volumes.add(Chapter.fromMap(map));
      }
      map['volumes'] = volumes;
    } else {
      print(responses.statusCode);
    }

    return map;
  }

}