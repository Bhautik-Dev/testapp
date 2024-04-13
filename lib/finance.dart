import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/widget/custom_drawer.dart';

import 'controller/home_controller.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage>
    with TickerProviderStateMixin {
  late TabController tabController;
  int isSelect = 0;
  int isSelect1 = 0;
  HomeController homeController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.drawaerkey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.list_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            homeController.drawaerkey.currentState!.openDrawer();
            homeController.isDrawerOpen.value = true;
          },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          "Finance",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 30,
              )),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      onDrawerChanged: (isOpened) {
        homeController.isDrawerOpen.value = isOpened;
      },

      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.green,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Dow",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "0.23%",
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "39261.03",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            Text(
                              "(+90.79)",
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return VerticalDivider(
                    color: Colors.grey.shade800,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar.secondary(
                controller: tabController,
                dividerColor: Colors.grey.shade800,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                // indicatorSize: TabBarIndicatorSize.label,
                tabAlignment: TabAlignment.start,
                unselectedLabelStyle: TextStyle(color: Colors.grey.shade400),
                tabs: const [
                  Tab(
                    text: "Stocks",
                  ),
                  Tab(
                    text: "Cryptos",
                  ),
                  Tab(
                    text: "Currencies",
                  ),
                ]),
            Flexible(
              child: TabBarView(controller: tabController, children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 35, bottom: 20),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 35, left: 40, right: 40, top: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.add_circle,
                              color: Colors.white,
                              size: 45,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "There are no added stocks",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Press  +  botton to add preferred stocks to your Watchlist.",
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 8),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Stocks",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 107,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.only(
                                    right: 30, left: 15, top: 10, bottom: 10),
                                width: MediaQuery.of(context).size.width * 0.49,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(10)),
                                // color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Tesla",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text("•  TSLA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        const Text("\$171.11",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              right: 3,
                                              left: 3,
                                              bottom: 2,
                                              top: 2),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade900,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            children: [
                                              Transform.rotate(
                                                  angle: 0.8,
                                                  child: const Icon(
                                                    Icons.arrow_upward_rounded,
                                                    color: Colors.green,
                                                    size: 15,
                                                  )),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              const Text(
                                                "2.73",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 13),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Text(
                                      "(+1.62%)",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 15,
                              );
                            },
                            itemCount: 5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "US Stock Movers",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                onTap: () {
                                  isSelect = 0;
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: isSelect == 0
                                          ? Colors.grey
                                          : Colors.black,
                                      border: Border.all(
                                          color: Colors.grey.shade800),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  child: const Center(
                                      child: Text(
                                    "Gainers",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                onTap: () {
                                  isSelect = 1;
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: isSelect == 1
                                          ? Colors.grey
                                          : Colors.black,
                                      border: Border.all(
                                          color: Colors.grey.shade800),
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: const Center(
                                      child: Text(
                                    "Losers",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      isSelect == 0
                          ? ListView.separated(
                              shrinkWrap: true,
                              itemCount: 5,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: const Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text("STAA",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Text(
                                            "\$45.51",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  "STAAR Surgical Company",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12))),
                                          Text(
                                            "+6.44 • ",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            "+16.48%",
                                            style:
                                                TextStyle(color: Colors.green),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.grey,
                                );
                              },
                            )
                          : isSelect == 1
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 10),
                                      child: const Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text("LW",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              Text(
                                                "\$81.53",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      "Lamb Weston Holdings, Inc.",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12))),
                                              Text(
                                                "-19.59 • ",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "-19.37%",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      color: Colors.grey,
                                    );
                                  },
                                )
                              : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ETF Movers",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "See All",
                          //   style: TextStyle(color: Colors.grey),
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                onTap: () {
                                  isSelect1 = 0;
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: isSelect1 == 0
                                          ? Colors.grey
                                          : Colors.black,
                                      border: Border.all(
                                          color: Colors.grey.shade800),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  child: const Center(
                                      child: Text(
                                        "Gainers",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                onTap: () {
                                  isSelect1 = 1;
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: isSelect1 == 1
                                          ? Colors.grey
                                          : Colors.black,
                                      border: Border.all(
                                          color: Colors.grey.shade800),
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: const Center(
                                      child: Text(
                                        "Losers",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      isSelect1 == 0
                          ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: 5,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text("STAA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.bold))),
                                    Text(
                                      "\$45.51",
                                      style:
                                      TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            "STAAR Surgical Company",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12))),
                                    Text(
                                      "+6.44 • ",
                                      style:
                                      TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "+16.48%",
                                      style:
                                      TextStyle(color: Colors.green),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          );
                        },
                      )
                          : isSelect1 == 1
                          ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: 5,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            child: const Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text("LW",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight
                                                    .bold))),
                                    Text(
                                      "\$81.53",
                                      style: TextStyle(
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            "Lamb Weston Holdings, Inc.",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12))),
                                    Text(
                                      "-19.59 • ",
                                      style: TextStyle(
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      "-19.37%",
                                      style: TextStyle(
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          );
                        },
                      )
                          : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ETF Movers",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              // height: 100,
                              width: MediaQuery.of(context).size.width,
                              // margin: EdgeInsets.symmetric(horizontal: 20),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [

                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          // CircleAvatar(
                                          //   maxRadius: 10,
                                          // ),
                                          // SizedBox(
                                          //   width: 10,
                                          // ),
                                          Text(
                                            "BNN News",
                                            style: TextStyle(
                                                color: Colors.white54),
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
                                                  color:
                                                  Colors.white54)),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                            child: Text("4/3/2024",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color:
                                                    Colors.white54)),
                                          ),
                                          Icon(Icons.more_horiz_rounded,color: Colors.white54,)
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
                                            width: MediaQuery.of(context).size.width*0.18,
                                            height: MediaQuery.of(context).size.height*0.08,
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons
                                                .thumb_up_alt_outlined,
                                            color: Colors.white54,
                                            size: 19,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "0",
                                            style: TextStyle(
                                                color: Colors.white),
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
                                                  color:
                                                  Colors.white54)),
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
                                                  color:
                                                  Colors.white54)),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("India",
                                              style: TextStyle(
                                                  color:
                                                  Colors.white54))
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(color: Colors.grey.shade800,indent: 10,endIndent: 10,);
                          },
                          itemCount: 5),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular Cryptocurrencies",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 107,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.separated(
                            padding: const EdgeInsets.only(left: 10),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      right: 30, left: 15, top: 10, bottom: 10),
                                  width: MediaQuery.of(context).size.width * 0.49,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade900,
                                      borderRadius: BorderRadius.circular(10)),
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Ethena",
                                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                          ),
                                          Text("•  ENA",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10))
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          const Text("\$1.11",
                                              style:
                                              TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 3,
                                                left: 3,
                                                bottom: 2,
                                                top: 2),
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade900,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: Row(
                                              children: [
                                                Transform.rotate(
                                                    angle: 0.8,
                                                    child: const Icon(
                                                      Icons.arrow_upward_rounded,
                                                      color: Colors.green,
                                                      size: 15,
                                                    )),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                const Text(
                                                  "2.73",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 13),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 15,
                                );
                              },
                              itemCount: 5),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Crypot News",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                // height: 100,
                                width: MediaQuery.of(context).size.width,
                                // margin: EdgeInsets.symmetric(horizontal: 20),
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [

                                        const Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            // CircleAvatar(
                                            //   maxRadius: 10,
                                            // ),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            Text(
                                              "BNN News",
                                              style: TextStyle(
                                                  color: Colors.white54),
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
                                                    color:
                                                    Colors.white54)),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("4/3/2024",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color:
                                                    Colors.white54)),

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
                                              width: MediaQuery.of(context).size.width*0.18,
                                              height: MediaQuery.of(context).size.height*0.08,
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
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons
                                                  .thumb_up_alt_outlined,
                                              color: Colors.white54,
                                              size: 19,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "0",
                                              style: TextStyle(
                                                  color: Colors.white),
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
                                                    color:
                                                    Colors.white54)),
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
                                                    color:
                                                    Colors.white54)),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                              child: Text("India",
                                                  style: TextStyle(
                                                      color:
                                                      Colors.white54)),
                                            ),
                                            Icon(Icons.more_horiz_rounded,color: Colors.white54,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(color: Colors.grey.shade800,indent: 10,endIndent: 10,);
                            },
                            itemCount: 5),
                      ],
                    ),
                  ),
                ),
               SingleChildScrollView(
                 child: Padding(
                   padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text("Currencies",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                       const SizedBox(height: 10,),
                       ListView.separated(
                         shrinkWrap: true,
                           itemCount: 5,
                         itemBuilder: (context, index) {
                         return const Column(
                           children: [
                             SizedBox(height: 10,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("EUR/USD",style: TextStyle(color: Colors.white),),
                                 Text("0.92",style: TextStyle(color: Colors.white))
                               ],
                             ),
                             Row(
                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Expanded(child: Text("Euro US Dollar",style: TextStyle(color: Colors.grey,fontSize: 12),)),
                                 Text("+0.000",style: TextStyle(color: Colors.grey,fontSize: 12)),
                                 SizedBox(width: 2,),
                                 Text("•",style: TextStyle(color: Colors.grey,fontSize: 12)),
                                 SizedBox(width: 2,),
                                 Text("+0.048%",style: TextStyle(color: Colors.green,fontSize: 12)),
                               ],
                             ),
                             SizedBox(height: 10,)
                           ],
                         );
                       }, separatorBuilder: (context, index) {
                         return Divider(indent: 2,endIndent: 2,color: Colors.grey.shade800,);
                       }, )
                     ],
                   ),
                 ),
               )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
