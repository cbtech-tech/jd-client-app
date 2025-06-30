import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  // Method to get text style with customizable font size and color
  static TextStyle getTextStyle({
    double fontSize = 14.0,        // Default font size
    Color color = Colors.black,   // Default color is black
    FontWeight fontWeight = FontWeight.normal, // Default font weight is normal
  }) {
    return GoogleFonts.lato(   // Use Lato font from Google Fonts
      fontSize: fontSize,      // Apply the provided font size
      color: color,            // Apply the provided color
      fontWeight: fontWeight,  // Apply the provided font weight
      decoration: TextDecoration.none, // Ensure no underline or decoration

    );
  }

  // You can also create predefined styles for specific use cases
  static TextStyle heading({double fontSize = 22.0, Color color = Colors.black}) {
    return getTextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.bold,);
  }

  static TextStyle subHeading({double fontSize = 18.0, Color color = Colors.black}) {
    return getTextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.w600);
  }

  static TextStyle body({double fontSize = 14.0, Color color = Colors.black}) {
    return getTextStyle(fontSize: fontSize, color: color);
  }

  static TextStyle caption({double fontSize = 12.0, Color color = Colors.black}) {
    return getTextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.w400);
  }
}
