import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/screens/product/product_information_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);

    return Scaffold(
      appBar: const CustomAppHeader(
        toShowActions: true,
        toWishlistOrShare: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          responsivenessHandler.getResponsiveWidth(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: responsivenessHandler.getResponsiveHeight(
                32,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGreyShade,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            verticalSpacer(
              height: 12,
            ),
            const ProductInformationLayout(
                productName: "2005-2015 VIC Air Filter - A1028",
                productDescription:
                    "if you wish to experience breezy. beaches, swaying palm trees, and quirky beach shacks, make your way to Bali. Our Bali tour is dotted with volcanic mountains, iconic rice paddies, and vibrant nightlife. Now that you have booked your experiential tour package.",
                originalPrice: "90.25",
                discountedPrice: "90",
                discountPercent: "15",
                rating: "4.2",
                review: "41")
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: responsivenessHandler.getResponsiveWidth(
              43,
            ),
            child: AppButton(
              buttonText: "Add to Cart",
              onPressed: () {},
              isOutlinedButton: true,
            ),
          ),
          SizedBox(
            width: responsivenessHandler.getResponsiveWidth(
              43,
            ),
            child: AppButton(
              buttonText: "Buy Now",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
