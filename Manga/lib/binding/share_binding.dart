import 'package:get/get.dart';
import 'package:manga_read/controller/share_controller.dart';
import 'package:manga_read/providers/share_provider.dart';

import '../service/share_repository.dart';

class ShareComicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController(shareRepository: ShareRepository(shareProvider: ShareProvider())));
  }

}