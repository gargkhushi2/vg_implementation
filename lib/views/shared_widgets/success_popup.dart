import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:flutter/material.dart';

/// A common success pop-up widget.
///
/// Displays a success message along with an action button.
///
/// [successMessageText] is the message shown on the success.
/// [buttonText] is the text displayed on the action button.
/// [actionButtonCallback] is the callback function executed when the action button is
/// pressed.
/// [isOutlinedButton] If set to true, an outlined button layout will be displayed.

class SuccessPopup extends StatelessWidget {
  const SuccessPopup({
    super.key,
    required this.successMessageText,
    required this.buttonText,
    required this.actionButtonCallback,
    this.isOutlinedButton = false,
  });
  final String successMessageText;
  final String buttonText;
  final VoidCallback actionButtonCallback;
  final bool isOutlinedButton;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Column(
        children: [
          const ImageLayout(
            imageName: AppImages.tickCircle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            successMessageText,
            style: textTheme.headlineLarge?.copyWith(
              color: AppColors.darkBlackShade,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          AppButton(
            buttonText: buttonText,
            onPressed: actionButtonCallback,
            isOutlinedButton: isOutlinedButton,
          ),
        ],
      ),
    );
  }
}

/// Displays a customized success pop-up as a bottom sheet.
void showSuccessPopUp(
  BuildContext context,
  String successMessageText,
  String buttonText,
  VoidCallback actionButtonCallback, {
  bool isOutlinedButton = false,
}) {
  final responsivenessHandler = ResponsivenessHandler(context);
  showModalBottomSheet(
    backgroundColor: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    isDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: responsivenessHandler.getResponsiveHeight(40),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: SuccessPopup(
            successMessageText: successMessageText,
            buttonText: buttonText,
            actionButtonCallback: actionButtonCallback,
            isOutlinedButton: isOutlinedButton,
          ),
        ),
      );
    },
  );
}
