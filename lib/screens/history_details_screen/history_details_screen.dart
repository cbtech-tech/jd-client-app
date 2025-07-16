import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_delivery/constants/image_constants.dart';
import 'package:just_delivery/customWidgets/customButtom.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';
import 'package:just_delivery/screens/dashboard_screen/view_report/viewReportScreen.dart';
import 'package:just_delivery/theme/theme_helper.dart';

import '../../utils/commonFuntions.dart';
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
        body: start == null
            ? Center(child: CircularProgressIndicator())
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
                        target: start,
                        zoom: 12,
                      ),
                      polylines: controller.polyLines.toSet(),
                      markers: controller.markers.toSet(),
                      onMapCreated: controller.setMapController,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(formatDateTime(controller.model?.updatedAt.toString()??""),style: CustomTextStyle.body(),),
                SizedBox(height: 5,),
                Text("Order Id:- ${controller.model?.liveDataArr?[0].unitno??""}",style: CustomTextStyle.body(color: PrimaryColors().gray600),),
                SizedBox(height: Get.height*0.015,),

                Divider(),
                SizedBox(height: Get.height*0.030,),

                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color:PrimaryColors().lightBgColor ,


                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        buildLocationRow(
                          iconColor: Colors.green,
                          name: "Warehouse",
                          address: controller.startAddress.value,
                        ),

                        const SizedBox(height: 10),
                        buildLocationRow(
                          iconColor: Colors.red,
                          name: controller.storeName.value,
                          address: controller.endAddress.value,
                        ),
                        SizedBox(height: Get.height*0.025,),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              _InfoColumn(title:  "${controller.model?.liveDataArr?[0].distance.toString()} Km"??"00", subtitle: "Distance"),
                              SizedBox(
                                height: Get.height*0.06, // You can adjust this as needed
                                child: VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                              _InfoColumn(title: controller.model?.liveDataArr?[0].digitalstatus??"00", subtitle: "Duration"),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height*0.015,),






                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Row(
                  children: [

                    CircleAvatar(
                      backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png'), // Replace with your image URL or use AssetImage for local images
                      radius: 30, // Size of the profile photo
                    ),

                    SizedBox(width: 20,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Delivery Manager"),
                        Text("You rated",style: CustomTextStyle.subHeading(fontSize: 15),),

                      ],
                    ),

                    Spacer(),
                    Obx(() => Padding(
                      padding: const EdgeInsets.only(left: 0.0,top: 0,right: 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...List.generate(5, (index) {
                            bool isFilled = index < controller.rating.value;
                            return GestureDetector(
                              onTap: controller.isEditable.value
                                  ? () {
                                controller.rating.value = index + 1;
                                if(controller.rating.value<=2){
                                  feedback();
                                }
                                else
                                  {
                                   controller. setFeedbackToApi();
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
                    ),
                    ),





                  ],
                ),


                SizedBox(height: 20,),

                CustomButton(text: "Get Report",
                    onTap: ()=>Get.to(PdfViewerScreen( appBarName:"Report",  url: controller.model?.reportLink??"", orderId: controller.model?.liveDataArr?[0].unitno.toString()??""))),

                SizedBox(height: 20,),

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
  }) {
    return Row(
      children: [
        Icon(Icons.location_on, color: iconColor),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 4),
              Text(
                address,
                style: const TextStyle(color: Colors.grey,fontSize: 12),
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void feedback() {

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
             controller.setFeedbackToApi();
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
                      onTap: false
                          ? () {
                        controller.rating.value = index + 1;
                        if(controller.rating.value<=2){
                          feedback();
                        }
                        else
                        {
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






class _InfoColumn extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoColumn({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: CustomTextStyle.subHeading(fontSize: 17,)),
        const SizedBox(height: 4),
        Text(subtitle, style:  CustomTextStyle.body(fontSize: 15,color: Colors.grey)),
      ],
    );
  }
}

