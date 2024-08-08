import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/routes/app_routes.dart';
import 'package:after_market_mobile_application/views/screens/password/password_action_base_layout.dart';
import 'package:flutter/material.dart';

class PasswordChangeSuccess extends StatelessWidget {
  const PasswordChangeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return PasswordActionBaseLayout(
      actionText: AppStrings.passwordChangedSuccessfully,
      actionSuggestionText: AppStrings.reLoginWithNewPasswordSuggestion,
      actionButtonText: AppStrings.reLogin,
      onActionButtonPressed: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
      },
      isPasswordSuccess: true,
    );
  }
}
