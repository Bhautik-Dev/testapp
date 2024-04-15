import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class BlogFullPage extends StatefulWidget {
  const BlogFullPage({super.key});

  @override
  State<BlogFullPage> createState() => _BlogFullPageState();
}

class _BlogFullPageState extends State<BlogFullPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(right: 20, left: 10,),
              child: Html(
                data:
                    "Elton Jantjies' Career Hangs in the Balance Following Failed Drug Test",
                style: {
                  "body": Style(
                    color: Colors.white,
                    fontSize: FontSize(24.0),
                    fontWeight: FontWeight.bold,
                  ),
                },
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("BNN News",
                                style: TextStyle(color: Colors.white54)),
                            Icon(
                              Icons.verified_outlined,
                              color: Colors.red,
                            )
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Breking News",
                              style: TextStyle(color: Colors.white54),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("•",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                            SizedBox(
                              width: 2,
                            ),
                            Text("4/3/2024",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white54))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.white)),
                    child: Transform.rotate(
                        angle: 5.5,
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.grey,
                          size: 18,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              // height: 250,
              width: MediaQuery.of(context).size.width,
              height: Get.height * 0.28,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://static.toiimg.com/photo/msid-88579058/88579058.jpg?pl=37494",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 10),
              child: Html(
                data:
                    """<p>Elton Jantjies, a well-renowned South African rugby player, has taken the rugby world by surprise by disclosing a recent failed drug test.Jantjies plays in the flyhalf position and his revelation has sparked concerns about his future in the sport. The specific details about the substance that led to the positive test result, the timing of the test, and the potential consequences Jantjies might face have not been disclosed.</p>""",
                style: {
                  "body": Style(
                    color: Colors.white,
                    fontSize: FontSize(15.0),
                    // fontWeight: FontWeight.bold,
                  ),
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 10),
              child: Html(
                data:
                   """<h2>Potential Impact on Team Performance</h2>""",
                style: {
                  "body": Style(
                    color: Colors.white,
                    fontSize: FontSize(15.0),
                    // fontWeight: FontWeight.bold,
                  ),
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 10),
              child: Html(
                data:
                """<p>The news of Jantjies' failed drug test could significantly influence his position within the team and subsequently, the team's performance in future games. Given the potential repercussions, this unexpected revelation could trigger an unsettling period for the team, disrupting their harmony and performance on the field.</p>""",
                style: {
                  "body": Style(
                    color: Colors.white,
                    fontSize: FontSize(15.0),
                    // fontWeight: FontWeight.bold,
                  ),
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 10),
              child: Html(
                data:
                """<h2>Investigations and Actions by Governing Bodies Expected</h2>""",
                style: {
                  "body": Style(
                    color: Colors.white,
                    fontSize: FontSize(15.0),
                    // fontWeight: FontWeight.bold,
                  ),
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 10),
              child: Html(
                data:
                """<p>The governing bodies of the sport are anticipated to carry out further investigations into this matter. Based on their findings, appropriate action will be taken. The South African Institute for Drug-Free Sport, the organization in charge of testing, could potentially play a prominent role in these investigations.</p>""",
                style: {
                  "body": Style(
                    color: Colors.white,
                    fontSize: FontSize(15.0),
                    // fontWeight: FontWeight.bold,
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
