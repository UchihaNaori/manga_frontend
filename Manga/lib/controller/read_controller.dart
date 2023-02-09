import 'package:get/get.dart';
import 'package:manga_read/controller/detail_controller.dart';
import 'package:manga_read/data/chapter.dart';
import 'package:manga_read/service/read_comic_repository.dart';

class ReadComicController extends GetxController {
  ReadComicRepository readComicRepository;
  ReadComicController({ required this.readComicRepository });
  List<String> links = [];
  RxBool showAppBar = true.obs;
  DetailController detailC = Get.find();
  Rxn<Chapter> chapter = Rxn<Chapter>();
  int chapterIndex = 0;
  RxBool isPageTurnView = false.obs;
  bool isChapter = Get.arguments['isChapter'];
  String chapName = '';

  @override
  Future<void> onInit() async {
    if (isChapter) {
      await loadContent(Get.arguments['chapter']);
    } else {
      await loadContentVolume(Get.arguments['path']);
    }
    super.onInit();
  }
  void setChapter(int index) {
    chapter.value = detailC.chapters[index];
    chapterIndex = index;
  }

  void setVolume() {
    chapter.value = Get.arguments['volume'];
    String path = Get.arguments['path'];
    chapterIndex = chapter.value!.listPaths.indexOf(path);
    if (chapter.value!.listPaths.length == 1) {
      chapName = 'All chap';
    } else {
      List<String> arrStr = path.split('/');
      chapName = arrStr[arrStr.length - 1];
    }

  }

  Future<void> loadContent(int index) async {
    setChapter(index);
    links.assignAll(await readComicRepository.contentChapter(chapter.value!.id.toString()));
    update();
  }

  Future<void> loadContentVolume(String path) async {
    setVolume();
    links = await readComicRepository.getcontentChapterInVolume(path);
    update();
  }

  Future<void> setContent(int index) async {
    setChapter(index);
    links = await readComicRepository.contentChapter(detailC.chapters[index].id.toString());
    update();
  }

  void setContentVolume(int index) async {
    String path = chapter.value!.listPaths[index];
    List<String> arrStr = path.split('/');
    chapName = arrStr[arrStr.length - 1];
    chapterIndex = index;
    links = await readComicRepository.getcontentChapterInVolume(path);
    update();
  }

  void setShowAppBar() {
    showAppBar.value = !showAppBar.value;
    update();
  }

  void setIsPageTurnView() {
    isPageTurnView.value = !isPageTurnView.value;
    update();
  }
}