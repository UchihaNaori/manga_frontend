import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/data/category.dart';
import 'package:manga_read/data/comic.dart';
import 'package:manga_read/providers/home_provider.dart';
import '../common/values/const.dart';

class HomeRepository {
  HomProvider homProvider;
  HomeRepository({required this.homProvider});
  Future<List<Category>> getCategories() async{
    List<Category> catgories = [];
    int userId = await GetStorage().read('userId');
    var response = await homProvider.getCategories(userId);

    if (response.statusCode == Constant.STATUS_OK) {
      List responseJson = response.body;
      for(final category in responseJson) {
        catgories.add(Category.fromMap(category));
      }
    } else {
      print(response.statusCode);
    }
    return catgories;
  }

  Future<List<Comic>> getComics() async {
    int userId = await GetStorage().read('userId');
    Response maps = await homProvider.getComics(userId);
    List<Comic> comics = [];

    if (maps.statusCode == Constant.STATUS_OK) {
      for (final map in maps.body['comics']) {
        comics.add(Comic.fromMap(map));
      }
      for (final map in maps.body['shared']) {
        Comic comic = Comic.fromMap(map);
        comic.isShared = 1;
        comics.add(comic);
      }
    } else {
      print(maps.statusCode);
    }
    return comics;
  }

  Future<List<Comic>> searchComic(int userId, String key) async {
    List<Comic> comics = [];
    Response responses = await homProvider.searchComic(userId, key);

    if (responses.statusCode == Constant.STATUS_OK) {
      for (Map<String, dynamic> map in responses.body) {
        comics.add(Comic.fromMap(map));
      }
    }

    return comics;
  }
}