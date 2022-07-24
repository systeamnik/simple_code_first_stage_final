import 'package:first_stage_final/constants/app_assets.dart';
import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  // void setLogin(String value)
  final void Function(String value) callback;

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    return TextFormField(
      maxLength: 8,
      decoration: InputDecoration(
        counterText: "",
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SvgPicture.asset(
            AppAssets.svg.iconAccount,
            color: AppColors.icon,
          ),
        ),
        filled: true,
        fillColor: AppColors.formBackground,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: delegate.login,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty || value.length < 4) {
          return delegate.inputErrorLoginInShort;
        }
        return null;
      },
      onChanged: callback,
    );
  }
}
