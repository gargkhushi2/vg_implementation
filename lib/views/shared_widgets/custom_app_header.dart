import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

// This class defines a customizable app header (AppBar).
//
// By default, a back button is shown as the leading icon.
/// - [toShowMenu] : If true, displays a menu icon as the leading icon instead of the back
/// button.
/// - [headerText] : Displays this text in the middle of the AppBar.
/// - [toShowActions] : If true, displays action icons - 'search' and 'cart' on the right
///  side of the AppBar(by default).
/// - [toWishlistOrShare] : If true and [toShowActions] is true, displays 'wishlist', 'share',
///  and 'cart' icons on the right.
/// - [toAddAddress] : If true and [toShowActions] is true and [toWishlistOrShare] is false,
///  shows an "Add new address" button on the right side of the AppBar, instead of other
///  action icons.
/// - [backButtonCallback] : A callback function for handling back button tap events.

class CustomAppHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppHeader({
    super.key,
    this.toShowMenu = false,
    this.headerText = '',
    this.toShowActions = false,
    this.toWishlistOrShare = false,
    this.toAddAddress = false,
    this.backButtonCallback,
  });
  final bool toShowMenu;
  final String headerText;
  final bool toShowActions;
  final bool toWishlistOrShare;
  final bool toAddAddress;
  final VoidCallback? backButtonCallback;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();
    return AppBar(
      backgroundColor: AppColors.white,
      leading: toShowMenu
          ? GestureDetector(
              onTap: () {
                // navigate to menu
              },
              child: const Icon(
                Icons.menu,
                color: AppColors.black,
              ),
            )
          : GestureDetector(
              onTap: () {
                if (backButtonCallback != null) {
                  backButtonCallback;
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.blackShade,
              ),
            ),
      title: headerText.isNotEmpty
          ? Text(
              headerText,
              style: textTheme.headlineLarge?.copyWith(
                fontSize: 22,
              ),
            )
          : null,
      actions: toShowActions
          ? toWishlistOrShare
              ? [
                  Row(
                    children: [
                      ImageLayout(
                        imageName: AppImages.wishlist,
                        onAssetImageTap: () {
                          // item added to wishlist functionality
                        },
                      ),
                      horizontalSpacer(
                        width: 8,
                      ),
                      ImageLayout(
                        imageName: AppImages.share,
                        onAssetImageTap: () {
                          // share functionality
                        },
                      ),
                      horizontalSpacer(
                        width: 8,
                      ),
                      cartIconLayout(),
                      horizontalSpacer(
                        width: 8,
                      ),
                    ],
                  ),
                ]
              : toAddAddress
                  ? [
                      addNewAddressButtonLayout(
                        textTheme,
                        context,
                      ),
                    ]
                  : [
                      Row(
                        children: [
                          ImageLayout(
                            imageName: AppImages.search,
                            onAssetImageTap: () {
                              // opens autocomplete search field
                            },
                          ),
                          horizontalSpacer(
                            width: 8,
                          ),
                          cartIconLayout(),
                          horizontalSpacer(
                            width: 8,
                          ),
                        ],
                      ),
                    ]
          : null,
      centerTitle: true,
    );
  }

  // Layout for the cart icon.
  Widget cartIconLayout() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Positioned(
          top: -1,
          right: -1,
          child: Icon(
            Icons.circle,
            color: AppColors.redShade,
            size: 6,
          ),
        ),
        ImageLayout(
          imageName: AppImages.cart,
          onAssetImageTap: () {
            // navigate to cart screen
          },
        ),
      ],
    );
  }

  // Layout for the "Add new address" button.
  Widget addNewAddressButtonLayout(TextTheme textTheme, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: OutlinedButton(
        onPressed: () {
          // navigate to add address screen
        },
        child: Text(
          AppStrings.newAddress,
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
