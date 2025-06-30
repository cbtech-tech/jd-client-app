import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_delivery/constants/image_constants.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homeController.dart';

class HomeScreen extends GetView<HomeController>{

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Obx(
      ()=> Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height*0.075),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.storeName.value,
                          style: CustomTextStyle.subHeading(fontSize: 19),
                        ),
                        SizedBox(height: 4),
                        (controller.liveTrackingModel?.assignedVehicle?.delayStatus ?? false)
                            ? Image.asset(ImageConstants.delayImg, height: 25)
                            : Image.asset(ImageConstants.pickupOnTime, height: 25),
                      ],
                    ),
                    Spacer(),
                    Image.asset(
                      ImageConstants.circularDownload,
                      width: Get.width * 0.10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Obx(() => GoogleMap(
            polylines:controller.polyLines.value,
            onMapCreated: (mapController)=>controller.onMapCreated(mapController),
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
          )),
        ),
        bottomSheet: Obx(() {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: Get.height* 0.25,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


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
                        Text(controller.driverName.value,style: CustomTextStyle.subHeading(fontSize: 15),),

                      ],
                    ),

                    Spacer(),

                    InkWell(
                      onTap: ()=>controller.makePhoneCall(),
                      child: Image.asset(ImageConstants.callIcon,width: 40,
                        height: 40,),
                    ),

                  ],
                ),

                SizedBox(height: 15),


                Row(
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("#${controller.orderId.value}"),
                        SizedBox(height: 5,),

                        Text("Temp: ${controller.temp.value}°C"),
                        SizedBox(height: 5,),

                        Text("Plate: ${controller.vehicleNumber.value}"),
                      ],),

                    Spacer(),
                    Image.asset(ImageConstants.truckImg,width: Get.width*0.32),

                  ],
                )


                // You can add more dynamic data here
              ],
            ),
          );
        }),


      ),
    );
  }


}

