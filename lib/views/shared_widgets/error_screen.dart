import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    return Scaffold(
      body: Center(
        child: Text(
          errorMessage,
          style: textTheme.headlineSmall?.copyWith(
            color: AppColors.redShade,
          ),
        ),
      ),
    );
  }
}
