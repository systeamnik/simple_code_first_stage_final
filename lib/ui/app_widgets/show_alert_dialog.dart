import 'package:first_stage_final/constants/app_styles.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        contentPadding: const EdgeInsets.all(30.0),
        title: Text(
          S.of(context).error,
          style: AppStyles.s20w500,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).authErrorMessage,
              style: AppStyles.s14w400,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: OutlinedButton(
                style: AppStyles.buttomStyleRounded,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          S.of(context).good,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
