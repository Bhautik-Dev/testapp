import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> with TickerProviderStateMixin {
  late TabController tabController;
  int isSelect = -1;
  bool isShowMessageView = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     tabController =TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return isShowMessageView && isSelect == 0
        ? widgetMessageView()
        : isShowMessageView && isSelect == 1
            ? widgetNearbyShareView()
            : widgetChatRoomView();
  }

  widgetMessageView() {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 90,
        leading: IconButton(
            onPressed: () {
              isShowMessageView = false;
              setState(() {});
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        backgroundColor: Colors.grey.shade900,
        title: Text("Messages", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Icon(
            Icons.edit_square,
            color: Colors.white,
          ),
          SizedBox(
            width: 14,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.grey.shade900),
              child: Row(
                children: [
                  Flexible(
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
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          // focusColor: Colors.black12,
                          fillColor: Colors.grey.shade800,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Transform.rotate(
                      angle: 4.7,
                      child: Icon(
                        Icons.tune_rounded,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  widgetNearbyShareView() {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey.shade900),
      backgroundColor: Colors.black,
    );
  }
  widgetChatRoomView() {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.format_align_left_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Where do you want to go?",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.5,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      isSelect = 0;
                      setState(() {});
                    },
                    child: Container(
                      // margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(
                          horizontal: 14, vertical: 38),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: isSelect == 0
                                  ? Colors.red
                                  : Colors.grey.shade900),
                          color: Colors.grey.shade900),
                      child: Column(
                        children: [
                          Icon(
                            Icons.mail_outline_rounded,
                            color: Colors.white30,
                            size: 38,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Go to Messages",
                            style: TextStyle(color: Colors.white60),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "You have 0 new messages",
                            style: TextStyle(
                                fontSize: 10, color: Colors.white30),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      isSelect = 1;
                      setState(() {});
                    },
                    child: Container(
                      // margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(
                          horizontal: 14, vertical: 31),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: isSelect == 1
                                  ? Colors.red
                                  : Colors.grey.shade900),
                          color: Colors.grey.shade900),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white30,
                            size: 38,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Go to Nearby",
                            style: TextStyle(color: Colors.white60),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Browse and join Chat Rooms close to you",
                            style: TextStyle(
                                fontSize: 10, color: Colors.white30),
                          ),
                          // Text(
                          //   "",style: TextStyle(fontSize: 10,color: Colors.white30),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Spacer(),

            // SizedBox(height: 10,)
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          isShowMessageView = true;
          setState(() {});
          // if (isSelect == 0) {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => MessagesPage(),
          //       ));
          // } else if (isSelect == 1) {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => NearbyPage(),
          //       ));
          // } else {}
        },
        child: Container(
          height: 50,
          // alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(horizontal: 18, vertical: 15),

          decoration: BoxDecoration(
              color: isSelect == 0 || isSelect == 1
                  ? Colors.red
                  : Colors.grey.shade900,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
      ),
    );
  }
}
