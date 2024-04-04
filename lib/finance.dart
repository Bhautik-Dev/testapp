import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.list_outlined,color: Colors.white,), onPressed: () {  },),
        backgroundColor: Colors.black,
        title: Text("Finance",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
          }, icon:Icon(Icons.search_rounded,color: Colors.white,size: 30,)),
          SizedBox(width: 12,),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 40,
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
                          Icon(Icons.arrow_upward_rounded,color: Colors.green,size: 18,),
                          SizedBox(width: 5,),
                          Text("Dow",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 25,),
                          Text("0.23%",style: TextStyle(color: Colors.green),)
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("39261.03",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 11,),
                          Text("(+90.79)",style: TextStyle(color: Colors.green),)
                        ],
                      ),
                    ],),
                  );
                },
                separatorBuilder: (context, index) {
                  return VerticalDivider(color: Colors.grey.shade800,);
                },
              ),
            ),
            TabBar(
                controller: tabController,
                dividerColor: Colors.grey.shade800,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                isScrollable: true,
                // indicatorSize: TabBarIndicatorSize.label,
                tabAlignment: TabAlignment.start,
                unselectedLabelStyle: TextStyle(color: Colors.grey.shade400),
                tabs: [
              Tab(text: "Stocks",),
              Tab(text: "Cryptos",),
              Tab(text: "Currencies",),
            ]),
            Flexible(
              child: TabBarView(
                  controller: tabController,
                  children: [
                Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Center(child: Text('Specifications tab')),
                ),
                Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Center(child: Text('Specifications tab')),
                ),
                Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Center(child: Text('Specifications tab')),
                ),
              
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
