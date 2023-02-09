import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manga_read/data/user.dart';
import 'package:manga_read/providers/profile_provider.dart';
import '../common/values/const.dart';

class ProfileRepository {
  ProfileProvider profileProvider;
  ProfileRepository({ required this.profileProvider});

  Future<List<User>> getInfor() async {
    List<User> infor = [];
    int userId = GetStorage().read('userId');
    Response response = await profileProvider.getInformation(userId);

    if (response.statusCode == Constant.STATUS_OK) {
      infor.add(User.fromJson(response.body));
    } else {
      print(response.statusCode);
    }
    return infor;
  }
}