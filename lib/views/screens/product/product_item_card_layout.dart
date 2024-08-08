import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/routes/app_routes.dart';
import 'package:after_market_mobile_application/views/screens/product/product_information_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';

import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

/// This widget defines the common card layout for a product item.
///
/// [productName] - The name of the product.
/// [productImage] - The image of the product.
/// [originalPrice] - The original price of the product.
/// [discountedPrice] - The discounted price of the product.
/// [discountPercent] - The discount percentage of the product.
/// [rating] - The rating of the product.
/// [purchaseCount] - The number of purchases for the product.
/// [isTrending] - If true, displays the trending label; otherwise, hides it.
/// [isWishListed] - If true, displays the wishlist icon; otherwise, displays a un-wishlist
/// icon.
/// [isOrderDetails] - If true, customizes the card layout for order details screen.

class ProductItemCardLayout extends StatefulWidget {
  const ProductItemCardLayout({
    super.key,
    required this.productName,
    required this.productImage,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercent,
    required this.rating,
    required this.purchaseCount,
    this.isTrending = false,
    this.isWishListed = false,
    this.isOrderDetails = false,
  });

  final String productName;
  final String productImage;
  final String originalPrice;
  final String discountedPrice;
  final String discountPercent;
  final String rating;
  final String purchaseCount;
  final bool isTrending;
  final bool isWishListed;
  final bool isOrderDetails;

  @override
  State<ProductItemCardLayout> createState() => _ProductItemCardLayoutState();
}

class _ProductItemCardLayoutState extends State<ProductItemCardLayout> {
  late bool isWishListed;

  @override
  void initState() {
    isWishListed = widget.isWishListed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    final textTheme = AppStyle.textTheme();

    return GestureDetector(
      onTap: () {
        // navigate to product details screen
        Navigator.of(context).pushNamed(
          AppRoutes.productDetail,
        );
      },
      child: SizedBox(
        width: responsivenessHandler.getResponsiveWidth(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: responsivenessHandler
                  .getResponsiveWidth(widget.isOrderDetails ? 46 : 40),
              height: responsivenessHandler
                  .getResponsiveHeight(widget.isOrderDetails ? 16 : 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: widget.isOrderDetails
                      ? AppColors.lightGreyBorderShade
                      : AppColors.lightGreyShade,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: widget.isTrending
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: [
                      if (widget.isTrending && !widget.isOrderDetails)
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 2.6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(
                              3,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              "Trending",
                              style: textTheme.headlineSmall?.copyWith(
                                fontSize: 10,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                          top: 6,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // set isWishListed to true
                            isWishListed = !isWishListed;
                            setState(() {});
                          },
                          child: Icon(
                            isWishListed
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline,
                            size: 20,
                            color: isWishListed
                                ? AppColors.redShade
                                : AppColors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: responsivenessHandler.getResponsiveHeight(
                      12,
                    ),
                    child: ImageLayout(
                      imageName: widget.productImage,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(),
            Text(
              widget.productName,
              style: textTheme.bodySmall,
            ),
            verticalSpacer(),
            priceAndDiscountLayout(
              textTheme,
              widget.originalPrice,
              widget.discountedPrice,
              discountPercent: widget.discountPercent,
              isOrderDetails: widget.isOrderDetails,
            ),
            verticalSpacer(),
            ratingAndReviewLayout(
              textTheme,
              widget.rating,
              widget.purchaseCount,
              isProductCard: true,
            ),
          ],
        ),
      ),
    );
  }
}
