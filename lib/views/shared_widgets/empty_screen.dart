import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:flutter/material.dart';

/// A widget to display a common empty screen with customizable messages and images
/// for different contexts such as product, cart, and order screens.
///
/// [emptyDataMessage] is the message displayed when the screen is empty and is not
/// customizable.
/// [isProduct] if true, customizes the screen for no products found.
/// [isOrder] if true, customizes the screen for no orders found.
/// [isCart] if true, customizes the screen for an empty cart.

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    this.emptyDataMessage = AppStrings.emptyString,
    this.isProduct = false,
    this.isOrder = false,
    this.isCart = false,
  });

  final String emptyDataMessage;
  final bool isProduct;
  final bool isOrder;
  final bool isCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: emptyDataMessage.isNotEmpty
          ? Center(
              child: Text(
                emptyDataMessage,
              ),
            )
          : customizedEmptyScreenLayout(
              isProduct,
              isOrder,
              isCart,
            ),
    );
  }

  // customizable empty screen for empty product, order, and cart.
  Widget customizedEmptyScreenLayout(
    bool isProduct,
    bool isOrder,
    bool isCart,
  ) {
    final textTheme = AppStyle.textTheme();
    String imageName = isProduct
        ? AppImages.emptyProduct
        : isOrder
            ? AppImages.emptyOrder
            : isCart
                ? AppImages.emptyCart
                : AppStrings.emptyString;
    String emptyMessage = isProduct
        ? AppStrings.noResultsFound
        : isOrder
            ? AppStrings.noOrdersFound
            : isCart
                ? AppStrings.emptyCart
                : AppStrings.emptyString;
    String suggestionText = isOrder
        ? AppStrings.notAcceptingOrdersSuggestionText
        : isCart
            ? AppStrings.noItemsInCart
            : AppStrings.emptyString;
    String buttonText =
        isOrder || isCart ? AppStrings.startShopping : AppStrings.emptyString;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 160,
          ),
          ImageLayout(
            imageName: imageName,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            emptyMessage,
            style: textTheme.headlineLarge?.copyWith(
              fontSize: 24,
              color: isProduct ? AppColors.grey : AppColors.black,
              decoration:
                  isProduct ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
          if (suggestionText.isNotEmpty) ...[
            const SizedBox(
              height: 12,
            ),
            Text(
              suggestionText,
              style: textTheme.labelSmall?.copyWith(
                color: AppColors.darkGreyShade,
              ),
            ),
          ],
          if (buttonText.isNotEmpty) ...[
            const SizedBox(
              height: 20,
            ),// Custom width for the space
            AppButton(
              buttonText: buttonText,
              onPressed: () {
                // navigate to shopping screen
              },
            ),
          ]
        ],
      ),
    );
  }
}
