import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/screens/order/orders_list_screen.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

// Screen for displaying placed order details.

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    final textTheme = AppStyle.textTheme();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsivenessHandler.getResponsiveWidth(
              4,
            ),
          ),
          child: Column(
            children: [
              verticalSpacer(
                height: 20,
              ),
              const ImageLayout(
                imageName: AppImages.tickCircle,
                scaleSize: 6,
              ),
              verticalSpacer(),
              Text(
                "Thank you!",
                style: textTheme.headlineLarge,
              ),
              verticalSpacer(),
              Text(
                "Your order has been successfully placed.",
                style: textTheme.labelSmall?.copyWith(
                  color: AppColors.grey,
                ),
              ),
              verticalSpacer(
                height: 26,
              ),
              GestureDetector(
                onTap: () {
                  // navigate to product detail screen
                },
                child: placedOrderCardLayout(
                  responsivenessHandler,
                  textTheme,
                  "Product Name",
                  AppImages.emptyProduct,
                  'S',
                  '01',
                  '15',
                  '100',
                  '90',
                ),
              ),
              verticalSpacer(
                height: 16,
              ),
              deliverToAndExchangeDetailLayout(
                responsivenessHandler,
                textTheme,
                "Ranchview, California-62639",
                "wed, Feb 02 - Fri 4, 2022",
              ),
              verticalSpacer(
                height: 16,
              ),
              amountPaidLayout(
                responsivenessHandler,
                textTheme,
                '26.6',
              ),
              verticalSpacer(
                height: 12,
              ),
              AppButton(
                buttonText: "Track Order",
                onPressed: () {
                  // navigate to track order screen
                },
              ),
              AppButton(
                buttonText: "Continue shopping",
                onPressed: () {
                  // navigate to continue shopping screen
                },
                isOutlinedButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Layout for displaying amount to be paid
Widget amountPaidLayout(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String amount,
) {
  return Container(
    padding: EdgeInsets.all(
      responsivenessHandler.getResponsiveWidth(
        6,
      ),
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(
        8,
      ),
      boxShadow: [
        boxShadow(),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total Payable Amount",
          style: textTheme.headlineSmall,
        ),
        Text(
          '\$$amount',
          style: textTheme.headlineSmall,
        )
      ],
    ),
  );
}

Widget deliverToAndExchangeDetailLayout(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String address,
  String deliveryEstimatedDuration,
) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: responsivenessHandler.getResponsiveWidth(
        3,
      ),
      vertical: responsivenessHandler.getResponsiveHeight(
        1,
      ),
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(
        8,
      ),
      boxShadow: [
        boxShadow(),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deliver to",
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.grey,
          ),
        ),
        Text(
          address,
          style: textTheme.headlineSmall?.copyWith(
            color: AppColors.darkGreyShade,
          ),
        ),
        verticalSpacer(
          height: 12,
        ),
        deliveryOrExchangeLayout(
          textTheme,
          AppImages.deliveryTruck,
          "Delivery by $deliveryEstimatedDuration",
        ),
        verticalSpacer(),
        deliveryOrExchangeLayout(
          textTheme,
          AppImages.exchange,
          "30 Days Exchange/ Return Available",
        ),
      ],
    ),
  );
}

// Layout used for displaying delivery or exchange details
Widget deliveryOrExchangeLayout(
    TextTheme textTheme, String imagePath, String text) {
  return Row(
    children: [
      ImageLayout(
        imageName: imagePath,
      ),
      horizontalSpacer(
        width: 6,
      ),
      Text(
        text,
        style: textTheme.bodySmall?.copyWith(
          color: AppColors.darkGreyShade,
        ),
      ),
    ],
  );
}

// Layout containing placed order details
Widget placedOrderCardLayout(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String productName,
  String imageUrl,
  String size,
  String quantity,
  String discountedPercent,
  String originalPrice,
  String discountedPrice,
) {
  return Container(
    padding: EdgeInsets.all(
      responsivenessHandler.getResponsiveWidth(
        1,
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        8,
      ),
      color: AppColors.white,
      boxShadow: [
        boxShadow(),
      ],
    ),
    child: Column(
      children: [
        orderedProductLayout(
          responsivenessHandler,
          textTheme,
          imageUrl,
          productName,
          size,
          quantity,
          isFromOrderPlacedScreen: true,
          discountedPercent: discountedPercent,
          originalPrice: originalPrice,
          discountedPrice: discountedPrice,
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.all(
            responsivenessHandler.getResponsiveWidth(
              2,
            ),
          ),
          child: Row(
            children: [
              Text(
                "View Details",
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.grey,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey,
                size: 16,
              )
            ],
          ),
        )
      ],
    ),
  );
}
