import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:just_delivery/constants/image_constants.dart';
import 'package:just_delivery/customWidgets/generate_pdf.dart';
import 'package:just_delivery/customWidgets/shimmer_effects.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';
import 'package:just_delivery/screens/dashboard_screen/history_screen/historyController.dart';
import 'package:just_delivery/screens/dashboard_screen/history_screen/historyDataModel.dart';
import 'package:just_delivery/theme/theme_helper.dart';
import 'package:just_delivery/utils/common_funtions.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../customWidgets/customButtom.dart';

class HistoryScreen extends GetView<HistoryController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColors().lightBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(width: 10),
          Image.asset(ImageConstants.appLogo, width: Get.width * 0.4),
          Spacer(),
        ],
      ),

      body: Obx(
        () => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              height: Get.height * 0.1,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Wrap radio buttons inside a Flexible Row
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(controller.options.length, (
                            index,
                          ) {
                            bool isSelected = controller.selectedIndex == index;
                            return GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = index;
                                controller.filterList(
                                  controller.options[index],
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.01,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.012,
                                  horizontal: Get.width * 0.04,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isSelected
                                          ? ThemeHelper().appColor
                                          : PrimaryColors().lightBgColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color:
                                        isSelected
                                            ? ThemeHelper().appColor
                                            : PrimaryColors().lightBgColor,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  controller.options[index],
                                  style: CustomTextStyle.subHeading(
                                    fontSize: Get.width * 0.035,
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    // Circular filter button
                    GestureDetector(
                      onTap: () {
                        // Handle tap
                        // _showFilterBottomSheet();
                      },
                      child: Container(
                        width: Get.width * 0.11,
                        height: Get.width * 0.11,
                        margin: EdgeInsets.only(left: Get.width * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.filter_list,
                          color: ThemeHelper().appColor,
                          size: Get.width * 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: RefreshIndicator(
                onRefresh: () => controller.fetchAllHistory(),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return HistoryPageShimmerEffect();
                  }

                  if (controller.historyList.isEmpty) {
                    return Center(child: Text("No Data Found"));
                  }
                  return ListView.builder(
                    itemCount: controller.historyList.length,
                    itemBuilder: (context, index) {
                      var model = controller.historyList[index];

                      DateTime parsedDate =
                          DateTime.parse(
                            model.assignedVehicle?.updatedAt.toString() ??
                                DateTime.now().toString(),
                          ).toLocal();
                      String formattedDate = DateFormat(
                        'dd/MM/yyyy,hh:mma',
                      ).format(parsedDate);
                      var status = model.assignedVehicle?.deliveryCompleted;

                      return InkWell(
                        onTap: () => controller.moveToHistory(model),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 12,
                            right: 12,
                            top: 7,
                            bottom: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: AssetImage(
                                      ImageConstants.circularTruck,
                                    ),
                                  ),
                                  title: Text(
                                    model.assignedVehicle?.vehicleNumber ?? '',
                                    style: TextStyle(fontSize: 14.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    formattedDate,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          status == true
                                              ? const Color(0xFFEAF7EC)
                                              : Color(0xFFf4c4cc),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          status == true
                                              ? Icons.check_circle
                                              : Icons.cancel,
                                          color:
                                              status == true
                                                  ? Colors.green
                                                  : Colors.red,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          status == true
                                              ? "Completed"
                                              : "Cancelled",
                                          style: TextStyle(
                                            color:
                                                status == true
                                                    ? Colors.green
                                                    : Colors.red,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 72,
                                    right: 12,
                                  ), // 72 = avatar + spacing
                                  child: const Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                    top: 10,
                                  ),
                                  child: Text(
                                    "rateReview".tr,
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                ),

                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      top: 10,
                                      right: 15,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        RatingBar.builder(
                                          initialRating:
                                              model.feedbacks?.isNotEmpty ==
                                                      true
                                                  ? model
                                                          .feedbacks!
                                                          .first
                                                          .rating
                                                          ?.toDouble() ??
                                                      0.0
                                                  : 0.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          itemSize: Get.width * 0.07,
                                          ignoreGestures:
                                              !(controller.isEditable.value &&
                                                  model.feedback == false),
                                          itemBuilder:
                                              (context, _) => Icon(
                                                Icons.star,
                                                color: ThemeHelper().appColor,
                                              ),
                                          onRatingUpdate: (rating) {
                                            controller.rating.value =
                                                rating.toInt();
                                            if (rating <= 2) {
                                              feedback(model);
                                            } else {
                                              controller.setFeedbackToApi(
                                                model,
                                              );
                                              showThankYouDialog(rating);
                                            }
                                          },
                                        ),
                                        Spacer(),
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              String? invoiceNo = model
                                                  .liveDataArr
                                                  ?.first
                                                  .utctimestamp
                                                  ?.toString()
                                                  .replaceAll(
                                                    RegExp(r'[^0-9]'),
                                                    '',
                                                  );
                                            String date = formatDateTime(model.createdAt?.toString() ?? '');

                                              final List<Map<String, dynamic>>
                                              deliveryReportData =
                                                  model.checkpoints
                                                      ?.map(
                                                        (checkpoint) => {
                                                          "checkpointName":
                                                              checkpoint
                                                                  .checkpointName ??
                                                              '',
                                                          "inTime": formatDateTime(
                                                            checkpoint.inTime
                                                                    ?.toString() ??
                                                                '',
                                                          ),
                                                          "inTemp":
                                                              checkpoint.inTemp
                                                                  ?.toString() ??
                                                              '',
                                                          "outTime": formatDateTime(
                                                            checkpoint.outTime
                                                                    ?.toString() ??
                                                                '',
                                                          ),
                                                          "outTemp":
                                                              checkpoint.outTemp
                                                                  ?.toString() ??
                                                              '',
                                                          "timeSpent":
                                                              checkpoint
                                                                  .timeSpent
                                                                  ?.toString() ??
                                                              '',
                                                          "invoiceNO":
                                                              invoiceNo ?? "",

                                                              "date":date
                                                        },
                                                      )
                                                      .toList() ??
                                                  [];
                                              generateDeliveryReportPDF(
                                                deliveryReportData,
                                              );
                                            },
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                            splashColor: Colors.grey.withAlpha(
                                              (0.2 * 255).toInt(),
                                            ),
                                            highlightColor: Colors.grey
                                                .withAlpha((0.1 * 255).toInt()),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 8,
                                                horizontal: 12,
                                              ),
                                              child: Text(
                                                "getReport".tr,
                                                style:
                                                    CustomTextStyle.subHeading(
                                                      fontSize: 17.sp,
                                                      color:
                                                          ThemeHelper()
                                                              .appColor,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet() {
    Get.bottomSheet(
      Container(
        width: Get.width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Filter", style: CustomTextStyle.subHeading()),
                Spacer(),
                Icon(Icons.close),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Start Date", style: CustomTextStyle.subHeading()),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => _showCalenderDialog(Get.context!),
                        child: Container(
                          height: 40,
                          width: 150,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 1.0, // Border width
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),

                          child: Row(children: [



                      ],),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Location", style: CustomTextStyle.subHeading()),

                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey, // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),

                        child: Row(children: [



                    ],),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Text("Route", style: CustomTextStyle.subHeading()),

            SizedBox(height: 10),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),

              child: Row(children: [



              ],),
            ),

            SizedBox(height: 40),

            Row(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeHelper().appColor, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),

                  child: Center(
                    child: Text(
                      "Cancel",
                      style: CustomTextStyle.subHeading(
                        color: ThemeHelper().appColor,
                      ),
                    ),
                  ),
                ),

                Spacer(),

                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: ThemeHelper().appColor,
                    border: Border.all(
                      color: ThemeHelper().appColor, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),

                  child: Center(
                    child: Text(
                      "Apply",
                      style: CustomTextStyle.subHeading(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _showCalenderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Select Date"),
            content: SizedBox(
              height: 300,
              width: 300,
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.single,
                initialSelectedDate: controller.selectedDate.value,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  if (args.value is DateTime) {
                    controller.onDateSelected(args.value);
                    Get.back(); // Close the dialog
                  }
                },
              ),
            ),
          ),
    );
  }

  // void feedback(Datum model) {
  //   Get.bottomSheet(
  //     Container(
  //       height: Get.height * 0.7,
  //       padding: const EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             children: [
  //               Spacer(),
  //               InkWell(onTap: () => Get.back(), child: Icon(Icons.close)),
  //             ],
  //           ),

  //           Center(
  //             child: Image.asset(
  //               ImageConstants.sadEmoji,
  //               width: 80,
  //               height: 80,
  //             ),
  //           ),

  //           // Live chip updates with Obx
  //           SizedBox(height: 20),

  //           Text(
  //             "Please choose one  or more concerns.",
  //             style: CustomTextStyle.subHeading(),
  //           ),
  //           SizedBox(height: 20),

  //           Obx(
  //             () => Wrap(
  //               spacing: 10,
  //               runSpacing: 10,
  //               children:
  //                   controller.feedback.map((item) {
  //                     final isSelected = controller.selectedFeedback.contains(
  //                       item,
  //                     );

  //                     return ChoiceChip(
  //                       showCheckmark: false,
  //                       iconTheme: IconThemeData(color: Colors.white),
  //                       label: Text(
  //                         item,
  //                         style:
  //                             isSelected
  //                                 ? CustomTextStyle.subHeading(
  //                                   color:
  //                                       isSelected
  //                                           ? Colors.white
  //                                           : Colors.black,
  //                                   fontSize: 14,
  //                                 )
  //                                 : CustomTextStyle.body(
  //                                   color:
  //                                       isSelected
  //                                           ? Colors.white
  //                                           : Colors.black,
  //                                 ),
  //                       ),
  //                       selected: isSelected,
  //                       onSelected: (_) {
  //                         controller.toggleSelection(item);
  //                       },
  //                       selectedColor: ThemeHelper().appColor,
  //                       backgroundColor: Colors.white,
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(30),
  //                         side: BorderSide(
  //                           color:
  //                               isSelected
  //                                   ? ThemeHelper().appColor
  //                                   : Colors.grey.shade400,
  //                         ),
  //                       ),
  //                     );
  //                   }).toList(),
  //             ),
  //           ),

  //           const Spacer(),

  //           // Submit button
  //           CustomButton(
  //             text: "Submit",
  //             onTap: () {
  //               final selectedItems = controller.selectedFeedback.toList();
  //               print("Selected feedback: $selectedItems");
  //               controller.setFeedbackToApi(model);
  //               Get.back();
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //     isScrollControlled: true,
  //     backgroundColor: Colors.white,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //   );
  // }

  void feedback(Datum model) {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          constraints: BoxConstraints(maxHeight: Get.height * 0.9),
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
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
                  "Please choose one or more concerns.",
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

                SizedBox(height: 20),

                CustomButton(
                  text: "Submit",
                  onTap: () {
                    final selectedItems = controller.selectedFeedback.toList();
                    print("Selected feedback: $selectedItems");
                    controller.setFeedbackToApi(model);
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

  void showThankYouDialog(double value) {
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
                      onTap: null,
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
