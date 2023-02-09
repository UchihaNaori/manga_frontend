import 'package:get/get.dart';
import '../common/values/const.dart';

class HomProvider extends GetConnect {
  Future<Response> getCategories(userId) => get('${Constant.baseUrl}/category/$userId');
  Future<Response> getComics(userId) => get('${Constant.baseUrl}/comic/getListComic/$userId');
  Future<Response> searchComic(userId, key) => post('${Constant.baseUrl}/comic/search?userId=$userId&key=$key', {});
}