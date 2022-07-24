import 'package:first_stage_final/constants/app_assets.dart';
import 'package:first_stage_final/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({
    Key? key,
    required this.titleText,
    required this.isShowLogo,
  }) : super(key: key);

  final String titleText;
  final bool isShowLogo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: isShowLogo,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              AppAssets.images.logo,
              scale: (70 / MediaQuery.of(context).size.width) * 100,
            ),
          ),
        ),
        Text(
          titleText,
          style: const TextStyle(
            color: AppColors.appTitle,
          ),
        ),
      ],
    );
  }
}
