import 'package:first_stage_final/constants/app_assets.dart';
import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/ui/screens/products_screen/products_screen.dart';

import 'package:first_stage_final/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentPage,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              AppAssets.svg.iconHomeBold,
              color: AppColors.primary,
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              AppAssets.svg.iconHome,
              color: AppColors.header,
            ),
          ),
          label: S.of(context).products,
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              AppAssets.svg.iconSetting,
              color: AppColors.primary,
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              AppAssets.svg.iconSetting,
              color: AppColors.header,
            ),
          ),
          label: S.of(context).settings,
        ),
      ],
      onTap: (index) {
        if (currentPage == index) return;
        if (index == 0) {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: ((context, animation, secondaryAnimation) =>
                  const ProductsScreen()),
            ),
            (route) => false,
          );
        } else if (index == 1) {
          Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: ((context, animation, secondaryAnimation) =>
                    const SettingsScreen()),
              ),
              (route) => false);
        }
      },
    );
  }
}
