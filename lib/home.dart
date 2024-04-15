import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/blog_full_page.dart';
import 'package:testapp/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  HomeController homeController = Get.find();
  List<dynamic> blogList = [];
  late TabController tabController;


  // Create a key
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getData();
    tabController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.drawaerkey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.format_align_left_rounded),
          color: Colors.white,
          onPressed: () {
            homeController.drawaerkey.currentState!.openDrawer();
            homeController.isDrawerOpen.value = true;
            // debugPrint("Drawer=>${homeController.isDrawerOpen.value}");
          },
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(
            width: 18,
          )
        ],
        backgroundColor: Colors.black,
        title: const Text(
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
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                    const SizedBox(
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
                    const SizedBox(
                      height: 20,
                    ),
                    widgetBreakingNews1(),
                    widgetPolitics1(),
                    widgetSports1(),
                    widgetTech1(),
                    widgetFinance1(),
                    widgetLifestyle1(),
                    widgetWorld1(),
                    widgetArtsAndEntertainment1(),
                    widgetConflictAndDefence1(),
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
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search here...",
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  // focusColor: Colors.black12,
                  fillColor: Colors.grey.shade800,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TabBar.secondary(
            physics: const BouncingScrollPhysics(),
            controller: tabController,
            dividerColor: Colors.grey.shade800,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            unselectedLabelStyle: TextStyle(color: Colors.grey.shade400),
            // labelPadding: EdgeInsets.symmetric(horizontal: 9),
            // padding: EdgeInsets.only(left: 10),
            tabs: const [
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
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Row(
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
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.41,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: homeController.isLoding == true
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.red,
                      ))
                    :Obx(() =>  ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.getDataList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 270,
                      // height: ,
                      padding: const EdgeInsets.only(bottom: 10),
                      // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Flexible(
                            child:Obx(() =>  ListView.builder(
                              itemCount: homeController.getDataList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Text(
                                  homeController.getDataList[index]['description']??"",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),)
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: (const Text(
                                  "BNN News",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.star_border_outlined,
                                color: Colors.red,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text("•",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white54)),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text("43 minutes read",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white54))
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),)
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
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
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(BlogFullPage());
                      },
                      child: Container(
                        // height: 100,
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            const Expanded(
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
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: 5)
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
          Column(
            children: [
              Image.network(
                  'https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494')
            ],
          )
        ],
      ),
    ));
  }

  widgetBreakingNews() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Flexible(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Flexible(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Flexible(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Flexible(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Flexible(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Flexible(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Flexible(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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

  widgetBreakingNews1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent,),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        // maintainState: true,
        textColor: Colors.white,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text("Breaking News",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.bNewsList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.bNewsList[index]??"",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  widgetPolitics1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title:
            const Text("Politics", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.politicsList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.politicsList[index]??"",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  widgetSports1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title:
            const Text("Sports", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.sportsList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.sportsList[index]??"",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  widgetTech1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text("Tech", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.techList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.techList[index]??"",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  widgetFinance1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title:
            const Text("Finance", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.financeList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.financeList[index]??"",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  widgetLifestyle1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text("Lifestyle",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.lifeList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.lifeList[index]??"",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  widgetWorld1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text("World", style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount:homeController.worldlist.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.worldlist[index].toString(),
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  widgetArtsAndEntertainment1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text("Arts & Entertainment",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.artsList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.artsList[index]??"",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }

  widgetConflictAndDefence1() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // backgroundColor: Colors.black,
        iconColor: Colors.white,
        textColor: Colors.white,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text("Conflict & Defence",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shrinkWrap: true,
            itemCount: homeController.confictList.length,
            itemBuilder: (context, index) {
              return Text(
                homeController.confictList[index]??"",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 30,
              );
            },
          )
        ],
      ),
    );
  }
}
