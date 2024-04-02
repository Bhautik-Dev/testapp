import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with TickerProviderStateMixin {
  List<dynamic> blogList = [];
  late TabController tabController;
  bool isLoding=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    tabController=TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.drag_handle_outlined,color: Colors.white,),
          actions: [Icon(Icons.notifications,color: Colors.white,),SizedBox(width: 18,)],
          backgroundColor: Colors.black,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(height: 15,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search here...",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search_rounded,color: Colors.white,),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    // focusColor: Colors.black12,
                    fillColor: Colors.grey.shade800,
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                ),
              ),
            ),
            SizedBox(height: 15,),
            TabBar.secondary(
              controller: tabController,
              dividerColor: Colors.grey.shade800,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              isScrollable: true,
              tabAlignment:TabAlignment.start ,
              unselectedLabelStyle: TextStyle(color: Colors.grey.shade800),
              // labelPadding: EdgeInsets.symmetric(horizontal: 9),
              // padding: EdgeInsets.only(left: 10),
              tabs: [
                Tab(text: 'For you',),
                Tab(text: 'Following'),
                Tab(text: 'Breaking News'),
                Tab(text: 'Watch Now'),
                Tab(text: 'World'),

              ],
            ),
            Expanded(
              child: TabBarView(
                controller:tabController,
                children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Popular",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 380,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.red,
                              child: isLoding==true?Center(child: CircularProgressIndicator(color: Colors.red,)):ListView.builder(
                                shrinkWrap: true,
                                itemCount: blogList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 230,
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                    // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 250,
                                          width: 230,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: Image.network(
                                                "https://picsum.photos/250?image=9",
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Flexible(
                                          child: Text(
                                            blogList[index]["meta_description"].toString(),
                                            // overflow: TextOverflow.ellipsis,
                                            // maxLines: 3,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3, vertical: 3),
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(7)),
                                              child: (Text(
                                                "BNN News",
                                                style: TextStyle(color: Colors.white),
                                              )),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "2 min read",
                                              style: TextStyle(
                                                color: Colors.white30,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
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
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      maxRadius: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "BNN News",
                                                      style:
                                                      TextStyle(color: Colors.white54),
                                                    ),
                                                    Text("Now")
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
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.add_circle,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      "2 min read",
                                                      style:
                                                      TextStyle(color: Colors.white54),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text("Breking News",
                                                        style: TextStyle(
                                                            color: Colors.white54))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          CircleAvatar()
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
                  ),
                  Card(
                    margin: const EdgeInsets.all(16.0),
                    child: Center(
                        child: Text('Specifications tab')),
                  ),
                  Card(
                    margin: const EdgeInsets.all(16.0),
                    child: Center(
                        child: Text('Specifications tab')),
                  ),
                  Card(
                    margin: const EdgeInsets.all(16.0),
                    child: Center(
                        child: Text('Specifications tab')),
                  ),
                  Card(
                    margin: const EdgeInsets.all(16.0),
                    child: Center(
                        child: Text('Specifications tab')),
                  ),
                ],
              ),
            ),
          ],
        ),

    );
  }

  Future getdata() async {
    isLoding=true;
    var response = await http.get(Uri.parse(
        "http://194.195.86.168:9000/blog/get_all_blogs?user_id=939f432f-a986-4507-9df4-3f6f55e33686"));
    if(response.statusCode==200){
      isLoding=true;
      var data = jsonDecode(response.body);
      blogList=data['data'];
      isLoding=false;
      setState(() {});
    }
  }
}
