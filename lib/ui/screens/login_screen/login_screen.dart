import 'package:first_stage_final/constants/app_assets.dart';
import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/constants/app_styles.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/repo/repo_settings.dart';
import 'package:first_stage_final/ui/app_widgets/show_alert_dialog.dart';
import 'package:first_stage_final/ui/screens/login_screen/widgets/login_widget.dart';
import 'package:first_stage_final/ui/screens/login_screen/widgets/password_widget.dart';
import 'package:first_stage_final/ui/screens/products_screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final repoSettings = RepoSettings();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String login = '';
  String password = '';
  bool passwordVisible = false;

  void setLogin(String value) {
    setState(() {
      login = value;
    });
  }

  void setPassword(String value) {
    setState(() {
      password = passwordController.text;
    });
  }

  void toggleObscureText(bool value) {
    setState(() {
      passwordVisible = value;
    });
  }

  void authButtonPressed(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final isValidForm = formKey.currentState?.validate();
    if (isValidForm ?? false) {
      if (login == 'qwerty' && password == '123456ab') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductsScreen(),
          ),
          (route) => false,
        );
        await context.read<RepoSettings>().authorize();
      } else {
        showAlertDialog(context);
      }
    }
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: SafeArea(
            child: bodyWidgets(context),
          ),
        ),
      ),
    );
  }

  Padding bodyWidgets(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: 'Storyberry \n',
                      style: AppStyles.s20w500.copyWith(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            (400 / MediaQuery.of(context).size.height) * 100,
                        letterSpacing: -4,
                        height: 0.9,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'good \n',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'experience! \n',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'design.',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: Image.asset(
                    AppAssets.images.logo,
                    scale: MediaQuery.of(context).size.width / 100,
                  ),
                ),
              ],
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    S.of(context).login,
                    style: AppStyles.s14w400,
                  ),
                ),
                LoginWidget(
                  callback: setLogin,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    S.of(context).password,
                    style: AppStyles.s14w400,
                  ),
                ),
                PasswordWidget(
                  passwordController: passwordController,
                  callBackObscureText: toggleObscureText,
                  obscureTextIsVisible: passwordVisible,
                  callback: setPassword,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      authButtonPressed(context);
                    },
                    style: AppStyles.buttomStyle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              S.of(context).signIn,
                              style: AppStyles.s16w400button,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).dontHaveAccount,
                      style: const TextStyle(
                        color: AppColors.icon,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        S.of(context).createAccount,
                        style: const TextStyle(
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
