import 'package:get/get.dart';
import 'package:manga_read/data/user.dart';
import 'package:manga_read/service/profile_repository.dart';

class ProfileController extends GetxController {
  ProfileRepository profileRepository;
  Rxn<User> user = Rxn<User>();
  ProfileController({ required this.profileRepository });


  @override
  void onReady() async {
    await loadInfor();
    super.onReady();
  }
  Future<void> loadInfor() async {
    List<User> users = await profileRepository.getInfor();
    user.value = users[0];
  }
}