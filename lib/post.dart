import 'package:flutter/material.dart';
class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
            title: Text("Create Post",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          Text("Publish",style: TextStyle(color: Colors.grey),),
          SizedBox(
            width: 15,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
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
            )
          ],
        ),
      ),
    );
  }
}
