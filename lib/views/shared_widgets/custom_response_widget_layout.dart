import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/networking/response_data_state.dart';
import 'package:after_market_mobile_application/views/shared_widgets/empty_screen.dart';
import 'package:after_market_mobile_application/views/shared_widgets/error_screen.dart';
import 'package:after_market_mobile_application/views/shared_widgets/loading_screen.dart';
import 'package:flutter/material.dart';

/// A class that displays different widgets based on the given [viewState].
///
/// - If [viewState] is loading, it shows a loading screen.
/// - If [viewState] is empty, it shows an empty screen or a provided empty widget.
/// - If [viewState] is error, it shows an error screen or a provided error widget.
/// - If [viewState] is success, it shows the [successWidget].
///
/// [successWidget] - represents the success screen layout.
/// [errorMessage] - message indicating error in error screen.
/// [emptyDataMessage] - message indicating empty data in empty screen.
/// [isProduct], [isCart], [isOrder] if true, customizes the empty screen.

class CustomResponseWidgetLayout extends StatelessWidget {
  const CustomResponseWidgetLayout({
    super.key,
    this.viewState,
    this.errorMessage,
    this.emptyDataMessage,
    required this.successWidget,
    this.errorWidget,
    this.emptyWidget,
    this.height = 0.0,
    this.isProduct = false,
    this.isOrder = false,
    this.isCart = false,
  });

  final ViewState? viewState;
  final String? errorMessage;
  final String? emptyDataMessage;
  final Widget successWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final double height;
  final bool isProduct;
  final bool isOrder;
  final bool isCart;

  @override
  Widget build(BuildContext context) {
    return buildWidget(
      viewState ?? ViewState.loading,
      errorMessage ?? AppStrings.emptyString,
      emptyDataMessage ?? AppStrings.emptyString,
    );
  }

  Widget buildWidget(
    ViewState viewState,
    String errorMessage,
    String emptyDataMessage,
  ) {
    if (viewState == ViewState.loading) {
      return SizedBox(
        height: height,
        child: const LoadingScreen(),
      );
    } else if (viewState == ViewState.empty) {
      return SizedBox(
        height: height,
        child: emptyWidget ??
            EmptyScreen(
              emptyDataMessage: emptyDataMessage,
              isProduct: isProduct,
              isCart: isCart,
              isOrder: isOrder,
            ),
      );
    } else if (viewState == ViewState.error) {
      return SizedBox(
        height: height,
        child: errorWidget ??
            ErrorScreen(
              errorMessage: errorMessage,
            ),
      );
    } else if (viewState == ViewState.success) {
      return successWidget;
    } else {
      throw UnimplementedError('${AppStrings.unexpectedState} $viewState');
    }
  }
}
