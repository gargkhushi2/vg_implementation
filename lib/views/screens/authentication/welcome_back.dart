import 'package:after_market_mobile_application/views/screens/authentication/auth_form_base_layout.dart';
import 'package:flutter/material.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthFormBaseLayout(
      authFormAction: () {},
      isUnderlinedButtonText: false,
      isFromWelcomeBack: true,
      
    );
  }
}
