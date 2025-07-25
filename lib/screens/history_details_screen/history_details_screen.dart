import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_delivery/constants/image_constants.dart';
import 'package:just_delivery/customWidgets/customButtom.dart';
import 'package:just_delivery/customWidgets/generate_pdf.dart';
import 'package:just_delivery/customWidgets/shimmer_effects.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';
import 'package:just_delivery/theme/theme_helper.dart';

import '../../utils/common_funtions.dart';
import 'history_details_controller.dart';

class HistoryDetailsScreen extends GetView<HistoryDetailsController> {
  const HistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final start = controller.startPoint.value;

      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            controller.appBarName.value,
            style: CustomTextStyle.subHeading(),
          ),
        ),
        body:
            // start == null
            //     ? Center(child: CircularProgressIndicator())
            //     :
            controller.isLoading.value == true
                ? HistoryDetailShimmerEffect()
                : Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //google map
                        Container(
                          width: Get.width,
                          height: Get.height * 0.20,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: start!,
                                zoom: 12,
                              ),
                              polylines: controller.polyLines.toSet(),
                              markers: controller.markers.toSet(),
                              onMapCreated: controller.setMapController,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          formatDateTime(
                            controller.model?.updatedAt.toString() ?? "",
                          ),
                          style: CustomTextStyle.body(),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Order Id:- ${controller.model?.liveDataArr?[0].unitno ?? ""}",
                          style: CustomTextStyle.body(
                            color: PrimaryColors().gray600,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.015),

                        Divider(),
                        SizedBox(height: Get.height * 0.030),

                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: PrimaryColors().lightBgColor,

                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                controller.startAddress.value.isEmpty
                                    ? TextShimmerEffect(
                                      height: 50.h,
                                      width: double.infinity,
                                    )
                                    : buildLocationRow(
                                      iconColor: Colors.green,
                                      name: "From",
                                      address: controller.startAddress.value,
                                      maxlines: 2,
                                    ),

                                const SizedBox(height: 10),
                                controller.endAddress.value.isEmpty
                                    ? TextShimmerEffect(
                                      height: 50.h,
                                      width: double.infinity,
                                    )
                                    : buildLocationRow(
                                      iconColor: Colors.red,
                                      // name: controller.storeName.value,
                                      name: "To",
                                      address: controller.endAddress.value,
                                      maxlines: 2,
                                    ),

                                SizedBox(height: Get.height * 0.025),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _InfoColumn(
                                        title:
                                            "${controller.model?.liveDataArr?[0].distance.toString()} Km" ??
                                            "00",
                                        subtitle: "Distance",
                                      ),
                                      SizedBox(
                                        height:
                                            Get.height *
                                            0.06, // You can adjust this as needed
                                        child: VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                      ),
                                      _InfoColumn(
                                        title:
                                            controller
                                                .model
                                                ?.liveDataArr?[0]
                                                .digitalstatus ??
                                            "00",
                                        subtitle: "Duration",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.015),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Obx(
                          () => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png',
                              ),
                              radius: 25,
                            ),
                            title: Text(
                              "Delivery Manager",
                              style: CustomTextStyle.heading(fontSize: 15.sp),
                            ),
                            subtitle: Text(
                              "You rated",
                              style: CustomTextStyle.subHeading(
                                fontSize: 14.sp,
                              ),
                            ),
                            trailing: RatingBar.builder(
                              initialRating:
                                  (controller.model?.feedbacks?.isNotEmpty ??
                                          false)
                                      ? (controller
                                              .model!
                                              .feedbacks!
                                              .first
                                              .rating
                                              ?.toDouble() ??
                                          0.0)
                                      : 0.0,

                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemSize: 22.sp,
                              unratedColor: Colors.grey[300],
                              ignoreGestures:
                                  !(controller.isEditable.value &&
                                      controller.model!.feedback == false),
                              itemBuilder:
                                  (context, _) => Icon(
                                    Icons.star,
                                    color: ThemeHelper().appColor,
                                  ),
                              onRatingUpdate: (rating) {
                                controller.rating.value = rating.toInt();
                                if (controller.rating.value <= 2) {
                                  feedback();
                                } else {
                                  controller.setFeedbackToApi();

                                  showThankYouDialog(controller.rating.value);
                                }
                              },
                            ),

                            // trailing: RatingBar.builder(
                            //   initialRating: controller.rating.value.toDouble(),
                            //   minRating: 1,
                            //   direction: Axis.horizontal,
                            //   allowHalfRating: false,
                            //   itemCount: 5,
                            //   itemSize: 20,
                            //   unratedColor: Colors.grey[300],
                            //   itemBuilder:
                            //       (context, _) => Icon(
                            //         Icons.star,
                            //         color: ThemeHelper().appColor,
                            //       ),
                            //   onRatingUpdate: (rating) {
                            //     controller.rating.value = rating.toInt();
                            //     if (rating <= 2) {
                            //       feedback();
                            //     } else {
                            //       controller.setFeedbackToApi();
                            //       showThankYouDialog(rating.toInt());
                            //     }
                            //   },
                            // ),
                          ),
                        ),

                        SizedBox(height: 20),

                        CustomButton(
                          text: "Get Report",
                          onTap: () {
                            final List<Map<String, dynamic>>
                            deliveryReportData =
                                controller.model!.checkpoints
                                    ?.map(
                                      (checkpoint) => {
                                        "checkpointName":
                                            checkpoint.checkpointName ?? '',
                                        "inTime": formatDateTime(
                                          checkpoint.inTime?.toString() ?? '',
                                        ),
                                        "inTemp":
                                            checkpoint.inTemp?.toString() ?? '',
                                        "outTime": formatDateTime(
                                          checkpoint.outTime?.toString() ?? '',
                                        ),
                                        "outTemp":
                                            checkpoint.outTemp?.toString() ??
                                            '',
                                        "timeSpent":
                                            checkpoint.timeSpent?.toString() ??
                                            '',
                                      },
                                    )
                                    .toList() ??
                                [];
                            generateDeliveryReportPDF(deliveryReportData);
                            // Get.to(
                            //   PdfViewerScreen(
                            //     appBarName: "Report",
                            //     url: controller.model?.reportLink ?? "",
                            //     orderId:
                            //         controller.model?.liveDataArr?[0].unitno
                            //             .toString() ??
                            //         "",
                            //   ),
                            // ),
                          },
                        ),

                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
      );
    });
  }

  Widget buildLocationRow({
    required Color iconColor,
    required String name,
    required String address,
    int? maxlines,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.location_on, color: iconColor),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              const SizedBox(height: 4),
              Text(
                address,
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: maxlines,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void feedback() {
    Get.bottomSheet(
      SafeArea(
        // Prevent status bar / keyboard overlap
        child: Container(
          constraints: BoxConstraints(maxHeight: Get.height * 0.9),
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            // <== this solves overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    InkWell(onTap: () => Get.back(), child: Icon(Icons.close)),
                  ],
                ),
                Center(
                  child: Image.asset(
                    ImageConstants.sadEmoji,
                    width: 80,
                    height: 80,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Please choose one  or more concerns.",
                  style: CustomTextStyle.subHeading(),
                ),
                SizedBox(height: 20),

                Obx(
                  () => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        controller.feedback.map((item) {
                          final isSelected = controller.selectedFeedback
                              .contains(item);
                          return ChoiceChip(
                            showCheckmark: false,
                            iconTheme: IconThemeData(color: Colors.white),
                            label: Text(
                              item,
                              style:
                                  isSelected
                                      ? CustomTextStyle.subHeading(
                                        color: Colors.white,
                                        fontSize: 14,
                                      )
                                      : CustomTextStyle.body(
                                        color: Colors.black,
                                      ),
                            ),
                            selected: isSelected,
                            onSelected: (_) {
                              controller.toggleSelection(item);
                            },
                            selectedColor: ThemeHelper().appColor,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                color:
                                    isSelected
                                        ? ThemeHelper().appColor
                                        : Colors.grey.shade400,
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),

                SizedBox(height: 20), // Add some space before button

                CustomButton(
                  text: "Submit",
                  onTap: () {
                    final selectedItems = controller.selectedFeedback.toList();
                    print("Selected feedback: $selectedItems");
                    controller.setFeedbackToApi();
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  void showThankYouDialog(int value) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  ImageConstants.loveEmoji,
                  height: 80,
                  width: 80,
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(5, (index) {
                    bool isFilled = index < controller.rating.value;
                    return GestureDetector(
                      onTap:
                          false
                              ? () {
                                controller.rating.value = index + 1;
                                if (controller.rating.value <= 2) {
                                  feedback();
                                } else {
                                  showThankYouDialog(controller.rating.value);
                                }
                              }
                              : null,
                      child: Icon(
                        isFilled ? Icons.star : Icons.star_border,
                        color: ThemeHelper().appColor,
                        size: Get.width * 0.07,
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(height: 20),

              CustomButton(
                text: "Thank You",
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoColumn({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: CustomTextStyle.subHeading(fontSize: 17)),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: CustomTextStyle.body(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
  }
}
