import 'package:flutter/material.dart';
import 'package:just_delivery/theme/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue100,
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue600,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPink => BoxDecoration(
        color: appTheme.pink100,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlueCToLightBlue => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, 0.48),
          end: Alignment(1, 0.48),
          colors: [
            appTheme.blue500C1,
            appTheme.lightBlue900,
          ],
        ),
      );
  static BoxDecoration get gradientLightBlueAdToBlueGrayB => BoxDecoration(
        border: Border.all(
          color: appTheme.gray200,
          width: 1,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.lightBlue600Ad,
            appTheme.blueGray900B7,
          ],
        ),
      );
  static BoxDecoration get gradientPinkToLightBlueD => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.pink50060,
            appTheme.lightBlue600D1,
          ],
        ),
      );
  static BoxDecoration get gradientPinkToLightblue600d1 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.pink50060,
            appTheme.lightBlue600D1,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray400,
          width: 1,
        ),
      );
  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        border: Border(
          top: BorderSide(
            color: appTheme.gray200,
            width: 1,
          ),
        ),
      );
  static BoxDecoration get outlineGray2001 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        border: Border.all(
          color: appTheme.gray200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder154 => BorderRadius.circular(
        154,
      );

  // Rounded borders
  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
