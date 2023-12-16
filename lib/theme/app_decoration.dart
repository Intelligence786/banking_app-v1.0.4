import 'package:flutter/material.dart';
import 'package:banking_app/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray300,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: appTheme.gray50.withOpacity(0.8),
      );

  static BoxDecoration get fillGrayOpacity1 => BoxDecoration(
    color: appTheme.black900.withOpacity(0.4),
  );
  static BoxDecoration get fillGray501 => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillGray502 => BoxDecoration(
        color: appTheme.gray50.withOpacity(0.75),
      );
  static BoxDecoration get fillYellowA => BoxDecoration(
        color: appTheme.yellowA700,
      );
  static BoxDecoration get fillYellowA70001 => BoxDecoration(
        color: appTheme.yellowA70001,
      );

  // Gradient decorations
  static BoxDecoration get gradientOnPrimaryContainerToBlack => BoxDecoration(
        gradient: LinearGradient(

          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimaryContainer,
            appTheme.black900,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.gray100,
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
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
