import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/routes/app_routes.dart';
import 'package:after_market_mobile_application/views/screens/password/password_action_base_layout.dart';
import 'package:flutter/material.dart';

class CodeVerification extends StatelessWidget {
  const CodeVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    final responsivenessHandler = ResponsivenessHandler(context);
    return PasswordActionBaseLayout(
      actionText: AppStrings.enterVerificationCode,
      actionSuggestionText: AppStrings.codeSentToEmail,
      actionButtonText: AppStrings.verifyAndProceed,
      actionWidgetLayout: SizedBox(
        height: responsivenessHandler.getResponsiveHeight(20),
      ),
      onActionButtonPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.updatePassword);
      },
      subActionWidgetLayout: Center(
        child: Column(
          children: [
            SizedBox(
              height: responsivenessHandler.getResponsiveHeight(1),
            ),
            Text(
              AppStrings.didNotGetCode,
              style: textTheme.labelSmall?.copyWith(
                color: AppColors.blackShade,
              ),
            ),
            SizedBox(
              height: responsivenessHandler.getResponsiveHeight(1),
            ),
            Text(
              AppStrings.resendCode,
              style: textTheme.labelSmall?.copyWith(
                color: AppColors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
