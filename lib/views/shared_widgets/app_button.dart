import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:flutter/material.dart';

/// This class defines a customizable button with various properties.
///
/// - [buttonText] : Represents the text to be shown on the button.
/// - [onPressed] : Callback function to perform an action when the button is pressed.
/// - [prefixIcon] : Icon to be shown before the button text.
/// - [prefixIconSize] : Size of the prefix icon.
/// - [verticalMargin] : Vertical margin around the button.
/// - [horizontalMargin] : Horizontal margin around the button.
/// - [toShowUnderline] : If true, the button text will be underlined.
/// - [isEnabled] : If false, the button is disabled and no action will be performed.
/// - [isOutlinedButton] : If true, the button will have an outlined layout.
/// - [borderColor] : Color of button border side.
/// - [buttonTextColor] : color of button text, icon, underline of text(if provided).

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.toShowUnderline = false,
    this.isEnabled = true,
    this.horizontalMargin = 0,
    this.verticalMargin = 1.6,
    this.prefixIcon,
    this.prefixIconSize = 18,
    this.isOutlinedButton = false,
    this.buttonTextColor,
    this.borderColor,
    this.borderRadius = 10,
  });

  final String buttonText;
  final VoidCallback onPressed;
  final bool toShowUnderline;
  final bool isEnabled;
  final double horizontalMargin;
  final double verticalMargin;
  final IconData? prefixIcon;
  final double prefixIconSize;
  final bool isOutlinedButton;
  final Color? buttonTextColor;
  final Color? borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    final responsivenessHandler = ResponsivenessHandler(context);
    final Color btnTextColor = isOutlinedButton
        ? (buttonTextColor ?? AppColors.grey)
        : AppColors.white;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: responsivenessHandler.getResponsiveHeight(
          verticalMargin,
        ),
        horizontal: responsivenessHandler.getResponsiveWidth(
          horizontalMargin,
        ),
      ),
      width: double.infinity,
      height: responsivenessHandler.getResponsiveHeight(
        7,
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isEnabled
                ? (isOutlinedButton ? AppColors.white : AppColors.black)
                : AppColors.white,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                  color: !isEnabled
                      ? AppColors.greyShade
                      : isOutlinedButton
                          ? (borderColor ?? AppColors.greyShade)
                          : AppColors.black,
                  width: 0.5),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon,
                color: btnTextColor,
                size: prefixIconSize,
              ),
              SizedBox(
                width: responsivenessHandler.getResponsiveWidth(
                  1,
                ),
              )
            ],
            Text(
              buttonText,
              style: textTheme.labelSmall?.copyWith(
                  decoration: toShowUnderline
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: btnTextColor,
                  decorationThickness: 1,
                  color: !isEnabled ? AppColors.greyShade : btnTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
