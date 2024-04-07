import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.list_outlined,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Finance",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 30,
              )),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
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
            SizedBox(
              height: 20,
            ),
            TabBar.secondary(
                controller: tabController,
                dividerColor: Colors.grey.shade800,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 30),
                // indicatorSize: TabBarIndicatorSize.label,
                tabAlignment: TabAlignment.start,
                unselectedLabelStyle: TextStyle(color: Colors.grey.shade400),
                tabs: [
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
                  padding: EdgeInsets.only(top: 35, bottom: 20),
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 35, left: 40, right: 40, top: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: Colors.white,
                              size: 45,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "There are no added stocks",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Press " +
                                  " botton to add preferred stocks to your Watchlist.",
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 8),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
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
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 107,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    right: 30, left: 15, top: 10, bottom: 10),
                                width: MediaQuery.of(context).size.width * 0.49,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(10)),
                                // color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
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
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Text("\$171.11",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
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
                                                  child: Icon(
                                                    Icons.arrow_upward_rounded,
                                                    color: Colors.green,
                                                    size: 15,
                                                  )),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
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
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
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
                              return SizedBox(
                                width: 15,
                              );
                            },
                            itemCount: 5),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
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
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                onTap: () {
                                  isSelect = 0;
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: isSelect == 0
                                          ? Colors.grey
                                          : Colors.black,
                                      border: Border.all(
                                          color: Colors.grey.shade800),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  child: Center(
                                      child: Text(
                                    "Gainers",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                onTap: () {
                                  isSelect = 1;
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: isSelect == 1
                                          ? Colors.grey
                                          : Colors.black,
                                      border: Border.all(
                                          color: Colors.grey.shade800),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Center(
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
                      SizedBox(
                        height: 20,
                      ),
                      isSelect == 0
                          ? ListView.separated(
                              shrinkWrap: true,
                              itemCount: 5,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
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
                                return Divider(
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
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
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
                                    return Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      color: Colors.grey,
                                    );
                                  },
                                )
                              : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
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
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                onTap: () {
                                  isSelect1 = 0;
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: isSelect1 == 0
                                          ? Colors.grey
                                          : Colors.black,
                                      border: Border.all(
                                          color: Colors.grey.shade800),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  child: Center(
                                      child: Text(
                                        "Gainers",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                onTap: () {
                                  isSelect1 = 1;
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: isSelect1 == 1
                                          ? Colors.grey
                                          : Colors.black,
                                      border: Border.all(
                                          color: Colors.grey.shade800),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Center(
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
                      SizedBox(
                        height: 20,
                      ),
                      isSelect1 == 0
                          ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: 5,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
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
                          return Divider(
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
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
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
                          return Divider(
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          );
                        },
                      )
                          : Container()
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Center(child: Text('Specifications tab')),
                ),
                Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Center(child: Text('Specifications tab')),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
