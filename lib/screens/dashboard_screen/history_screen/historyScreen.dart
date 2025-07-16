import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:just_delivery/constants/image_constants.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';
import 'package:just_delivery/screens/dashboard_screen/history_screen/historyController.dart';
import 'package:just_delivery/screens/dashboard_screen/history_screen/historyDataModel.dart';
import 'package:just_delivery/theme/theme_helper.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../customWidgets/customButtom.dart';
import '../view_report/viewReportScreen.dart';

class HistoryScreen extends GetView<HistoryController>{
  const HistoryScreen({super.key});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: PrimaryColors().lightBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(width: 10,),
          Image.asset(ImageConstants.appLogo,width: Get.width*0.4,),
          Spacer(),

        ],
      ),

      body: Obx(
        ()=> Column(children: [
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
                        children: List.generate(controller.options.length, (index) {
                          bool isSelected = controller.selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              controller.selectedIndex.value = index;
                              controller.filterList( controller.options[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                              padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.012,
                                horizontal: Get.width * 0.04,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? ThemeHelper().appColor : PrimaryColors().lightBgColor,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: isSelected ? ThemeHelper().appColor : PrimaryColors().lightBgColor,
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
                                  color: isSelected ? Colors.white : Colors.black87,
                                ),
                              ),
                            )
                          );
                        }),
                      ),
                    ),
                  ),

                  // Circular filter button
                  GestureDetector(
                    onTap: () {
                      // Handle tap
                    //  _showFilterBottomSheet();

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
            child: ListView.builder(
              itemCount: controller.historyList.length,
              itemBuilder: (context, index) {
                var model = controller.historyList[index];

                DateTime parsedDate = DateTime.parse(model.assignedVehicle?.updatedAt.toString()??DateTime.now().toString()).toLocal();
                String formattedDate = DateFormat('dd/MM/yyyy,hh:mma').format(parsedDate);

                return InkWell(
                  onTap: () => controller.moveToHistory(model),
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12, top: 7, bottom: 7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(ImageConstants.circularTruck, width: 60),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${model.assignedVehicle?.vehicleNumber ?? ''}"),
                                SizedBox(height: 5),
                                Text(formattedDate, style: CustomTextStyle.body(fontSize: 16)),
                              ],
                            ),
                            Spacer(),
                            Container(
                              child: Image.asset(ImageConstants.completedImg, width: Get.width * 0.25),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 85.0, right: 10),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 10),
                          child: Text("rateReview".tr),
                        ),
                        Obx(() => Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ...List.generate(5, (starIndex) {
                                bool isFilled = starIndex < controller.rating.value;
                                return GestureDetector(
                                  onTap: controller.isEditable.value
                                      ? () {
                                    var rating = starIndex + 1;
                                    if (rating <= 2) {
                                      feedback(model);
                                    } else {
                                      controller.setFeedbackToApi(model);
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
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(PdfViewerScreen(
                                    appBarName: "Report",
                                    url: model?.reportLink ?? "",
                                    orderId: model?.liveDataArr?[0].unitno.toString() ?? "",
                                  ));
                                },
                                child: Text(
                                  "getReport".tr,
                                  style: CustomTextStyle.subHeading(
                                    fontSize: 17,
                                    color: ThemeHelper().appColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),

                        SizedBox(height: 10,)

                      ],
                    ),
                  ),
                );
              },
            ),
          )




        ],),
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

            Row(children: [
              Text("Filter",style: CustomTextStyle.subHeading(),),
              Spacer(),
              Icon(Icons.close)


            ],),


            Row(
              children: [
                Expanded(child:
                Column(
                  mainAxisAlignment: MainAxisAlignment. start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Start Date",style: CustomTextStyle.subHeading(),),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: ()=>_showCalenderDialog(Get.context!),
                    child: Container(
                      height: 40,
                      width: 150,

                      decoration:  BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0,         // Border width
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        ),

                      ),

                      child:
                      Row(children: [



                      ],),
                    ),
                  )

                ],)
                ),

                Expanded(

                    child: Column(
                  mainAxisAlignment: MainAxisAlignment. start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                  Text("Location",style: CustomTextStyle.subHeading(),),

                  SizedBox(height: 10,),
                  Container(
                    height: 40,
                    width: 150,
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1.0,         // Border width
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)
                      ),

                    ),

                    child:
                    Row(children: [



                    ],),
                  )

                ],)),

              ],
            ),

            Text("Route",style: CustomTextStyle.subHeading(),),

            SizedBox(height: 10,),
            Container(
              height: 40,
              width: 150,
              decoration:  BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 1.0,         // Border width
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(20)
                ),

              ),

              child:
              Row(children: [



              ],),
            ),

            SizedBox(height: 40,),


            Row(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeHelper().appColor, // Border color
                      width: 1.0,         // Border width
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(15)
                    ),

                  ),

                  child:Center(child: Text("Cancel",style: CustomTextStyle.subHeading(color: ThemeHelper().appColor),),)
                ),

                Spacer(),

                Container(
                    height: 50,
                    width: 150,
                    decoration:  BoxDecoration(
                      color: ThemeHelper().appColor,
                      border: Border.all(
                        color: ThemeHelper().appColor, // Border color
                        width: 1.0,         // Border width
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      ),

                    ),

                    child:Center(child: Text("Apply",style: CustomTextStyle.subHeading(color: Colors.white),),)
                ),

              ],
            ),
            SizedBox(height: 20,),



          ],
        ),
      ),
      isScrollControlled: true,
    );


  }


  void _showCalenderDialog(BuildContext context){

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
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



  void feedback(Datum model) {

    Get.bottomSheet(
      Container(
        height: Get.height*0.7,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Spacer(),
                InkWell(
                    onTap: ()=>Get.back(),
                    child: Icon(Icons.close))
              ],
            ),


            Center(child: Image.asset(ImageConstants.sadEmoji,width: 80,height: 80,)),
            // Live chip updates with Obx

            SizedBox(height: 20,),

            Text("Please choose one  or more concerns.",style: CustomTextStyle.subHeading(),),
            SizedBox(height: 20,),

            Obx(() => Wrap(
              spacing: 10,
              runSpacing: 10,
              children: controller.feedback.map((item) {
                final isSelected = controller.selectedFeedback.contains(item);

                return ChoiceChip(
                  showCheckmark: false,
                  iconTheme: IconThemeData(color: Colors.white),
                  label: Text(
                    item,
                    style:
                    isSelected ?
                    CustomTextStyle.subHeading(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 14

                    ):CustomTextStyle.body(
                      color: isSelected ? Colors.white : Colors.black,

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
                      color: isSelected ? ThemeHelper().appColor : Colors.grey.shade400,
                    ),
                  ),
                );
              }).toList(),
            )),

            const Spacer(),

            // Submit button
            CustomButton(
              text: "Submit",
              onTap: () {
                final selectedItems = controller.selectedFeedback.toList();
                print("Selected feedback: $selectedItems");
                controller.setFeedbackToApi(model);
                Get.back();
              },
            )
          ],
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
              Center(child: Image.asset(ImageConstants.loveEmoji,height: 80,width: 80,),),

              SizedBox(height: 20,),

              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(5, (index) {
                    bool isFilled = index < controller.rating.value;
                    return GestureDetector(
                      onTap: null

                         ,
                      child: Icon(
                        isFilled ? Icons.star : Icons.star_border,
                        color: ThemeHelper().appColor,
                        size: Get.width * 0.07,
                      ),
                    );
                  }),


                ],
              ),
              SizedBox(height: 20,),

              CustomButton(text: "Thank You", onTap: (){
                Get.back();
              }),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }


}


