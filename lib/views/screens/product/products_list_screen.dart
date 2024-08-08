import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/networking/response_data_state.dart';
import 'package:after_market_mobile_application/views/screens/product/product_item_card_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_response_widget_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

// This class represents the product list screen, which can also serve as the favorites
// screen.
/// [productName] is used to display the product name on the header and to list all
/// products associated with that name.
/// [isFavouriteScreen] is a boolean flag that determines if the layout is for the
/// favorites screen.

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({
    super.key,
    required this.productName,
    this.isFavouriteScreen = false,
  });

  final String productName;
  final bool isFavouriteScreen;

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  void initState() {
    // fetching products list on the basis of product name
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    final responsivenessHandler = ResponsivenessHandler(context);

    return Scaffold(
      appBar: CustomAppHeader(
        headerText:
            widget.isFavouriteScreen ? 'Favourites' : widget.productName,
        toShowActions: widget.isFavouriteScreen ? false : true,
      ),
      body: CustomResponseWidgetLayout(
        viewState: ViewState.success,
        emptyDataMessage: '',
        errorMessage: '',
        isProduct: true,
        height: responsivenessHandler.getResponsiveHeight(80),
        successWidget: Column(
          children: [
            verticalSpacer(
              height: 10,
            ),
            if (!widget.isFavouriteScreen)
              Text(
                '10 items',
                style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.grey),
              ),
            SizedBox(
              height: responsivenessHandler
                  .getResponsiveHeight(widget.isFavouriteScreen ? 86 : 76),
              child: SingleChildScrollView(
                child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 18),
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.64,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return const ProductItemCardLayout(
                        productName: "Super Max Plus Air Filter For Faw Aroma",
                        productImage: AppImages.emptyCart,
                        originalPrice: '40',
                        discountedPrice: '30.25',
                        discountPercent: '15',
                        rating: '3.2',
                        purchaseCount: '41',
                      );
                    }),
              ),
            ),
            if (!widget.isFavouriteScreen) filterAndSortLayout(textTheme),
          ],
        ),
      ),
    );
  }
}

// Layout for filter and sort options
Widget filterAndSortLayout(TextTheme textTheme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      filterSortComponent(
        textTheme,
        'Filter',
        AppImages.filter,
        () {
          // filtering
        },
      ),
      filterSortComponent(
        textTheme,
        'Sort By',
        AppImages.sort,
        () {
          // sorting
        },
      )
    ],
  );
}

// Layout for individual filter or sort option
Widget filterSortComponent(TextTheme textTheme, String name, String image,
    VoidCallback filterSortAction) {
  return GestureDetector(
    onTap: filterSortAction,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageLayout(
          imageName: image,
        ),
        verticalSpacer(),
        Text(
          name,
          style: textTheme.labelSmall?.copyWith(
            color: AppColors.darkGreyShade,
          ),
        ),
      ],
    ),
  );
}
