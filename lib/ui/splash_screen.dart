import 'package:first_stage_final/constants/app_assets.dart';
import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/repo/repo_settings.dart';
import 'package:first_stage_final/ui/screens/login_screen/login_screen.dart';
import 'package:first_stage_final/ui/screens/products_screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// void timeout() {
//   const duration = Duration(days: 1);
//   Future.delayed(duration).whenComplete(() {});
// }

class _SplashScreenState extends State<SplashScreen> {
  RepoSettings repoSettings = RepoSettings();

  @override
  void initState() {
    final repoSettings = Provider.of<RepoSettings>(
      context,
      listen: false,
    );
    repoSettings.init().whenComplete(() async {
      var defaultLocale = const Locale('ru', 'RU');
      final locale = await repoSettings.readLocale();
      if (locale == 'en') {
        defaultLocale = const Locale('en');
      }
      final isAuth = await repoSettings.isAutorized() ?? false;
      S.load(defaultLocale).whenComplete(() {
        // timeout();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                isAuth ? const LoginScreen() : const ProductsScreen(),
          ),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: AppColors.primary,
        child: Image.asset(
          AppAssets.images.splashBackground,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
