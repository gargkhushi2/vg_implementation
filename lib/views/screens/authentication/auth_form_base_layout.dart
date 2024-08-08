import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/routes/app_routes.dart';
import 'package:after_market_mobile_application/views/screens/authentication/social_authentication.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/common_text_form_field.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

/// This class defines the common UI layout for the sign-up, login, and welcome back screens.
///
/// The UI representation depends on the following boolean parameters:
///
/// - If [isFromSignUp] is set to true, the UI is represented for the sign-up screen.
/// - If [isFromWelcomeBack] is set to true, the UI is represented for the welcome back
/// screen.
/// - If both [isFromSignUp] and [isFromWelcomeBack] are set to false (default), the UI is
/// represented for the login screen.
/// - If [isUnderlinedButtonText] is set to true, the button text will be underlined.
/// - The [authFormAction] parameter defines the action to be performed when the button is
/// pressed.

class AuthFormBaseLayout extends StatelessWidget {
  const AuthFormBaseLayout({
    super.key,
    this.isFromSignUp = false,
    this.isFromWelcomeBack = false,
    this.isUnderlinedButtonText = true,
    required this.authFormAction,
  });

  final bool isFromSignUp;
  final bool isFromWelcomeBack;
  final bool isUnderlinedButtonText;
  final VoidCallback authFormAction;

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    final textTheme = AppStyle.textTheme();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppHeader(
        toShowMenu: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          responsivenessHandler.getResponsiveWidth(
            6,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              AppImages.appLogo,
              scale: 4,
            ),
            if (isFromWelcomeBack) ...[
              SizedBox(
                height: responsivenessHandler.getResponsiveHeight(1),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: responsivenessHandler.getResponsiveWidth(6),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.welcomeBack,
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: responsivenessHandler.getResponsiveWidth(6),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.demoEmail,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
              )
            ],
            SizedBox(
              height: responsivenessHandler
                  .getResponsiveHeight(isFromWelcomeBack ? 5 : 6),
            ),
            if (isFromSignUp) ...[
              CommonTextFormField(
                controller: TextEditingController(),
                hintText: AppStrings.demoName,
                labelText: AppStrings.fullName,
                prefixIcon: Icons.person_2_outlined,
              ),
              verticalSpacer(
                height: 12,
              ),
            ],
            if (!isFromWelcomeBack)
              CommonTextFormField(
                controller: TextEditingController(),
                hintText: AppStrings.demoEmail,
                labelText: AppStrings.emailAddress,
                prefixIcon: Icons.email_outlined,
              ),
            verticalSpacer(
              height: 12,
            ),
            CommonTextFormField(
              controller: TextEditingController(),
              hintText: AppStrings.demoPassword,
              labelText: AppStrings.password,
              prefixIcon: Icons.lock_outline,
            ),
            if (!isFromSignUp && !isFromWelcomeBack) ...[
              verticalSpacer(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsivenessHandler.getResponsiveWidth(6),
                ),
                child: textButtonLayout(context, textTheme,
                    AppStrings.forgotPassword, AppRoutes.forgetPassword),
              ),
            ],
            if (isFromWelcomeBack) ...[
              SizedBox(
                height: responsivenessHandler.getResponsiveHeight(2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsivenessHandler.getResponsiveWidth(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textButtonLayout(
                        context, textTheme, AppStrings.switchAccount, ''),
                    textButtonLayout(context, textTheme,
                        AppStrings.forgotPassword, AppRoutes.forgetPassword),
                  ],
                ),
              ),
            ],
            AppButton(
              buttonText: isFromSignUp
                  ? AppStrings.signUpAndContinue
                  : AppStrings.login,
              onPressed: authFormAction,
              toShowUnderline: isUnderlinedButtonText,
              verticalMargin: responsivenessHandler.getResponsiveHeight(0.5),
            ),
            SocialAuthentication(
              isFromSignUp: isFromSignUp,
            )
          ],
        ),
      ),
    );
  }

  Widget textButtonLayout(BuildContext context, TextTheme textTheme,
      String text, String routeName) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Text(
          text,
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
