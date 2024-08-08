import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// This class defines the common UI layout for social authentication (Facebook and Google).
///
/// - If [isFromSignUp] is set to true , the Sign-Up option will be shown with relevant
/// information and functionality.
/// - If set to false (default), the Sign-In option will be shown.

class SocialAuthentication extends StatelessWidget {
  const SocialAuthentication({
    super.key,
    this.isFromSignUp = false,
  });
  final bool isFromSignUp;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppImages.facebookButton,
                scale: 4,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppImages.googleButton,
                scale: 4,
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: isFromSignUp
                    ? AppStrings.alreadyHaveAnAccount
                    : AppStrings.doNotHaveAnAccount,
                style: textTheme.bodySmall,
              ),
              TextSpan(
                text: isFromSignUp
                    ? ' ${AppStrings.signIn}'
                    : ' ${AppStrings.signUp}',
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.orange,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pushNamed(
                      isFromSignUp ? AppRoutes.login : AppRoutes.signUp,
                    );
                  },
              )
            ],
          ),
        )
      ],
    );
  }
}
