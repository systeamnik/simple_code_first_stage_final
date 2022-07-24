import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/constants/app_styles.dart';
import 'package:flutter/material.dart';

Widget titleWidget(String category, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        category,
        style: AppStyles.s12w400.copyWith(
          color: AppColors.primaryText,
        ),
      ),
      const SizedBox(height: 7),
      Text(
        title,
        style: AppStyles.s16w500,
        overflow: TextOverflow.clip,
        softWrap: false,
      ),
    ],
  );
}
