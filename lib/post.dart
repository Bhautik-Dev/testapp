import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/widget/custom_drawer.dart';

import 'controller/home_controller.dart';
class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  HomeController homeController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.drawaerkey,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
            title: const Text("Create Post",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: const [
          Text("Publish",style: TextStyle(color: Colors.grey),),
          SizedBox(
            width: 15,
          )
        ],
      ),
      drawer: const CustomDrawer(),
      onDrawerChanged: (isOpened) {
        homeController.isDrawerOpen.value = isOpened;
      },

      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: const Column(
          children: [
            Row(
              children: [
                CircleAvatar(maxRadius: 30,),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Patel Kinal",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                    Text("@kinal",style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
