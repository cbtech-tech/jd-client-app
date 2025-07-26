import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_delivery/constants/image_constants.dart';
import 'package:just_delivery/customWidgets/customLoader.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';
import 'package:shimmer/shimmer.dart';
import '../../customWidgets/shimmer_effects.dart';
import '../dashboard_screen/view_report/pdfController.dart';
import 'live_tracking_home_controller.dart';

class LiveTrackingScreen extends GetView<LiveTrackingHomeController> {
  const LiveTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PdfDownloadController pdfController = Get.put(
      PdfDownloadController(),
    );
    // bool liveStatus =
    //     controller.liveTrackingModel?.assignedVehicle?.delayStatus ?? false;
    return Obx(
      () => Scaffold(
        backgroundColor: Color(0xffd2f8e1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          toolbarHeight: 65,
          titleSpacing: 16,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.startPointName.value.isEmpty
                  ? TextShimmerEffect(height: 15.0, width: 100.0)
                  : Text(
                    controller.startPointName.value,
                    style: CustomTextStyle.subHeading(fontSize: 19.sp),
                  ),
              const SizedBox(height: 4),
              controller.storeName.value.isEmpty
                  ? TextShimmerEffect(height: 15, width: 100)
                  : Row(
                    children: [
                      CircleAvatar(
                        radius: 4,

                        backgroundColor:
                            controller.delayStatus.value
                                ? Colors.amber
                                : Color(0xff167938),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        controller.delayStatus.value
                            ? 'Delay'
                            : "Pickup On-time",
                        style: CustomTextStyle.body(
                          fontSize: 14.sp,
                          color:
                              controller.delayStatus.value
                                  ? Colors.amber
                                  : Color(0xff167938),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
            ],
          ),
          actions: [
            IconButton.filled(
              onPressed: () async {
                LoaderUtil.showLoader();
                await controller.fetchLiveData();
                LoaderUtil.hideLoader();
              },
              icon: Icon(Icons.refresh, size: 20),
              style: IconButton.styleFrom(
                backgroundColor: Color(0xffF5F5F5), // Light grey background
                foregroundColor: Colors.black, // Icon color
                shape: const CircleBorder(), // Circle shape
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    final url = controller.pdfUrl.toString();
                    final orderId = controller.orderId.toString();
                    final fileName = "consignment-$orderId.pdf";

                    if (url.isNotEmpty) {
                      pdfController.openPdfFromUrl(url, fileName);
                    } else {
                      Get.snackbar("Error", "PDF URL not available");
                    }
                  },

                  child: Image.asset(
                    ImageConstants.circularDownload,
                    width: Get.width * 0.10,
                  ),
                ),
              ),
            ),
          ],
        ),

        body: Stack(
          children: [
            Obx(
              () => GoogleMap(
                polylines: controller.polyLines.value,
                onMapCreated:
                    (mapController) => controller.onMapCreated(mapController),
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    controller.liveTrackingModel?.data?.lat ?? 22.303,
                    controller.liveTrackingModel?.data?.lng ?? 77.2090,
                  ),
                  zoom: 14,
                ),
                markers: controller.markers.toSet(), // convert RxSet to Set
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                // style: '''[
                //   {
                //     "elementType": "labels",
                //     "stylers": [{"visibility": "off"}]
                //   },
                //   {
                //     "featureType": "administrative",
                //     "elementType": "labels",
                //     "stylers": [{"visibility": "off"}]
                //   },
                //   {
                //     "featureType": "poi",
                //     "stylers": [{"visibility": "off"}]
                //   },
                //   {
                //     "featureType": "road",
                //     "elementType": "labels",
                //     "stylers": [{"visibility": "off"}]
                //   },
                //   {
                //     "featureType": "transit",
                //     "stylers": [{"visibility": "off"}]
                //   },
                //   {
                //     "featureType": "water",
                //     "stylers": [{"visibility": "simplified"}]
                //   }
                // ]''',
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(() {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  constraints: BoxConstraints(maxHeight: Get.height * 0.4),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png', //use profile image from api
                            ),
                          ),
                          title: const Text(
                            'Delivery Manager',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                          subtitle:
                              controller.driverName.value.isEmpty
                                  ? TextShimmerEffect(height: 15, width: 100)
                                  : Text(
                                    controller.driverName.value,
                                    style: CustomTextStyle.subHeading(
                                      fontSize: 15,
                                    ),
                                  ),
                          trailing:
                              controller.driverName.value.isEmpty
                                  ? SizedBox()
                                  : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // SvgPicture.asset(ImageConstants.chatSvg),
                                      // const SizedBox(width: 15),
                                      InkWell(
                                        onTap: () => controller.makePhoneCall(),
                                        child: SvgPicture.asset(
                                          ImageConstants.callSvg,
                                        ),
                                      ),
                                    ],
                                  ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left side info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controller.orderId.value.isEmpty
                                      ? TextShimmerEffect(
                                        height: 15,
                                        width: 100,
                                        verticalMargin: 2,
                                      )
                                      : Text("#${controller.orderId.value}"),
                                  controller.temp.value.isEmpty
                                      ? TextShimmerEffect(
                                        height: 15,
                                        width: 100,
                                        verticalMargin: 2,
                                      )
                                      : Text(
                                        "Temp: ${controller.temp.value}°C",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                  controller.vehicleNumber.value.isEmpty
                                      ? TextShimmerEffect(
                                        height: 15,
                                        width: 100,
                                        verticalMargin: 2,
                                      )
                                      : Text(
                                        "Plate: ${controller.vehicleNumber.value}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ],
                              ),
                            ),

                            // Right side truck image
                            Image.asset(
                              ImageConstants
                                  .truck1Img, // Replace with your asset path
                              width: Get.width * 0.40, // Responsive width
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),

                        SizedBox(height: 15.0),
                        TimelineStepper(
                          steps: [
                            TimelineStep(
                              timeLabel: "4:00PM",
                              isCompleted: true,
                            ),
                            TimelineStep(
                              timeLabel: "12:00PM",
                              isCompleted: true,
                              isCurrent: true,
                            ),

                            TimelineStep(
                              timeLabel: "2:00PM",
                              isCompleted: false,
                            ),
                            TimelineStep(
                              timeLabel: "4:00PM",
                              isCompleted: false,
                            ),
                            TimelineStep(timeLabel: "ETA", isCompleted: false),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class TimelineStep {
  final String timeLabel;
  final bool isCompleted;
  final bool isCurrent;

  TimelineStep({
    required this.timeLabel,
    this.isCompleted = false,
    this.isCurrent = false,
  });
}

// class TimelineStepper extends StatelessWidget {
//   final List<TimelineStep> steps;

//   const TimelineStepper({super.key, required this.steps});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start, // Keeps everything aligned
//       children: List.generate(steps.length * 2 - 1, (index) {
//         if (index.isOdd) {
//           final prev = steps[(index - 1) ~/ 2];
//           final next = steps[(index + 1) ~/ 2];
//           final isDone = prev.isCompleted && next.isCompleted;

//           return Expanded(
//             child: Align(
//               alignment: Alignment.center,
//               child: Container(
//                 margin: const EdgeInsets.only(
//                   top: 11,
//                 ), // align to center of 24px dot
//                 height: 2,
//                 color: isDone ? Colors.green : Colors.grey.shade300,
//               ),
//             ),
//           );
//         } else {
//           final step = steps[index ~/ 2];

//           return Column(
//             children: [
//               Container(
//                 width: 24,
//                 height: 24,
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 decoration: BoxDecoration(
//                   color: step.isCompleted ? Colors.green : Colors.grey.shade400,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Center(
//                   child:
//                       step.isCompleted
//                           ? (step.isCurrent
//                               ? const Icon(
//                                 Icons.autorenew,
//                                 size: 14,
//                                 color: Colors.white,
//                               )
//                               : const Icon(
//                                 Icons.check,
//                                 size: 14,
//                                 color: Colors.white,
//                               ))
//                           : null,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 step.timeLabel,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: step.isCompleted ? Colors.green : Colors.grey,
//                 ),
//               ),
//             ],
//           );
//         }
//       }),
//     );
//   }
// }

class TimelineStepper extends StatelessWidget {
  final List<TimelineStep> steps;

  const TimelineStepper({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Top row: Icons + Connectors
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(steps.length * 2 - 1, (index) {
              if (index.isOdd) {
                // Connector between two steps
                final isDone =
                    steps[(index - 1) ~/ 2].isCompleted &&
                    (index + 1 < steps.length * 2 - 1
                        ? steps[(index + 1) ~/ 2].isCompleted
                        : false);
                return Expanded(
                  child: Container(
                    height: 2,
                    color: isDone ? Color(0xff167938) : Colors.grey.shade300,
                  ),
                );
              } else {
                final step = steps[index ~/ 2];
                return Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color:
                        step.isCompleted
                            ? Color(0xff167938)
                            : Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child:
                        step.isCompleted
                            ? step.isCurrent
                                ? const Icon(
                                  Icons.autorenew,
                                  size: 12,
                                  color: Colors.white,
                                )
                                : const Icon(
                                  Icons.check,
                                  size: 12,
                                  color: Colors.white,
                                )
                            : null,
                  ),
                );
              }
            }),
          ),
        ),

        const SizedBox(height: 6),

        // Bottom row: Time Labels with dynamic spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(steps.length, (index) {
            final step = steps[index];
            return SizedBox(
              width: 60, // Adjusted width for better spacing
              child: Center(
                child: Text(
                  step.timeLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: step.isCompleted ? Color(0xff167938) : Colors.grey,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

// class TimelineStepper extends StatelessWidget {
//   final List<TimelineStep> steps;

//   const TimelineStepper({super.key, required this.steps});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 70,
//       child: Row(
//         children: List.generate(steps.length * 2 - 1, (index) {
//           if (index.isOdd) {
//             // Connector line between circles
//             final isDone =
//                 steps[(index - 1) ~/ 2].isCompleted &&
//                 steps[(index + 1) ~/ 2].isCompleted;
//             return Expanded(
//               child: Container(
//                 height: 2,
//                 color: isDone ? Colors.green : Colors.grey.shade300,
//               ),
//             );
//           } else {
//             final step = steps[index ~/ 2];
//             return Column(
//               children: [
//                 CircleAvatar(
//                   radius: 10,
//                   backgroundColor:
//                       step.isCompleted ? Colors.green : Colors.grey.shade400,
//                   child:
//                       step.isCompleted
//                           ? Icon(
//                             step.isCurrent ? Icons.ac_unit : Icons.check,
//                             size: 12,
//                             color: Colors.white,
//                           )
//                           : null,
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   step.timeLabel,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: step.isCompleted ? Colors.green : Colors.grey,
//                   ),
//                 ),
//               ],
//             );
//           }
//         }),
//       ),
//     );
//   }
// }
