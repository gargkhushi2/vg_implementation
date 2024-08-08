import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

/// Screen displaying the product information.
class ProductInformationLayout extends StatelessWidget {
  const ProductInformationLayout({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercent,
    required this.rating,
    required this.review,
  });
  final String productName;
  final String productDescription;
  final String originalPrice;
  final String discountedPrice;
  final String discountPercent;
  final String rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpacer(),
        ratingAndReviewLayout(textTheme, rating, review),
        verticalSpacer(),
        priceAndDiscountLayout(
          textTheme,
          originalPrice,
          discountedPrice,
          discountPercent: discountPercent,
        ),
        verticalSpacer(),
        Text(
          "Description",
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpacer(),
        Text(
          productDescription,
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}

/// layout for displaying original and discount price and discount percent.
Widget priceAndDiscountLayout(
  TextTheme textTheme,
  String originalPrice,
  String discountedPrice, {
  String discountPercent = '',
  bool isOrderDetails = false,
}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '\$$discountedPrice',
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        textSpanSpacer(),
        TextSpan(
          text: '\$$originalPrice',
          style: textTheme.headlineSmall?.copyWith(
            color: AppColors.lightGreyShade,
            fontSize: 10,
            decoration: TextDecoration.lineThrough,
            decorationThickness: 2,
          ),
        ),
        if (discountPercent.isNotEmpty) ...[
          textSpanSpacer(),
          TextSpan(
            text: '$discountPercent% off',
            style: textTheme.headlineSmall?.copyWith(
              color: isOrderDetails ? AppColors.orange : AppColors.redShade,
              fontSize: 10,
            ),
          ),
        ],
      ],
    ),
  );
}

/// layout for displaying ratings and reviews.
Widget ratingAndReviewLayout(
  TextTheme textTheme,
  String rating,
  String review, {
  bool isProductCard = false,
}) {
  return Row(
    children: [
      const ImageLayout(
        imageName: AppImages.rating,
      ),
      horizontalSpacer(),
      Text(
        '4.3',
        style: textTheme.bodySmall,
      ),
      horizontalSpacer(),
      Text(
        isProductCard ? '($review)' : '$review Reviews',
        style: textTheme.bodySmall?.copyWith(
          color: AppColors.darkGreyShade,
        ),
      ),
    ],
  );
}
