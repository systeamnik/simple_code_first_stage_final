import 'package:first_stage_final/constants/app_assets.dart';
import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    Key? key,
    required this.passwordController,
    required this.obscureTextIsVisible,
    required this.callBackObscureText,
    required this.callback,
  }) : super(key: key);

  final void Function(bool isShow) callBackObscureText;
  final void Function(String value) callback;
  final bool obscureTextIsVisible;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      maxLength: 16,
      obscureText: !obscureTextIsVisible,
      style: const TextStyle(
        letterSpacing: 4.0,
      ),
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          letterSpacing: 0,
        ),
        counterText: "",
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SvgPicture.asset(
            AppAssets.svg.iconPassword,
            color: AppColors.icon,
          ),
        ),
        suffixIcon: passwordController.text.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    callBackObscureText(!obscureTextIsVisible);
                  },
                  child: Icon(
                    obscureTextIsVisible
                        ? Icons.remove_red_eye_rounded
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        filled: true,
        fillColor: AppColors.formBackground,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: S.of(context).password,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty || value.length < 8) {
          return S.of(context).inputErrorPasswordInShort;
        }
        return null;
      },
      onChanged: (value) {
        callback(value);
      },
      // onChanged: callback,
    );
  }
}
