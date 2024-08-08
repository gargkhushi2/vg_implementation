import 'package:flutter/material.dart';

/// Creates a vertical spacer with the specified height.
Widget verticalSpacer({double height = 8}) {
  return SizedBox(
    height: height,
  );
}

/// Creates a horizontal spacer with the specified width.
Widget horizontalSpacer({double width = 2}) {
  return SizedBox(
    width: width,
  );
}

/// Creates a space within a text span.
WidgetSpan textSpanSpacer({double width = 2}) {
  return WidgetSpan(
    child: SizedBox(
      width: width,
    ),
  );
}
