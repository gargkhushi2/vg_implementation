import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/validator.dart';
import 'package:after_market_mobile_application/routes/app_routes.dart';
import 'package:after_market_mobile_application/views/screens/password/password_action_base_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/common_text_form_field.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final passwordController = TextEditingController();

  bool _hasUpperCase = false;
  bool _hasLowerCase = false;
  bool _hasSpecialCharacter = false;
  bool _hasMinLength = false;
  bool _hasNumber = false;

  void validatePassword(String value) {
    setState(() {
      _hasUpperCase = Validator.hasUpperCase(value) ?? false;
      _hasLowerCase = Validator.hasLowerCase(value) ?? false;
      _hasSpecialCharacter = Validator.hasSpecialCharacter(value) ?? false;
      _hasMinLength = Validator.eightCharactersMinimum(value) ?? false;
      _hasNumber = Validator.hasNumber(value) ?? false;
      print(
          "uppercase : $_hasUpperCase, lowercase : $_hasLowerCase, special : $_hasSpecialCharacter, eight characters : $_hasMinLength, number : $_hasNumber");
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    return PasswordActionBaseLayout(
      actionText: AppStrings.enterNewPassword,
      actionSuggestionText: AppStrings.enterPasswordSuggestion,
      actionButtonText: AppStrings.updatePassword,
      actionWidgetLayout: Column(
        children: [
          CommonTextFormField(
            controller: TextEditingController(),
            hintText: AppStrings.demoPassword,
            labelText: AppStrings.newPassword,
            prefixIcon: Icons.lock_outline,
            horizontalPadding: 0,
            toUnHidePassword: true,
          ),
          verticalSpacer(
            height: 12,
          ),
          CommonTextFormField(
            controller: passwordController,
            hintText: AppStrings.demoPassword,
            labelText: AppStrings.confirmPassword,
            prefixIcon: Icons.lock_outline,
            horizontalPadding: 0,
            toUnHidePassword: true,
            onChanged: validatePassword,
          ),
          verticalSpacer(
            height: 12,
          ),
          _buildPasswordValidationText(
              "One uppercase character", _hasUpperCase, textTheme),
          _buildPasswordValidationText(
              "One special character", _hasSpecialCharacter, textTheme),
          _buildPasswordValidationText(
              "One lowercase character", _hasLowerCase, textTheme),
          _buildPasswordValidationText(
              "8 character minimum", _hasMinLength, textTheme),
          _buildPasswordValidationText(
              "Atleast one number", _hasNumber, textTheme)
        ],
      ),
      onActionButtonPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.passwordChangeSuccess);
      },
    );
  }

  Widget _buildPasswordValidationText(
      String validationText, bool isValid, TextTheme textTheme) {
    return Row(
      children: [
        Icon(isValid ? Icons.check_circle : Icons.cancel_outlined),
        Text(
          validationText,
          style: textTheme.bodySmall?.copyWith(
            color: isValid ? AppColors.green : AppColors.redShade,
          ),
        )
      ],
    );
  }
}
