import 'package:flutter/material.dart';
import '../theme/theme_helper.dart';
import 'textStyle.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onTap;
//   final double borderRadius;

//  const CustomButton({super.key,
//     required this.text,
//     required this.onTap,
//     this.borderRadius = 10.0, // Default border radius
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Handle the onTap function
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//         decoration: BoxDecoration(
//           color: ThemeHelper().appColor, // Button color
//           borderRadius: BorderRadius.circular(borderRadius), // Curved edges
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: CustomTextStyle.subHeading(fontSize: 18, color: Colors.white), // Use custom text style

//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemeHelper().appColor, // Background color
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: Colors.white.withAlpha((0.2 * 255).toInt()),
        highlightColor: Colors.white.withAlpha((0.1 * 255).toInt()),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Center(
            child: Text(
              text,
              style: CustomTextStyle.subHeading(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
