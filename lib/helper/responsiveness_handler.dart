// This class will handles the responsiveness of the app screens on various devices
// (mobile, tablet, desktop).

import 'package:flutter/material.dart';

class ResponsivenessHandler {
  final BuildContext context;

  ResponsivenessHandler(this.context);

  Size get _screenSize => MediaQuery.of(context).size;

  // function returning the screen width
  double getScreenWidth() {
    return _screenSize.width;
  }

  // function returning the screen height
  double getScreenHeight() {
    return _screenSize.height;
  }

  // function returning the responsive screen width
  double getResponsiveWidth(double percentage) {
    return getScreenWidth() * percentage / 100;
  }

  // function returning the responsive screen height
  double getResponsiveHeight(double percentage) {
    return getScreenHeight() * percentage / 100;
  }

  // function used to check if current device is mobile
  bool isMobile() {
    return getScreenWidth() < 600;
  }

  // function used to check if current device is tablet
  bool isTab() {
    return getScreenWidth() >= 600 && getScreenWidth() < 1200;
  }

  // function used to check if current device is desktop
  bool isDesktop() {
    return getScreenWidth() >= 1200;
  }
}
