import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/home_controller.dart';

HomeController homeController = Get.find();

// Widget BottomDesing (){
//   return BottomAppBar(color:Colors.black87,child:
//   Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       InkWell(
//           onTap: () {
//             homeController.selectedPosition.value = 0;
//           },
//           child:Column(
//             children: [
//               Icon(Icons.home,color: homeController.selectedPosition.value ==0?Colors.white:Colors.grey,size: 18,),
//               Text('Home',style: TextStyle(color: homeController.selectedPosition.value ==0?Colors.white:Colors.grey,fontSize: 12),),
//               homeController.selectedPosition.value ==0?Text("•",style: TextStyle(color: Colors.red,fontSize: 15),):SizedBox()
//             ],
//           )
//       ),
//       InkWell(
//
//           onTap: () {
//             homeController.selectedPosition.value = 1;
//           },
//           child: Column(
//             children: [
//               Icon(Icons.language,color: homeController.selectedPosition.value ==1?Colors.white:Colors.grey,size: 18,),
//               Text('Explore',style: TextStyle(color: homeController.selectedPosition.value ==1?Colors.white:Colors.grey,fontSize: 12),),
//               homeController.selectedPosition.value ==1?Text("•",style: TextStyle(color: Colors.red,fontSize: 15),):SizedBox()
//             ],
//           )
//       ),
//       InkWell(
//           onTap: () {
//             homeController.selectedPosition.value = 2;
//           },
//           child: Column(
//             children: [
//               Icon(Icons.add_circle_outline_sharp,color: homeController.selectedPosition.value ==2?Colors.white:Colors.grey,size: 18,),
//               Text('Post',style: TextStyle(color: homeController.selectedPosition.value ==2?Colors.white:Colors.grey,fontSize: 12),),
//               homeController.selectedPosition.value ==2?Text("•",style: TextStyle(color: Colors.red,fontSize: 15),):SizedBox()
//             ],
//           )
//       ),
//       InkWell(
//           onTap: () {
//             homeController.selectedPosition.value = 3;
//           },
//           child: Column(
//             children: [
//               Icon(Icons.chat_bubble_outline,color: homeController.selectedPosition.value ==3?Colors.white:Colors.grey,size: 18,),
//               Text('Chatroom',style: TextStyle(color: homeController.selectedPosition.value ==3?Colors.white:Colors.grey,fontSize: 12),),
//               homeController.selectedPosition.value ==3?Text("•",style: TextStyle(color: Colors.red,fontSize: 15),):SizedBox()
//             ],
//           )
//       ),
//       InkWell(
//           onTap: () {
//             homeController.selectedPosition.value = 4;
//           },
//           child: Column(
//             children: [
//               Icon(Icons.monetization_on_outlined,color:homeController.selectedPosition.value ==4?Colors.white:Colors.grey,size: 18,),
//               Text('Finance',style: TextStyle(color: homeController.selectedPosition.value ==4?Colors.white:Colors.grey,fontSize: 12),),
//               homeController.selectedPosition.value ==4?Text("•",style: TextStyle(color: Colors.red,fontSize: 15),):SizedBox()
//             ],
//           )
//       ),
//     ],
//   ),
//
//   );
// }