import 'package:flutter/material.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String text;

  // Constructor to accept text
  const CustomAppBar({super.key, required this.text});

 
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text,style: CustomTextStyle.subHeading(),),
    );
  }
  
 @override
  Size get preferredSize => Size.fromHeight(80); // Custom height for the AppBar

}
