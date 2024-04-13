import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/widget/custom_drawer.dart';
import 'controller/home_controller.dart';


class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> with TickerProviderStateMixin {
  HomeController homeController=Get.find();
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
      key: homeController.drawaerkey,
      appBar: AppBar(
        // toolbarHeight: 90,
        leading: IconButton(
            onPressed: () {
              isShowMessageView = false;
              setState(() {});
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        backgroundColor: Colors.grey.shade900,
        title: const Text("Messages", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: const [
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
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(color: Colors.grey.shade900),
                  child: Row(
                    children: [
                      Flexible(
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
                                  const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              // focusColor: Colors.black12,
                              fillColor: Colors.grey.shade800,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Transform.rotate(
                          angle: 4.7,
                          child: const Icon(
                            Icons.tune_rounded,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ],
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
      key: homeController.drawaerkey,
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(Icons.format_align_left_rounded),
          color: Colors.white, onPressed: () {
          homeController.drawaerkey.currentState!.openDrawer();
          homeController.isDrawerOpen.value = true;
        },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          "Where do you want to go?",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.5,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      onDrawerChanged: (isOpened) {
        homeController.isDrawerOpen.value = isOpened;
      },
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,

              // mainAxisAlignment: MainAxisAlignment,
              children: [
                IntrinsicHeight(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,

                              crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            isSelect = 0;
                            setState(() {});
                          },
                          child: Container(
                            width: Get.width,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                 vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: isSelect == 0
                                        ? Colors.red
                                        : Colors.grey.shade900),
                                color: Colors.grey.shade900),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    textAlign: TextAlign.center,
                                    "You have 0 new messages",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white30),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            isSelect = 1;
                            setState(() {});
                          },
                          child: Container(
                            // height: Get.height*0.2,
                            width: Get.width,
                            margin: const EdgeInsets.symmetric(horizontal: 10,),
                            padding: const EdgeInsets.symmetric(
                                 vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: isSelect == 1
                                        ? Colors.red
                                        : Colors.grey.shade900),
                                color: Colors.grey.shade900),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                    ],
                  ),
                ),
                // Spacer(

                // SizedBox(height: 10,)
              ],
            ),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                isShowMessageView = true;
                setState(() {});

              },
              child: Container(
                height: 50,
                // alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),

                decoration: BoxDecoration(
                    color: isSelect == 0 || isSelect == 1
                        ? Colors.red
                        : Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],

        ),
      ),
    );
  }

}
