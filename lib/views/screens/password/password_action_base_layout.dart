import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:flutter/material.dart';

/// This class defines the common UI layout for the various password action screens.
///
/// The UI representation depends on the following boolean parameters:
///
/// - [actionText] : The heading (action) of the password action screen.
/// - [actionSuggestionText] : The sub-heading (summary) of the password action screen.
/// - [actionButtonText] : The text displayed on the action button.
/// - [actionWidgetLayout] : The widget layout displayed in the middle of the screen for the
/// specific action.
/// - [subActionWidgetLayout] : The widget layout displayed below the action button for the
/// specific sub-action.
/// - [onActionButtonPressed] : The callback function to be executed when the action button is
/// pressed.
/// - [isPasswordSuccess] : A boolean indicating if the UI should be modified for a password
/// success screen. If true, the UI will be adjusted accordingly.

class PasswordActionBaseLayout extends StatelessWidget {
  const PasswordActionBaseLayout(
      {super.key,
      required this.actionText,
      required this.actionSuggestionText,
      required this.actionButtonText,
      this.actionWidgetLayout,
      this.subActionWidgetLayout,
      required this.onActionButtonPressed,
      this.isPasswordSuccess = false});
  final String actionText;
  final String actionSuggestionText;
  final String actionButtonText;
  final Widget? actionWidgetLayout;
  final Widget? subActionWidgetLayout;
  final VoidCallback onActionButtonPressed;
  final bool isPasswordSuccess;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    final responsivenessHandler = ResponsivenessHandler(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppHeader(),
      body: Padding(
        padding: EdgeInsets.all(
          responsivenessHandler.getResponsiveWidth(6),
        ),
        child: Column(
          mainAxisAlignment: isPasswordSuccess
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: isPasswordSuccess
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            if (isPasswordSuccess) ...[
              Image.asset(
                AppImages.passwordSuccess,
                scale: 4,
              ),
              SizedBox(
                height: responsivenessHandler.getResponsiveHeight(3),
              ),
            ],
            Text(
              actionText,
              style: textTheme.headlineLarge,
              textAlign: isPasswordSuccess ? TextAlign.center : TextAlign.start,
            ),
            SizedBox(
              height: responsivenessHandler.getResponsiveHeight(1.6),
            ),
            Text(
              actionSuggestionText,
              style: textTheme.labelSmall?.copyWith(
                color: AppColors.grey,
              ),
              textAlign: isPasswordSuccess ? TextAlign.center : TextAlign.start,
            ),
            SizedBox(
              height: responsivenessHandler.getResponsiveHeight(3),
            ),
            actionWidgetLayout ?? const SizedBox(),
            if (isPasswordSuccess)
              SizedBox(
                height: responsivenessHandler.getResponsiveHeight(5),
              ),
            AppButton(
              buttonText: actionButtonText,
              onPressed: onActionButtonPressed,
            ),
            subActionWidgetLayout ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
