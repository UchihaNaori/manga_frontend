import 'package:get/get.dart';
import 'package:manga_read/binding/detail_binding.dart';
import 'package:manga_read/binding/favorite_binding.dart';
import 'package:manga_read/binding/home_binding.dart';
import 'package:manga_read/binding/login_binding.dart';
import 'package:manga_read/binding/read_binding.dart';
import 'package:manga_read/binding/register_binding.dart';
import 'package:manga_read/binding/reset_password_binding.dart';
import 'package:manga_read/binding/share_binding.dart';
import 'package:manga_read/binding/splash_binding.dart';
import 'package:manga_read/view/detail/detail.dart';
import 'package:manga_read/view/bookcase/favorite/favorite.dart';
import 'package:manga_read/view/home/home.dart';
import 'package:manga_read/view/login-register/loginv2.dart';
import 'package:manga_read/view/login-register/registerv2.dart';
import 'package:manga_read/view/read_comic/read.dart';
import 'package:manga_read/view/read_comic/read_volume.dart';
import 'package:manga_read/view/reset_password/reset_password.dart';
import 'package:manga_read/view/share/share.dart';
import 'package:manga_read/view/splash/splash.dart';

class RouterNavigation {
  static String login = '/login';
  static String register = '/register';
  static String home = '/home';
  static String read = '/readChap';
  static String detail = '/detail';
  static String favorite = '/favorite';
  static String share = '/share';
  static String splash = '/splash';
  static String resetPass = '/resetPass';
  static String readVolume = '/readVolume';

  static List<GetPage> routers = [
    GetPage(
      page: () =>const Login(),
      name: login,
      binding: LoginBinding()
    ),
    GetPage(
      name: register,
      page: () =>const Register(),
      binding: RegisterBinding()
    ),
    GetPage(
      name: home,
      page: ()=>const Home(),
      binding: Homeinding()
    ),
    GetPage(
      name: read,
      page: () => ReadComicChap(),
      binding: ReadComicBinding()
    ),
    GetPage(
      name: detail,
      page: () => Detail(),
      binding: DetailBinding()
    ),
    GetPage(
      name: favorite,
      page: () => FavoriteComic(),
      binding: FavoriteBinding()
    ),
    GetPage(
      name: share,
      page: () => ShareComic(),
      binding: ShareComicBinding()
    ),
    GetPage(
      name: splash,
      page: () => Splash(),
      binding: SplashBinding()
    ),
    GetPage(
      name: resetPass,
      page: () => ResetPassword(),
      binding: ResetPasswordBinding()
    ),
    GetPage(
      name: readVolume,
      page:() => ReadVolumeChapter(),
      binding: ReadComicBinding()
    )
  ];
}