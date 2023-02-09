import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/providers/read_provider.dart';

class ReadComicRepository {
  ReadComicProvider readComicProvider;
  ReadComicRepository({ required this.readComicProvider });
  Future<List<String>> contentChapter(String id) async {
    List<String> links = [];

    Response response = await readComicProvider.contentChapter(id);

    if(response.statusCode == 200) {
      List<dynamic> responses = response.body;
      links = responses.map((e) => e.toString()).toList();
    } else {
      print(response.statusCode);
    }

    return links;
  }

  Future<List<String>> getcontentChapterInVolume(String path) async {
    List<String> links = [];
    Response response = await readComicProvider.contentChapterVolume(path);

    if(response.statusCode == 200) {
      List<dynamic> responses = response.body;
      links = responses.map((e) => e.toString()).toList();
    } else {
      print(response.statusCode);
    }

    return links;
  }
}