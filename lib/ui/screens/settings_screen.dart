import 'package:first_stage_final/constants/app_styles.dart';
import 'package:first_stage_final/ui/app_widgets/navbar_title_widget.dart';
import 'package:first_stage_final/ui/app_widgets/bottom_navbar_widget.dart';
import 'package:first_stage_final/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/repo/repo_settings.dart';

import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: AppTitleWidget(
          titleText: delegate.settings,
          isShowLogo: false,
        ),
      ),
      bottomNavigationBar: const BottomNavbarWidget(currentPage: 1),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(delegate.language + ': '),
                    DropdownButton<String>(
                      value: Intl.getCurrentLocale(),
                      items: [
                        DropdownMenuItem(
                          value: 'en',
                          child: Text(delegate.english),
                        ),
                        DropdownMenuItem(
                          value: 'ru_RU',
                          child: Text(delegate.russian),
                        ),
                      ],
                      onChanged: (value) async {
                        if (value == null) return;
                        if (value == 'ru_RU') {
                          await S.load(
                            const Locale('ru', 'RU'),
                          );
                          setState(() {});
                        } else if (value == 'en') {
                          await S.load(
                            const Locale('en'),
                          );
                          setState(() {});
                        }
                        final repoSettings = Provider.of<RepoSettings>(
                          context,
                          listen: false,
                        );
                        repoSettings.saveLocale(value);
                      },
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    await context.read<RepoSettings>().logout();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    S.of(context).logout,
                    style: AppStyles.s14w500.copyWith(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
