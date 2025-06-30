import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:just_delivery/theme/theme_helper.dart';

import '../../../customWidgets/textStyle.dart';
import 'menuListController.dart';

class MenuListScreen extends GetView<MenuListController>{

   const MenuListScreen({super.key});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: PrimaryColors().lightBgColor,
     appBar:AppBar(
       automaticallyImplyLeading: false,
       backgroundColor: Colors.transparent,
       title: Row(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [
               Text(
                 "Just Deliveries",
                 style: CustomTextStyle.subHeading(color: ThemeHelper().appColor,fontSize: 18)
               ),
               Text(
                 "12345678890",
                   style: CustomTextStyle.body(fontSize: 15)

               ),
             ],
           ),
         ],
       ),
     ),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.only(left: 15.0,top: 10,right: 15),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Text("settings".tr,
                 style: CustomTextStyle.body(fontSize: 17,color: PrimaryColors().darkGrey,)
             ),

             Container(
               height: Get.height*0.22,
               margin: EdgeInsets.only(top: 15),
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: const BorderRadius.all(
                     Radius.circular(15)
                 ),
               ),

               child: Column(
                 children: [
                   Row(
                     children: [
                       Icon(Icons.dashboard_outlined),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                         Text("dashboard".tr, style:CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                         ),

                       ],)



                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 30.0,right: 10,top: 10),
                     child: Divider(),
                   ),

                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Icon(Icons.payment),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                           Text("Payment".tr, style:CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                           ),

                         ],)



                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 30.0,right: 10,top: 10),
                     child: Divider(),
                   ),

                   SizedBox(height: 10,),


                   Row(
                     children: [
                       Icon(Icons.location_on_outlined),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                           Text("Update Addresses".tr, style:CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                           ),

                         ],)



                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 30.0,right: 10,top: 10),
                     child: Divider(),
                   ),


                   SizedBox(height: 10,),


                   Row(
                     children: [
                       Icon(Icons.settings),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                           Text("Account settings".tr, style:CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                           ),

                         ],)



                     ],
                   ),



                 ],
               ),

             ),


             SizedBox(height: 10,),
             Text("Support".tr,
                 style: CustomTextStyle.body(fontSize: 17,color: PrimaryColors().darkGrey,)
             ),

             Container(
               height: Get.height*0.055,
               margin: EdgeInsets.only(top: 15),
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: const BorderRadius.all(
                     Radius.circular(15)
                 ),
               ),

               child: Column(
                 children: [
                   Row(
                     children: [
                       Icon(Icons.help_outline),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                           Text("Help".tr, style:CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                           ),

                         ],)



                     ],
                   ),

                 ],
               ),

             ),


             SizedBox(height: 10,),
             Text("Legal".tr,
                 style: CustomTextStyle.body(fontSize: 17,color: PrimaryColors().darkGrey,)
             ),

             Container(
               height: Get.height*0.17,
               margin: EdgeInsets.only(top: 15),
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: const BorderRadius.all(
                     Radius.circular(15)
                 ),
               ),

               child: Column(
                 children: [
                   Row(
                     children: [
                       Icon(Icons.file_copy_sharp),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                           Text("View Contract".tr, style:CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                           ),

                         ],)

                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 30.0,right: 10,top: 10),
                     child: Divider(),
                   ),

                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Icon(Icons.lock_outline),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                           Text("Privacy".tr, style:CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                           ),

                         ],)

                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 30.0,right: 10,top: 10),
                     child: Divider(),
                   ),

                   SizedBox(height: 10,),


                   Row(
                     children: [
                       Icon(Icons.document_scanner),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                           Text("Terms and Condition ".tr, style:CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                           ),

                         ],)



                     ],
                   ),



                 ],
               ),

             ),


             SizedBox(height: 10,),
             Text("Others".tr,
                 style: CustomTextStyle.body(fontSize: 17,color: PrimaryColors().darkGrey,)
             ),

             Container(
               height: Get.height*0.11,
               margin: EdgeInsets.only(top: 15),
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: const BorderRadius.all(
                     Radius.circular(15)
                 ),
               ),

               child: Column(
                 children: [
                   Row(
                     children: [
                       Icon(Icons.info_outline_rounded),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                           Text("About us".tr, style: CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                           ),

                         ],)

                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 30.0,right: 10,top: 10),
                     child: Divider(),
                   ),

                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Icon(Icons.logout_sharp),
                       SizedBox(width: 10,),

                       Column(
                         children: [
                           Text("Logout".tr, style: CustomTextStyle.body(fontSize: 16,color: PrimaryColors().black900,)
                           ),

                         ],)

                     ],
                   ),



                 ],
               ),

             ),


           ],
         ),
       ),
     ),



   );
  }




}