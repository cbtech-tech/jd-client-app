// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/route_manager.dart';
// import '../../../constants/image_constants.dart';
// import '../../../theme/theme_helper.dart';
// import '../../home_screen_live_tracking/live_tracking_binding.dart';
// import '../../home_screen_live_tracking/live_tracking_screen.dart';
// import 'home_controller.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final HomeController controller = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: PrimaryColors().lightBgColor,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(25),
//             bottomRight: Radius.circular(25),
//           ),
//         ),
//         title: Image.asset(ImageConstants.appLogo, width: Get.width * 0.4),
//         centerTitle: false,
//         toolbarHeight: 65, // Optional: bigger height
//         actions: [
//           IconButton(
//             onPressed: () {
//               controller.logout();
//             },
//             icon: Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Greeting
//             Text(
//               "Hi Blue Tokai!",
//               style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
//             ),
//             SizedBox(height: 10),

//             Text(
//               "Today Deliveries",
//               style: TextStyle(fontSize: 15.sp, color: Colors.grey[600]),
//             ),
//             SizedBox(height: 20),

//             // Delivery List
//             DeliveryListScreen(),

//             SizedBox(height: 20),

//             SvgPicture.asset(
//               "assets/images/logistic_logo.svg",
//               fit: BoxFit.contain,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DeliveryListScreen extends StatelessWidget {
//   DeliveryListScreen({super.key});
//   final List<Map<String, String>> cities = [
//     {"name": "Mumbai", "deliveries": "4"},
//     {"name": "Delhi", "deliveries": "4"},
//     {"name": "Chennai", "deliveries": "4"},
//     {"name": "Kolkata", "deliveries": "4"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // margin: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20), // Full rounded
//         boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
//         ],
//       ),
//       child: ListView.separated(
//         shrinkWrap: true,
//         itemCount: cities.length,
//         physics: NeverScrollableScrollPhysics(),
//         separatorBuilder:
//             (context, index) =>
//                 Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
//         itemBuilder: (context, index) {
//           final isFirst = index == 0;
//           final isLast = index == cities.length - 1;

//           return ClipRRect(
//             borderRadius: BorderRadius.vertical(
//               top: isFirst ? Radius.circular(20) : Radius.zero,
//               bottom: isLast ? Radius.circular(20) : Radius.zero,
//             ),
//             child: InkWell(
//               onTap: () {
//                 Get.to(
//                   () => LiveTrackingScreen(),
//                   binding: LiveTrackingBinding(),
//                   // id: 1,
//                 );
//               },
//               child: Container(
//                 color: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 30,
//                       backgroundColor: Colors.grey.shade300,
//                     ),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             cities[index]['name']!,
//                             style: TextStyle(
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           SizedBox(height: 6),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 10,
//                               vertical: 4,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.green.shade100,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Text(
//                               "Total Active Deliveries - ${cities[index]['deliveries']}",
//                               style: TextStyle(
//                                 fontSize: 13.sp,
//                                 color: Colors.green.shade800,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Icon(Icons.chevron_right, color: Colors.black, size: 30),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_delivery/customWidgets/shimmer_effects.dart';
import 'package:just_delivery/screens/dashboard_screen/bottomBindings.dart';
import 'package:just_delivery/screens/dashboard_screen/homeBottomScreen.dart';

import '../../../constants/image_constants.dart';
import '../../../theme/theme_helper.dart';
import '../../home_screen_live_tracking/live_tracking_binding.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColors().lightBgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        title: Image.asset(ImageConstants.appLogo, width: Get.width * 0.4),
        centerTitle: false,
        toolbarHeight: 65,
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return TodayDeliveryShimmerEffect();
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchTodaysData();
          },
          child:
              controller.deliveryList.isEmpty
                  ? Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text("No Data Found")),
                  )
                  : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: ListView(
                      children: [
                        Text(
                          "Hi ${controller.deliveryList.first.companyName.companyName}",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Today Deliveries",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 20),
                        DeliveryListScreen(),
                        // SizedBox(height: 20),
                        // Align(
                        //   alignment: Alignment.bottomCenter,
                        //   child: SvgPicture.asset(
                        //     "assets/images/logistic_logo.svg",
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
        );
      }),
    );
  }
}

class DeliveryListScreen extends StatelessWidget {
  DeliveryListScreen({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.deliveryList.length,
          separatorBuilder:
              (context, index) =>
                  Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
          itemBuilder: (context, index) {
            final item = controller.deliveryList[index];
            final isFirst = index == 0;
            final isLast = index == controller.deliveryList.length - 1;

            return ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: isFirst ? Radius.circular(20) : Radius.zero,
                bottom: isLast ? Radius.circular(20) : Radius.zero,
              ),
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => HomeBottomScreen2(),
                    binding: BottomBindings(),
                    arguments: {"id": item.id}, // ✅ Model property access
                  );
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(Icons.local_shipping, color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.startPointName,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 6),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "To - ${item.endPointName}",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Colors.black, size: 30),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
