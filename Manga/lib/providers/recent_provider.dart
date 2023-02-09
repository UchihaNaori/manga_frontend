import 'package:get/get.dart';
import '../common/values/const.dart';

class RecentProvider extends GetConnect {
  Future<Response> listComics(userId) => get('${Constant.baseUrl}/recentComic/list/$userId');
  Future<Response> updateRecent(comicId, userId, recent) => post('${Constant.baseUrl}/recentComic/update?userId=$userId&comicId=$comicId&recent=$recent', {});
  Future<Response> create(userId, comicId, recent) => post('${Constant.baseUrl}/recentComic/create?userId=$userId&comicId=$comicId&recent=$recent', {});
}