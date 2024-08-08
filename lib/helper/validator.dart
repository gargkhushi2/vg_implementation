// This class will contain all the validation functions for the textFormFields.

import 'package:after_market_mobile_application/constants/app_regex.dart';

class Validator {
  // this function will validate the pattern
  static bool? validatePattern(String? value, String pattern) {
    if (value != null && !RegExp(pattern).hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool? hasUpperCase(value) {
    return validatePattern(value, AppRegex.upperCaseRegex);
  }

  static bool? hasLowerCase(value) {
    return validatePattern(value, AppRegex.lowerCaseRegex);
  }

  static bool? hasSpecialCharacter(value) {
    return validatePattern(value, AppRegex.specialCharacterRegex);
  }

  static bool? eightCharactersMinimum(value) {
    return value.length >= 8;
  }

  static bool? hasNumber(value) {
    return validatePattern(value, AppRegex.numberRegex);
  }
}
