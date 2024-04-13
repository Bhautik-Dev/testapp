import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/home_controller.dart';
import 'package:testapp/widget/bottom_widget.dart';
import 'package:testapp/widget/custom_drawer.dart';
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  HomeController homeController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.drawaerkey,
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(Icons.format_align_left_rounded),
          color: Colors.white, onPressed: () {
          homeController.drawaerkey.currentState!.openDrawer();
          homeController.isDrawerOpen.value = true;
        },
        ),

        backgroundColor: Colors.black,
        title: Text(
          "Explore",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      onDrawerChanged: (isOpened) {
        homeController.isDrawerOpen.value = isOpened;
      },

      backgroundColor: Colors.black,
    body: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Search here...",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)),
                contentPadding:
                EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                // focusColor: Colors.black12,
                fillColor: Colors.grey.shade800,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
      ],
    ),
      // bottomNavigationBar:BottomDesing()
    );
  }
}
