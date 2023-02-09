import 'package:get/get.dart';
import 'package:manga_read/providers/favorite_provider.dart';
import '../common/values/const.dart';
import '../data/comic.dart';

class FavoriteRepository {
  FavoriteProvider favoriteProvider;
  FavoriteRepository({required this.favoriteProvider});

  Future<List<Comic>> favoriteComics(int userId) async {
    List<Comic> comics = [];
    Response responses = await favoriteProvider.favoriteComics(userId);

    if (responses.statusCode == Constant.STATUS_OK) {
      for(final comic in responses.body) {
        comics.add(Comic.fromMap(comic));
      }
    } else {
      print(responses.statusCode);
    }

    return comics;
  }
}