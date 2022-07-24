import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/constants/app_styles.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:flutter/material.dart';

Widget subTitleWidget(S delegate, String code, String rating, String price) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      Text(
        delegate.codeProduct + ":" + code,
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            delegate.productRating + ":" + rating,
            style: AppStyles.s14w400.copyWith(
              color: AppColors.price,
            ),
          ),
          Text(
            delegate.productPrice + price,
            style: AppStyles.s16w500.copyWith(
              color: AppColors.price,
            ),
          ),
        ],
      ),
    ],
  );
}
