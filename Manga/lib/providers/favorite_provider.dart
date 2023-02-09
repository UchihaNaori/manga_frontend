import 'package:get/get.dart';
import '../common/values/const.dart';

class FavoriteProvider extends GetConnect {
  Future<Response> favoriteComics(userId) => get('${Constant.baseUrl}/favoriteComic/listFavorite/$userId');
}