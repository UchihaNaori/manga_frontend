import 'package:get/get.dart';
import '../common/values/const.dart';

class ShareProvider extends GetConnect {
  Future<Response> create(ownerId, userId, comicId) => post('${Constant.baseUrl}/share/create?owner=$ownerId&userId=$userId&comicId=$comicId', {});
  Future<Response> getListUserShared(comicId) => get('${Constant.baseUrl}/share/listUserShared/$comicId');
  Future<Response> deleteShared(comicId, userId) => post('${Constant.baseUrl}/share/delete?userId=$userId&comicId=$comicId', {});
 }