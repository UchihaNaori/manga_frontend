import 'package:get/get.dart';
import 'package:manga_read/controller/read_controller.dart';
import 'package:manga_read/providers/read_provider.dart';

import '../service/read_comic_repository.dart';

class ReadComicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReadComicController(readComicRepository: ReadComicRepository(readComicProvider: ReadComicProvider())));
  }

}