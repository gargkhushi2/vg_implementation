import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/screens/product/product_information_layout.dart';
import 'package:after_market_mobile_application/views/screens/product/product_item_card_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

/// Screen displaying specific order details.

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.orderStatus,
  });

  final String orderStatus;

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    final textTheme = AppStyle.textTheme();

    return Scaffold(
      appBar: const CustomAppHeader(
        headerText: "Orders Details",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            orderIdCardLayout(
              responsivenessHandler,
              textTheme,
            ),
            verticalSpacer(),
            orderStatusDetailCard(
              responsivenessHandler,
              textTheme,
              "Product Name",
              "21st March 2022",
              orderStatus,
              "Alloy",
              AppImages.emptyCart,
              "L",
              "10",
              "40",
              "38.2",
            ),
            // if(orderStatus == "Delivered")
            // Rate layout
            orderStatusActionCard(
              responsivenessHandler,
              textTheme,
              "Track Order",
              AppImages.trackOrder,
              'Route',
            ),
            if (orderStatus != "Cancelled")
              orderStatusActionCard(
                responsivenessHandler,
                textTheme,
                orderStatus == "Received" ? "Cancel Order" : "Return Order",
                orderStatus == "Received"
                    ? AppImages.cancelOrder
                    : AppImages.returnOrder,
                'Route',
              ),
            verticalSpacer(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsivenessHandler.getResponsiveWidth(
                  4,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    "You may like",
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "View All",
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.grey,
                      size: 14,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: responsivenessHandler.getResponsiveHeight(40),
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (builder, context) => Padding(
                        padding: EdgeInsets.all(
                          responsivenessHandler.getResponsiveWidth(4),
                        ),
                        child: const ProductItemCardLayout(
                          productName:
                              "Super Max Plus Air Filter For Faw Aroma",
                          productImage: AppImages.emptyCart,
                          originalPrice: '40',
                          discountedPrice: '30.25',
                          discountPercent: '15',
                          rating: '3.2',
                          purchaseCount: '41',
                          isOrderDetails: true,
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}

// Card layout for displaying order id and copy functionality.
Widget orderIdCardLayout(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
) {
  return Container(
    height: responsivenessHandler.getResponsiveHeight(
      6.6,
    ),
    width: responsivenessHandler.getScreenWidth(),
    color: AppColors.bluishShade,
    padding: EdgeInsets.symmetric(
      horizontal: responsivenessHandler.getResponsiveWidth(
        2,
      ),
      vertical: responsivenessHandler.getResponsiveWidth(
        1,
      ),
    ),
    child: Row(
      children: [
        Text(
          "ORDER ID:122563174887",
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.darkGreyShade,
            fontWeight: FontWeight.w500,
          ),
        ),
        horizontalSpacer(
          width: responsivenessHandler.getResponsiveWidth(
            44,
          ),
        ),
        const ImageLayout(imageName: AppImages.copy),
        Text(
          "Copy",
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.darkGreyShade,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ),
  );
}

// Card layout displaying the order status details such as product name, duration,
// product size, material, quantity, price(original and discounted).
Widget orderStatusDetailCard(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String productName,
  String duration,
  String orderStatus,
  String material,
  String productImagePath,
  String size,
  String quantity,
  String originalPrice,
  String discountedPrice,
) {
  return Container(
    margin: EdgeInsets.all(
      responsivenessHandler.getResponsiveWidth(
        2,
      ),
    ),
    height: responsivenessHandler.getResponsiveHeight(26),
    decoration: BoxDecoration(
      boxShadow: [
        boxShadow(),
      ],
      color: AppColors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                14,
              ),
              topRight: Radius.circular(
                14,
              ),
            ),
            color: orderStatus == "Received"
                ? AppColors.lightBlue
                : orderStatus == "Delivered"
                    ? AppColors.lightGreen
                    : orderStatus == "Cancelled"
                        ? AppColors.lightPink
                        : AppColors.white,
          ),
          padding: EdgeInsets.all(
            responsivenessHandler.getResponsiveWidth(
              4,
            ),
          ),
          child: orderStatusAndDurationLayout(
            textTheme,
            'Order $orderStatus',
            duration,
          ),
        ),
        orderedProductDetailCardLayout(
          responsivenessHandler,
          textTheme,
          productImagePath,
          material,
          productName,
          originalPrice,
          discountedPrice,
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsivenessHandler.getResponsiveWidth(4),
          ),
          child: Row(
            children: [
              sizeOrQuantityLayout(
                textTheme,
                "Size",
                size,
              ),
              horizontalSpacer(width: 10),
              sizeOrQuantityLayout(
                textTheme,
                "Quantity",
                quantity,
              )
            ],
          ),
        )
      ],
    ),
  );
}

// Card layout for tracking or cancel or return order.
Widget orderStatusActionCard(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String orderAction,
  String orderActionImagePath,
  String routeName,
) {
  return GestureDetector(
    onTap: () {
      // navigate to the route
    },
    child: Container(
      height: responsivenessHandler.getResponsiveHeight(
        8,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          boxShadow(),
        ],
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: AppColors.white,
      ),
      padding: EdgeInsets.all(
        responsivenessHandler.getResponsiveWidth(
          4,
        ),
      ),
      margin: EdgeInsets.all(
        responsivenessHandler.getResponsiveWidth(
          2,
        ),
      ),
      child: Row(
        children: [
          ImageLayout(
            imageName: orderActionImagePath,
          ),
          horizontalSpacer(
            width: 10,
          ),
          Text(
            orderAction,
            style: textTheme.headlineSmall,
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.black,
          )
        ],
      ),
    ),
  );
}

// card layout containing details of ordered product.
Widget orderedProductDetailCardLayout(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String productImagePath,
  String material,
  String productName,
  String originalPrice,
  String discountedPrice,
) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: responsivenessHandler.getResponsiveWidth(
        4,
      ),
      vertical: responsivenessHandler.getResponsiveWidth(
        2,
      ),
    ),
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
            borderRadius: BorderRadius.circular(
              1,
            ),
            border: Border.all(
              color: AppColors.lightestGrey,
            ),
          ),
          child: ImageLayout(
            imageName: productImagePath,
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
              material,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.grey,
              ),
            ),
            verticalSpacer(),
            Text(
              productName,
              style: textTheme.bodySmall,
            ),
            verticalSpacer(
              height: 12,
            ),
            priceAndDiscountLayout(
              textTheme,
              originalPrice,
              discountedPrice,
            ),
          ],
        ),
      ],
    ),
  );
}

// card layout containing size or quantity information.
Widget sizeOrQuantityLayout(TextTheme textTheme, String heading, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        heading,
        style: textTheme.bodySmall?.copyWith(
          color: AppColors.grey,
        ),
      ),
      Text(
        value,
        style: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

// card layout for displaying order status and duration of that status.
Widget orderStatusAndDurationLayout(
  TextTheme textTheme,
  String orderStatus,
  String duration,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        orderStatus,
        style: textTheme.headlineSmall,
      ),
      Text(
        duration,
        style: textTheme.headlineSmall,
      ),
    ],
  );
}
