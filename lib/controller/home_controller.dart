import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxInt selectedPosition = 0.obs;

  RxBool isDrawerOpen = false.obs;
  final GlobalKey<ScaffoldState> drawaerkey = GlobalKey();

  // Drawer List
  List<dynamic> bNewsList = [
    "Accidents",
    "Climate & Environment",
    "Crime",
    "Energy",
    "Foreign Affairs",
    "Health",
    "Human Rights",
    "Migrants",
    "Protests",
    "Social",
    "War"
  ];
  List<dynamic> politicsList = ["Courts & Law", "Fact Checker", "Flashbacks"];
  List<dynamic> sportsList = [
    "Baseball",
    "Boxing & MMA",
    "Cricket",
    "Cycling",
    "Football",
    "Formula 1",
    "Golf",
    "Hockey",
    "NBA",
    "NFL",
    "Others",
    "Rugby",
    "Skating",
    "Tennis",
    "Winter sports",
    "Wrestling"
  ];
  List<dynamic> techList = [
    "AI & ML",
    "Cybersecurity",
    "Innovations",
    "Science & Technology",
    "Start-ups"
  ];
  List<dynamic> financeList = [
    "Business",
    "Cryptocurrency",
    "Currencies",
    "Emerging Markets",
    "Inflation",
    "Investments",
    "Stock Markets",
    "Trading"
  ];
  List<dynamic> lifeList = ["Fitness", "Food", "Spirituality", "Travel"];
  List<dynamic> worldlist = [
    ExpansionTile(
      // backgroundColor: Colors.black,
      iconColor: Colors.white,
      textColor: Colors.white,
      collapsedTextColor: Colors.white,
      collapsedIconColor: Colors.white,
      title:
          Text("Africa", style: TextStyle(color: Colors.white, fontSize: 20)),
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Text(
              "Bhautik",
              style: TextStyle(color: Colors.white, fontSize: 18),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 15,
            );
          },
        )
      ],
    ),
    ExpansionTile(
      // backgroundColor: Colors.black,
      iconColor: Colors.white,
      textColor: Colors.white,
      collapsedTextColor: Colors.white,
      collapsedIconColor: Colors.white,
      title:
          Text("Oceania", style: TextStyle(color: Colors.white, fontSize: 20)),
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Text(
              "Bhautik",
              style: TextStyle(color: Colors.white, fontSize: 18),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 15,
            );
          },
        )
      ],
    ),
  ];
  List<dynamic> artsList = [
    "Artists/Artwork",
    "Biographies",
    "Bollywood",
    "Books",
    "Gaming",
    "Hollywood",
    "K-Pop",
    "Music",
    "OTT"
  ];
  List<dynamic> confictList = [
    "Insecurity",
    "Security",
    "Military"
  ];

RxList<dynamic> getDataList=[].obs;
  RxBool isLoding = false.obs;

  getData() async {
    getDataList.clear();
    isLoding=true.obs;
    var responce = await http.get(Uri.parse("https://api.bnn.network/api/v1/post/1505190"));
    if(responce.statusCode==200){
      isLoding=true.obs;
      var data = jsonDecode(responce.body);
      getDataList.add(data['data']);
      isLoding=false.obs;
    }
  }
}
