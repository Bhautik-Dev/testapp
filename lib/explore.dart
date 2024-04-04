import 'package:flutter/material.dart';
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.format_align_left_rounded,
          color: Colors.white,
        ),

        backgroundColor: Colors.black,
        title: Text(
          "Explore",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
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
      ],
    ),
    );
  }
}
