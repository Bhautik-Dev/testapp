import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/controller/home_controller.dart';
import 'package:testapp/widget/bottom_widget.dart';

import 'widget/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  HomeController homeController = Get.find();
  List<dynamic> blogList = [];
  late TabController tabController;
  bool isLoding = false;

  // Create a key
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdata();
    tabController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.drawaerkey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.format_align_left_rounded),
          color: Colors.white,
          onPressed: () {
            homeController.drawaerkey.currentState!.openDrawer();
            homeController.isDrawerOpen.value = true;
            // debugPrint("Drawer=>${homeController.isDrawerOpen.value}");
          },
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(
            width: 18,
          )
        ],
        backgroundColor: Colors.black,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
          backgroundColor: Colors.black,
          width: Get.width,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 28,
                          backgroundColor: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Log In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "EXPLORE CATEGORIES",
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    WidgetBreakingNews1(),
                    WidgetPolitics1(),
                    WidgetSports1(),
                    WidgetTech1(),
                    WidgetFinance1(),
                    WidgetLifestyle1(),
                    WidgetWorld1(),
                    WidgetArtsAndEntertainment1(),
                    WidgetConflictAndDefence1(),
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Editorial",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                height: 22,
                              ),
                              Text("History",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
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
          SizedBox(
            height: 15,
          ),
          TabBar.secondary(
            physics: BouncingScrollPhysics(),
            controller: tabController,
            dividerColor: Colors.grey.shade800,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            unselectedLabelStyle: TextStyle(color: Colors.grey.shade400),
            // labelPadding: EdgeInsets.symmetric(horizontal: 9),
            // padding: EdgeInsets.only(left: 10),
            tabs: [
              Tab(
                text: 'For you',
              ),
              Tab(text: 'Following'),
              Tab(text: 'Breaking News'),
              Tab(text: 'Watch Now'),
              Tab(text: 'World'),
              Tab(text: 'Politics'),
              Tab(text: 'Sports'),
              Tab(text: 'Tech'),
              Tab(text: 'Finance'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                widgetForYou(),
                widgetFollowing(),
                widgetBreakingNews(),
                widgetWatchNow(),
                widgetWorld(),
                widgetPolitics(),
                widgetSports(),
                widgetTech(),
                widgetFinance(),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Tab Widget
  widgetForYou() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.52,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: isLoding == true
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.red,
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: blogList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 270,
                            // height: ,
                            padding: EdgeInsets.only(bottom: 10),
                            // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      child: Image.network(
                                        "https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                    itemCount: blogList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Text(
                                        blogList[index]['meta_description'] ??
                                            "".toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: (Text(
                                        "BNN News",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.red,
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text("•",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white54)),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text("43 minutes read",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white54))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    "Selected for you",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        // height: 100,
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 10,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "BNN News",
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.red,
                                        size: 17,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text("•",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white54)),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text("43 minutes ago",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white54))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    "Baltimore Bridge Collapse:New Channels to Aid Port Traffic,recovery Efforts Progress",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.thumb_up_alt_outlined,
                                        color: Colors.white54,
                                        size: 19,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text("•",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white54)),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "2 min read",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white54),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("•",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white54)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("India",
                                          style:
                                              TextStyle(color: Colors.white54))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494',
                                  // height: MediaQuery.of(context).size.height*0.15,
                                  // width: MediaQuery.of(context).size.width*0.15,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: 5),
              )
            ],
          ),
        ),
      ],
    );
  }

  widgetFollowing() {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Image.network(
                    'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494')
              ],
            ),
          )
        ],
      ),
    ));
  }

  widgetBreakingNews() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CircleAvatar(
                        //   maxRadius: 10,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          "BNN News",
                          style: TextStyle(color: Colors.white54),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.red,
                          size: 17,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4/3/2024",
                            style:
                                TextStyle(fontSize: 10, color: Colors.white54)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            "Baltimore Bridge Collapse:New Channels to Aid Port Traffic,recovery Efforts Progress",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494',
                              // height: MediaQuery.of(context).size.height*0.15,
                              // width: MediaQuery.of(context).size.width*0.15,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.white54,
                          size: 19,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "2 min read",
                          style: TextStyle(fontSize: 10, color: Colors.white54),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text("India",
                              style: TextStyle(color: Colors.white54)),
                        ),
                        Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white54,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade800,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: 5);
  }

  widgetWatchNow() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CircleAvatar(
                        //   maxRadius: 10,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          "BNN News",
                          style: TextStyle(color: Colors.white54),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.red,
                          size: 17,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4/3/2024",
                            style:
                                TextStyle(fontSize: 10, color: Colors.white54)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            "Baltimore Bridge Collapse:New Channels to Aid Port Traffic,recovery Efforts Progress",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494',
                              // height: MediaQuery.of(context).size.height*0.15,
                              // width: MediaQuery.of(context).size.width*0.15,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.white54,
                          size: 19,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "2 min read",
                          style: TextStyle(fontSize: 10, color: Colors.white54),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text("India",
                              style: TextStyle(color: Colors.white54)),
                        ),
                        Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white54,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade800,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: 5);
  }

  widgetWorld() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CircleAvatar(
                        //   maxRadius: 10,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          "BNN News",
                          style: TextStyle(color: Colors.white54),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.red,
                          size: 17,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 2,
                        ),
                        Text("2 hours ago",
                            style:
                                TextStyle(fontSize: 10, color: Colors.white54)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            "Baltimore Bridge Collapse:New Channels to Aid Port Traffic,recovery Efforts Progress",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494',
                              // height: MediaQuery.of(context).size.height*0.15,
                              // width: MediaQuery.of(context).size.width*0.15,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.white54,
                          size: 19,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "2 min read",
                          style: TextStyle(fontSize: 10, color: Colors.white54),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text("India",
                              style: TextStyle(color: Colors.white54)),
                        ),
                        Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white54,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade800,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: 5);
  }

  widgetPolitics() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CircleAvatar(
                        //   maxRadius: 10,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          "BNN News",
                          style: TextStyle(color: Colors.white54),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.red,
                          size: 17,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4/3/2024",
                            style:
                                TextStyle(fontSize: 10, color: Colors.white54)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            "Baltimore Bridge Collapse:New Channels to Aid Port Traffic,recovery Efforts Progress",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494',
                              // height: MediaQuery.of(context).size.height*0.15,
                              // width: MediaQuery.of(context).size.width*0.15,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.white54,
                          size: 19,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "2 min read",
                          style: TextStyle(fontSize: 10, color: Colors.white54),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text("India",
                              style: TextStyle(color: Colors.white54)),
                        ),
                        Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white54,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade800,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: 5);
  }

  widgetSports() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CircleAvatar(
                        //   maxRadius: 10,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          "BNN News",
                          style: TextStyle(color: Colors.white54),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.red,
                          size: 17,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4/3/2024",
                            style:
                                TextStyle(fontSize: 10, color: Colors.white54)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            "Baltimore Bridge Collapse:New Channels to Aid Port Traffic,recovery Efforts Progress",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494',
                              // height: MediaQuery.of(context).size.height*0.15,
                              // width: MediaQuery.of(context).size.width*0.15,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.white54,
                          size: 19,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "2 min read",
                          style: TextStyle(fontSize: 10, color: Colors.white54),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text("India",
                              style: TextStyle(color: Colors.white54)),
                        ),
                        Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white54,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade800,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: 5);
  }

  widgetTech() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CircleAvatar(
                        //   maxRadius: 10,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          "BNN News",
                          style: TextStyle(color: Colors.white54),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.red,
                          size: 17,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4/3/2024",
                            style:
                                TextStyle(fontSize: 10, color: Colors.white54)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            "Baltimore Bridge Collapse:New Channels to Aid Port Traffic,recovery Efforts Progress",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494',
                              // height: MediaQuery.of(context).size.height*0.15,
                              // width: MediaQuery.of(context).size.width*0.15,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.white54,
                          size: 19,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "2 min read",
                          style: TextStyle(fontSize: 10, color: Colors.white54),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text("India",
                              style: TextStyle(color: Colors.white54)),
                        ),
                        Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white54,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade800,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: 5);
  }

  widgetFinance() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CircleAvatar(
                        //   maxRadius: 10,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          "BNN News",
                          style: TextStyle(color: Colors.white54),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.red,
                          size: 17,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 2,
                        ),
                        Text("2 hours ago",
                            style:
                                TextStyle(fontSize: 10, color: Colors.white54)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            "Baltimore Bridge Collapse:New Channels to Aid Port Traffic,recovery Efforts Progress",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494',
                              // height: MediaQuery.of(context).size.height*0.15,
                              // width: MediaQuery.of(context).size.width*0.15,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.white54,
                          size: 19,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "2 min read",
                          style: TextStyle(fontSize: 10, color: Colors.white54),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("•",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white54)),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text("India",
                              style: TextStyle(color: Colors.white54)),
                        ),
                        Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white54,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade800,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: 5);
  }

  // Drawer widget

  WidgetBreakingNews1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent,),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        // maintainState: true,
        textColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text("Breaking News",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.bNewsList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.bNewsList[index]??"",
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  WidgetPolitics1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title:
            Text("Politics", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.politicsList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.politicsList[index]??"",
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  WidgetSports1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title:
            Text("Sports", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.sportsList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.sportsList[index]??"",
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  WidgetTech1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text("Tech", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.techList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.techList[index]??"",
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  WidgetFinance1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title:
            Text("Finance", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.financeList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.financeList[index]??"",
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  WidgetLifestyle1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text("Lifestyle",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.lifeList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.lifeList[index]??"",
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  WidgetWorld1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text("World", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount:homeController.worldlist.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.worldlist[index].toString()??"",
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  WidgetArtsAndEntertainment1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text("Arts & Entertainment",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.artsList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.artsList[index]??"",
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  WidgetConflictAndDefence1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text("Conflict & Defence",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.confictList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.confictList[index]??"",
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }
}
