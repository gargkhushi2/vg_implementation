import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

/// This class defines a customizable text form field with various properties.
///
/// - [controller] : Represents the [TextEditingController].
/// - [prefixIcon] : Icon to be shown before the hint text.
/// - [prefixIconSize] : Size of the prefix icon.
/// - [suffixIcon] : Icon to be shown after the hint text.
/// - [verticalPadding] : Vertical padding around the text field.
/// - [horizontalPadding] : Horizontal padding around the text field.
/// - [hintText] : Represents the hint text displayed inside the text field when it is empty.
/// - [labelText] : Represents the label text displayed above the text field.
/// - [validator] : Function to validate the text field input.
/// - [toUnHidePassword] : If true, includes the hide and unHide UI and functionality for the
/// password field.
/// - [isOutlineInputBorder] : If true, border will be outlined input border, underline
/// input border otherwise.
/// - [keyBoardType] : Represents the keyboard text input type.
/// - [maxLines] : Represents the max lines in text form field.

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.prefixIconSize = 22,
    this.validator,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.labelText = '',
    this.suffixIcon,
    this.toUnHidePassword = false,
    this.onChanged,
    this.isOutlineInputBorder = false,
    this.keyBoardType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final double prefixIconSize;
  final FormFieldValidator<String>? validator;
  final double verticalPadding;
  final double horizontalPadding;
  final String labelText;
  final Widget? suffixIcon;
  final bool toUnHidePassword;
  final Function(String)? onChanged;
  final bool isOutlineInputBorder;
  final TextInputType keyBoardType;
  final int maxLines;
  final int? maxLength;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool toObscure = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    final responsivenessHandler = ResponsivenessHandler(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            responsivenessHandler.getResponsiveWidth(widget.horizontalPadding),
        vertical:
            responsivenessHandler.getResponsiveHeight(widget.verticalPadding),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText.isNotEmpty) ...[
            Text(
              widget.labelText,
              style: textTheme.headlineSmall,
            ),
            verticalSpacer(),
          ],
          TextFormField(
            scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            controller: widget.controller,
            cursorColor: AppColors.grey,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: textTheme.labelSmall?.copyWith(
                color: AppColors.grey,
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: AppColors.grey,
                      size: widget.prefixIconSize,
                    )
                  : null,
              suffixIcon: widget.toUnHidePassword
                  ? GestureDetector(
                      onTap: () {
                        toObscure = !toObscure;
                        setState(() {});
                      },
                      child: Image.asset(
                        AppImages.passwordEye,
                        scale: 3.4,
                      ),
                    )
                  : widget.suffixIcon,
              enabledBorder: widget.isOutlineInputBorder
                  ? outlineInputBorder()
                  : underlineInputBorder(),
              focusedBorder: widget.isOutlineInputBorder
                  ? outlineInputBorder()
                  : underlineInputBorder(),
              errorBorder: widget.isOutlineInputBorder
                  ? outlineInputBorder()
                  : underlineInputBorder(),
              focusedErrorBorder: widget.isOutlineInputBorder
                  ? outlineInputBorder()
                  : underlineInputBorder(),
            ),
            onChanged: widget.onChanged,
            obscureText: toObscure,
            obscuringCharacter: '•',
            keyboardType: widget.keyBoardType,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
  }
}
