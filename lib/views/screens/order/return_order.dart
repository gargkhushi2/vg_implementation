import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/screens/order/order_details.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/common_text_form_field.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

class ReturnOrder extends StatefulWidget {
  const ReturnOrder({super.key});

  @override
  State<ReturnOrder> createState() => _ReturnOrderState();
}

class _ReturnOrderState extends State<ReturnOrder> {
  List<String> reasonForReturnOptionsList = [
    "Quality Issues",
    "I Changed My Mind",
    "Item Damaged",
    "Received wrong item",
    "Size/Fit Issue",
    "Image shown did not match the actual Product",
  ];
  String? selectedReasonForReturn;

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    final textTheme = AppStyle.textTheme();
    return Scaffold(
      appBar: const CustomAppHeader(
        headerText: "Return Order",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              "Delivered",
              "Alloy",
              AppImages.emptyCart,
              "L",
              "10",
              "40",
              "38.2",
            ),
            Container(
              padding: EdgeInsets.all(
                responsivenessHandler.getResponsiveWidth(
                  4,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reason for return",
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                  verticalSpacer(),
                  Text(
                    "Please tell us correct reason for return. This \ninformation is only to improve our service",
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reasonForReturnOptionsList.length,
                    itemBuilder: (builder, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsivenessHandler.getResponsiveWidth(
                          2,
                        ),
                      ),
                      child: RadioListTile(
                        value: reasonForReturnOptionsList[index],
                        title: Text(
                          reasonForReturnOptionsList[index],
                          style: textTheme.labelSmall?.copyWith(
                            color: AppColors.grey,
                            fontSize: 16,
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
                        activeColor: AppColors.orange,
                        groupValue: selectedReasonForReturn,
                        onChanged: (value) {
                          // selected reason for return
                          selectedReasonForReturn = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  verticalSpacer(
                    height: 14,
                  ),
                  CommonTextFormField(
                    controller: TextEditingController(),
                    hintText: "Additional Comment",
                    isOutlineInputBorder: true,
                    maxLines: 6,
                    horizontalPadding: responsivenessHandler.getResponsiveWidth(
                      1,
                    ),
                  ),
                  verticalSpacer(
                    height: 20,
                  ),
                  AppButton(
                    buttonText: "Continue",
                    onPressed: () {
                      // return order functionality
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
