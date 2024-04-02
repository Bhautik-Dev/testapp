import 'dart:convert';
import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> blogList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "BlogApp",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Text(
                          "Abcd",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 30,
                        );
                      },
                      itemCount: 10),
                ),
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
                  child: ListView.builder(
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
                            Expanded(
                              child: Text(
                                blogList[index]["meta_description"].toString() ,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
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
                          padding: EdgeInsets.symmetric(horizontal: 20),
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
        ));
  }

  Future getdata() async {
    var response = await http.get(Uri.parse(
        "http://194.195.86.168:9000/blog/get_all_blogs?user_id=939f432f-a986-4507-9df4-3f6f55e33686"));
    print(response.statusCode);
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      blogList=data['data'];
      setState(() {

      });
    }
  }
}
