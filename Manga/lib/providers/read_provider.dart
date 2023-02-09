import 'package:get/get.dart';
import '../common/values/const.dart';

class ReadComicProvider extends GetConnect {
  Future<Response> contentChapter(String id) => get('${Constant.baseUrl}/chapter/$id');
  Future<Response> contentChapterVolume(path) => post('${Constant.baseUrl}/chapter/contentChapterVolume?path=$path', {});
}