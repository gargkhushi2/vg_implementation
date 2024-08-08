import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/routes/app_routes.dart';
import 'package:after_market_mobile_application/views/screens/product/product_information_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/common_text_form_field.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

/// Screen displaying list of orders
class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    final textTheme = AppStyle.textTheme();
    return Scaffold(
      appBar: const CustomAppHeader(
        toShowMenu: true,
        headerText: "Orders",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacer(
              height: 20,
            ),
            CommonTextFormField(
              controller: TextEditingController(),
              hintText: "Search order",
              horizontalPadding: responsivenessHandler.getResponsiveWidth(
                1,
              ),
              isOutlineInputBorder: true,
              prefixIcon: Icons.search,
              onChanged: (value) {
                // search for the order
              },
            ),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => orderCardLayout(
                context,
                responsivenessHandler,
                textTheme,
                "Delivered",
                "21 March 2024",
                AppImages.emptyProduct,
                "Cart",
                "L",
                "20",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Creates a common order card layout.
///
/// [orderStatus] is the current status of the order.
/// [date] is the date of the order.
/// [orderStatusImagePath] is the path to the image representing the order status.
/// [productImage] is the path to the product image.
/// [productName] is the name of the product.
/// [productSize] is the size of the product.
/// [productQuantity] is the quantity of the product.

Widget orderCardLayout(
  BuildContext context,
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String orderStatus,
  String date,
  String productImage,
  String productName,
  String productSize,
  String productQuantity,
) {
  return Container(
    margin: EdgeInsets.all(responsivenessHandler.getResponsiveWidth(4)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.white,
    ),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to order details screen
            Navigator.of(context).pushNamed(
              AppRoutes.orderDetail,
              arguments: orderStatus,
            );
          },
          child: orderStatusLayout(
              responsivenessHandler,
              textTheme,
              orderStatus == "Received"
                  ? AppImages.orderReceived
                  : orderStatus == "Delivered"
                      ? AppImages.orderDelivered
                      : orderStatus == "Cancelled"
                          ? AppImages.orderCancel
                          : '',
              'Order $orderStatus',
              date,
              "Route" // will be passed later
              ),
        ),
        const Divider(),
        orderedProductLayout(
          responsivenessHandler,
          textTheme,
          productImage,
          productName,
          productSize,
          productQuantity,
        ),
        if (orderStatus == "Received" || orderStatus == "Delivered") ...[
          const Divider(),
          orderActionButtonLayout(
            responsivenessHandler,
            orderStatus == "Received"
                ? "Cancel"
                : orderStatus == "Delivered"
                    ? "Exchange"
                    : '',
            orderStatus == "Received"
                ? "Track"
                : orderStatus == "Delivered"
                    ? "Return"
                    : '',
            orderStatus == "Received"
                ? () {
                    // cancel the order
                  }
                : orderStatus == "Delivered"
                    ? () {
                        // exchange the order
                      }
                    : () {},
            orderStatus == "Received"
                ? () {
                    // track the order
                  }
                : orderStatus == "Delivered"
                    ? () {
                        // return the order(navigate to return order screen)
                        Navigator.of(context).pushNamed(
                          AppRoutes.returnOrder,
                        );
                      }
                    : () {},
          ),
        ],
      ],
    ),
  );
}

/// Layout containing information about the ordered product.
Widget orderedProductLayout(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String productImage,
  String productName,
  String productSize,
  String productQuantity, {
  bool isFromOrderPlacedScreen = false,
  String? originalPrice,
  String? discountedPrice,
  String? discountedPercent,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        horizontalSpacer(
          width: responsivenessHandler.getResponsiveWidth(
            4,
          ),
        ),
        Container(
          width: responsivenessHandler.getResponsiveHeight(
            10,
          ),
          height: responsivenessHandler.getResponsiveHeight(
            10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            border: Border.all(
              color: AppColors.lightestGrey,
            ),
          ),
          child: ImageLayout(
            imageName: productImage,
          ),
        ),
        horizontalSpacer(
          width: responsivenessHandler.getResponsiveWidth(
            4,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.darkGreyShade,
              ),
            ),
            verticalSpacer(),
            if (isFromOrderPlacedScreen) ...[
              priceAndDiscountLayout(
                textTheme,
                originalPrice ?? AppStrings.emptyString,
                discountedPrice ?? AppStrings.emptyString,
                discountPercent: discountedPercent ?? AppStrings.emptyString,
                isOrderDetails: isFromOrderPlacedScreen,
              ),
              verticalSpacer(),
            ],
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: isFromOrderPlacedScreen ? "Size " : "Size:$productSize",
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.darkGreyShade,
                  ),
                ),
                if (isFromOrderPlacedScreen)
                  TextSpan(
                    text: productSize,
                    style: textTheme.bodySmall?.copyWith(),
                  ),
                textSpanSpacer(width: 6),
                TextSpan(
                  text: isFromOrderPlacedScreen
                      ? "Quantity "
                      : "Quantity:$productQuantity",
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.darkGreyShade,
                  ),
                ),
                if (isFromOrderPlacedScreen)
                  TextSpan(
                    text: productQuantity,
                    style: textTheme.bodySmall?.copyWith(),
                  ),
              ]),
            )
          ],
        ),
      ],
    ),
  );
}

/// Layout containing the order status information.
Widget orderStatusLayout(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String orderStatusImagePath,
  String orderStatus,
  String date,
  String routeName,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 18,
      horizontal: 18,
    ),
    child: Row(
      children: [
        ImageLayout(imageName: orderStatusImagePath),
        horizontalSpacer(width: responsivenessHandler.getResponsiveWidth(4)),
        Column(
          children: [
            Text(
              orderStatus,
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              date,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.darkGreyShade,
              ),
            ),
          ],
        ),
        horizontalSpacer(width: responsivenessHandler.getResponsiveWidth(38)),
        const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.grey,
          size: 18,
        )
      ],
    ),
  );
}

// Layout containing action buttons for the order.
/// [previousButtonText] is the text displayed on the previous button (optional).
/// [nextButtonText] is the text displayed on the next button (optional).
/// [previousButtonAction] is the callback function executed when the previous button is
/// pressed (optional).
/// [nextButtonAction] is the callback function executed when the next button is pressed
/// (optional).

Widget orderActionButtonLayout(
  ResponsivenessHandler responsivenessHandler,
  String previousButtonText,
  String nextButtonText,
  VoidCallback previousButtonAction,
  VoidCallback nextButtonAction,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: responsivenessHandler.getResponsiveWidth(36),
        height: responsivenessHandler.getResponsiveHeight(8.4),
        child: AppButton(
          buttonText: previousButtonText,
          onPressed: previousButtonAction,
          isOutlinedButton: true,
          borderRadius: 4,
        ),
      ),
      SizedBox(
        width: responsivenessHandler.getResponsiveWidth(36),
        height: responsivenessHandler.getResponsiveHeight(8.4),
        child: AppButton(
          buttonText: nextButtonText,
          onPressed: nextButtonAction,
          isOutlinedButton: true,
          borderRadius: 4,
          borderColor: AppColors.orange,
          buttonTextColor: AppColors.orange,
        ),
      ),
    ],
  );
}
