import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/routes/app_routes.dart';
import 'package:after_market_mobile_application/views/screens/password/password_action_base_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/common_text_form_field.dart';

import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    return PasswordActionBaseLayout(
        actionText: AppStrings.forgotPassword,
        actionSuggestionText: AppStrings.enterAccountEmail,
        actionButtonText: AppStrings.recoverPassword,
        actionWidgetLayout: Column(
          children: [
            CommonTextFormField(
              controller: TextEditingController(),
              hintText: AppStrings.demoEmail,
              labelText: AppStrings.emailAddress,
              prefixIcon: Icons.email_outlined,
              horizontalPadding: 0,
            ),
            SizedBox(
              height: responsivenessHandler.getResponsiveHeight(14),
            )
          ],
        ),
        subActionWidgetLayout: AppButton(
          buttonText: AppStrings.backToLogin,
          onPressed: () {
            Navigator.of(context).pop();
          },
          isOutlinedButton: true,
          buttonTextColor: AppColors.orange,
          prefixIcon: Icons.arrow_back,
        ),
        onActionButtonPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.codeVerification);
        });
  }
}
