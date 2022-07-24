import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/constants/app_styles.dart';
import 'package:first_stage_final/generated/l10n.dart';

import 'package:flutter/material.dart';

Future<void> showSheetWidget({
  required BuildContext context,
  required List<String> categoriesList,
  required final void Function(String value) callBack,
  //  final void Function(String value) callback;
}) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.formBackground,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    S.of(context).selecCategory,
                    style: AppStyles.s20w500,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: AppColors.primaryText,
                    size: (150 / MediaQuery.of(context).size.width) * 100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...categoriesList.map((e) {
              return TextButton(
                child: Text(e),
                // onPressed: callBack(e),
                onPressed: () {
                  // print(e);
                  callBack(e);
                },
              );
            }).toList(),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}
