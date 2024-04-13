import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/chatroom.dart';
import 'package:testapp/controller/home_controller.dart';
import 'package:testapp/explore.dart';
import 'package:testapp/finance.dart';
import 'package:testapp/home.dart';
import 'package:testapp/post.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  HomeController homeController=Get.find();
bool isV=false;
  onItemTapped(int index) {
    setState(() {
      homeController.selectedPosition.value= index;
    });
  }
  RxList<dynamic> widgetList=[
    HomePage(),
    ExplorePage(),
    PostPage(),
    ChatRoomPage(),
    FinancePage(),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => widgetList.elementAt(homeController.selectedPosition.value)),

        bottomNavigationBar:Obx(()=>homeController.isDrawerOpen.value ? const SizedBox.shrink() : BottomNavigationBar(
          currentIndex: homeController.selectedPosition.value,
          // elevation: 100,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          // fixedColor: Colors.indigo,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.adjust_rounded,),label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_sharp,),label: "Post"),
            BottomNavigationBarItem(icon: Icon(Icons.mark_chat_unread_outlined,),label: "Chatroom"),
            BottomNavigationBarItem(icon: Icon(Icons.currency_exchange_rounded,),label: "Finance"),
          ],),)
    );

  }
}
