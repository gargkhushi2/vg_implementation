import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    final textTheme = AppStyle.textTheme();
    return Scaffold(
      appBar: const CustomAppHeader(
        headerText: "Addresses",
        toAddAddress: true,
        toShowActions: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: responsivenessHandler.getResponsiveWidth(
                  3,
                ),
              ),
              child: Text(
                "Default Address",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            verticalSpacer(),
            addressCardLayout(
              responsivenessHandler,
              textTheme,
              "Home",
              "David",
              "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
            ),
            Padding(
              padding: EdgeInsets.only(
                left: responsivenessHandler.getResponsiveWidth(
                  3,
                ),
              ),
              child: Text(
                "Other Address",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            verticalSpacer(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return addressCardLayout(
                  responsivenessHandler,
                  textTheme,
                  "Home",
                  "David",
                  "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget addressCardLayout(
  ResponsivenessHandler responsivenessHandler,
  TextTheme textTheme,
  String addressLabelType,
  String userName,
  String address,
) {
  return Container(
    height: responsivenessHandler.getResponsiveHeight(
      20,
    ),
    padding: EdgeInsets.all(
      responsivenessHandler.getResponsiveWidth(
        4,
      ),
    ),
    margin: EdgeInsets.all(
      responsivenessHandler.getResponsiveWidth(
        4,
      ),
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        boxShadow(),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          addressLabelType,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreyShade,
          ),
        ),
        verticalSpacer(
          height: 10,
        ),
        Text(
          userName,
          style: textTheme.headlineSmall,
        ),
        verticalSpacer(
          height: 4,
        ),
        Text(
          address,
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.darkGreyShade,
          ),
        ),
        verticalSpacer(
          height: 10,
        ),
        const Divider(),
        verticalSpacer(
          height: 10,
        ),
        Row(
          children: [
            editOrRemoveLayout(
              textTheme,
              "Edit",
              AppImages.edit,
              () {
                // edit address functionality
              },
            ),
            horizontalSpacer(
              width: 8,
            ),
            const Text(
              "|",
              style: TextStyle(color: AppColors.grey),
            ),
            horizontalSpacer(
              width: 8,
            ),
            editOrRemoveLayout(
              textTheme,
              "Remove",
              AppImages.trash,
              () {
                // remove address functionality
              },
              textColor: AppColors.redBright,
            ),
          ],
        )
      ],
    ),
  );
}

Widget editOrRemoveLayout(
  TextTheme textTheme,
  String text,
  String image,
  VoidCallback actionCallback, {
  Color textColor = AppColors.orange,
}) {
  return GestureDetector(
    onTap: actionCallback,
    child: Row(
      children: [
        ImageLayout(
          imageName: image,
        ),
        Text(
          text,
          style: textTheme.bodySmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
