import 'package:get/get.dart';
import '../common/values/const.dart';

class DetailProvider extends GetConnect {
  Future<Response> checkFavorite(id) => get('${Constant.baseUrl}/favoriteComic/checkFavorite?userId=1&comicId=$id');
  Future<Response> createFavorite(comicId, userId) => post('${Constant.baseUrl}/favoriteComic/create?userId=$userId&comicId=$comicId', {});
  Future<Response> deleteFavorite(id) => get('${Constant.baseUrl}/favoriteComic/delete/$id');
  Future<Response> getListChapter(comicId, userId) => post('${Constant.baseUrl}/chapter/listChapter?comicId=$comicId&userId=$userId', {});
}