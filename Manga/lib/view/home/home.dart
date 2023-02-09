import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/home_controller.dart';
import 'package:manga_read/routers/router.dart';
import 'package:manga_read/view/bookcase/bookcase.dart';
import 'package:manga_read/view/friend/friend.dart';
import 'package:manga_read/view/home/widgets/category_card.dart';
import 'package:manga_read/view/home/widgets/comic_card.dart';
import 'package:manga_read/view/home/widgets/comic_card_list.dart';
import 'package:manga_read/view/home/widgets/header.dart';
import 'package:manga_read/view/bookcase/recent/recent.dart';
import 'package:manga_read/view/profile/profile.dart';
import 'package:manga_read/view/widgets/message.dart';
import 'package:manga_read/view/widgets/search_comic.dart';
import '../../common/utils/extensions.dart';
import '../../common/values/const.dart';
import '../../data/category.dart';
import '../../data/comic.dart';
class Home extends GetView<HomeController> {
  const Home({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      Widget bodyContent = HomeUi(context);
      int currentIndex = controller.selectedIndex.value;
      switch(currentIndex) {
        case 0: {
          bodyContent = HomeUi(context);
          break;
        }
        case 1: {
          bodyContent = BookcaseUI();
          break;
        }
        case 2: {
          bodyContent = FriendUI();
          break;
        }
        case 3: {
          bodyContent = Profile();
        }
      }
      return Scaffold(
        // drawer: SideBar(),
        // appBar: Header().build(context),
        body: bodyContent,
        bottomNavigationBar:GetX<HomeController>(builder: (controller)=> BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:const Color.fromARGB(217, 248, 252, 251),
          selectedItemColor: Constant.mainColor,
          unselectedItemColor:const Color.fromARGB(204, 153, 155, 145),
          currentIndex: controller.selectedIndex.value,
          onTap: (int value) {
            controller.setSelectedIndex(value);
          },
          items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_outlined),
            label: 'Bookcase'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            label: 'Friends'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Tài khoản'
          )
        ])),
      );
    });
  }

  Widget HomeUi(BuildContext context) {
    return Stack(
      children: [
        Header().build(context),
        Column(
          children: [
            Center(
              child: Image.asset('assets/images/logo.png', height: 16.0.hp,)
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0.wp),
                child: GetBuilder<HomeController>(builder: (controller) =>
                  controller.loading.value ? Container()
                  : Column(
                    children: [
                      TextField(
                        readOnly: true,
                        cursorColor: Colors.grey,
                        onTap: () {
                          showSearch(context: context, delegate: SearchComic());
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          contentPadding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        )
                      ),
                      SizedBox(height: 2.0.hp,),
                      Container(
                        height: 5.0.hp,
                        child:ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            CategoryCard(category: Category(id: 0, title: 'All', description: 'Tất cả thể loại')),
                            ...controller.categories.map((e) =>CategoryCard(category: e)).toList()
                          ],
                        ),
                      ),
                      SizedBox(height: 1.0.hp,),
                      SizedBox(
                        height: 63.0.hp,
                        child: GetX<HomeController>(builder: (controller) =>
                        controller.comics.length > 0?
                          controller.isShowGrid.value ?
                            ListView(
                              shrinkWrap: true,
                              physics:const BouncingScrollPhysics(),
                              children:[
                                GridView.count(
                                  crossAxisCount: 3,
                                  shrinkWrap: true,
                                  childAspectRatio: (0.5),
                                  physics: const ClampingScrollPhysics(),
                                  children: [
                                    ...controller.comics.map((e) =>
                                      InkWell(
                                        child: ComicCard(comic: e),
                                        onTap: () {
                                          Get.toNamed(RouterNavigation.detail, arguments: e);
                                        },
                                      )
                                    ).toList()
                                  ],
                                ),
                              ]
                            ):
                            ListView(
                              physics:const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ...controller.comics.map((e) =>
                                  ComicCardList(comic: e, onTapCard: () {
                                    onTapComicCard(e);
                                  },),
                                ).toList()
                              ],
                            )
                          :Message(message: ' Oh no! You \nhaven\'t comic \nin category')
                        )
                      )
                    ],
                  ),
                )
              )
            )
          ]
        )
      ],
    );
  }

  void onTapComicCard(Comic comic) {
    Get.toNamed(RouterNavigation.detail, arguments: comic);
  }

}