import 'package:get/get.dart';
import 'package:manga_read/controller/detail_controller.dart';
import 'package:manga_read/providers/detail_provider.dart';

import '../service/detail_repository.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController(detailRepository: DetailRepository(detailProvider: DetailProvider())));
  }

}