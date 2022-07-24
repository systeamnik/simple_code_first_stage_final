import 'package:first_stage_final/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const s10w500 = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
  );

  static const s10w400 = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
  );

  static const s12w500 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );

  static const s12w400 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );

  static const s14w500 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );

  static const s14w400 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const s16w500 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static const s16w400 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static const s20w500 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static const s16w400button = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.formInputLightText,
    letterSpacing: 0.15,
  );

  static ButtonStyle buttomStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );

  static ButtonStyle buttomStyleRounded = OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    side: const BorderSide(
      width: 1,
      color: AppColors.primary,
    ),
  );
}
