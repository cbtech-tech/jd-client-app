import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../customWidgets/textStyle.dart';
import '../../../../theme/theme_helper.dart';

class ProfileMenuTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  final bool showDivider;

  const ProfileMenuTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                children: [
                  SvgPicture.asset(iconPath, height: 20.h, width: 20.w),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: PrimaryColors().black900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          const Padding(
            padding: EdgeInsets.only(left: 40.0, right: 10, top: 5),
            child: Divider(),
          ),
      ],
    );
  }
}

class ProfileMenuContainer extends StatelessWidget {
  final String heading;
  final List<Widget> children;

  const ProfileMenuContainer({
    super.key,
    required this.children,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: CustomTextStyle.body(
            fontSize: 18.sp,
            color: PrimaryColors().darkGrey,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}
