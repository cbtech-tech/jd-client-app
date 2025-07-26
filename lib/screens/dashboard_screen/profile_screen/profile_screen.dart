import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_delivery/constants/image_constants.dart';
import 'package:just_delivery/theme/theme_helper.dart';
import '../../../customWidgets/textStyle.dart';
import 'components/profile_screen_comp.dart';
import 'profile_controller.dart';

class MenuListScreen extends GetView<ProfileController> {
  const MenuListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColors().lightBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PrimaryColors().lightBgColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "JustDeliveries",
              style: CustomTextStyle.subHeading(
                color: ThemeHelper().appColor,
                fontSize: 20.sp,
              ),
            ),
            Text("9876543210", style: CustomTextStyle.body(fontSize: 15.sp)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileMenuContainer(
                heading: "Setting".tr,
                children: [
                  ProfileMenuTile(
                    iconPath: ImageConstants.dashboard,
                    title: "dashboard".tr,
                    showDivider: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 5),
                  ProfileMenuTile(
                    iconPath: ImageConstants.payment,
                    title: "Payment".tr,
                    showDivider: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 5),
                  ProfileMenuTile(
                    iconPath: ImageConstants.address,
                    title: "Update Addresses".tr,
                    showDivider: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 5),
                  ProfileMenuTile(
                    iconPath: ImageConstants.accountSetting,
                    title: "Account settings".tr,
                    showDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 5),
              ProfileMenuContainer(
                heading: "Support".tr,
                children: [
                  ProfileMenuTile(
                    iconPath: ImageConstants.help,
                    title: "Help".tr,
                    showDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 5),
              ProfileMenuContainer(
                heading: "Legal".tr,
                children: [
                  ProfileMenuTile(
                    iconPath: ImageConstants.contract,
                    title: "View Contract".tr,
                    showDivider: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 5),
                  ProfileMenuTile(
                    iconPath: ImageConstants.privacy,
                    title: "Privacy".tr,
                    showDivider: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 5),
                  ProfileMenuTile(
                    iconPath: ImageConstants.termsAndCondition,
                    title: "Terms and Condition ".tr,
                    showDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 5),

              ProfileMenuContainer(
                heading: "Others".tr,
                children: [
                  ProfileMenuTile(
                    iconPath: ImageConstants.about,
                    title: "About us".tr,
                    showDivider: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 5),
                  ProfileMenuTile(
                    iconPath: ImageConstants.logout,
                    title: "Logout".tr,
                    showDivider: false,
                    onTap: () {
                      controller.logout();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// 363 line of code convert 140 lines 