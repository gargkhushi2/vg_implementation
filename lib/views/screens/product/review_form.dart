import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/common_text_form_field.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:after_market_mobile_application/views/shared_widgets/image_layout.dart';
import 'package:after_market_mobile_application/views/shared_widgets/spacer.dart';
import 'package:flutter/material.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  List<bool> isRatedList = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    final textTheme = AppStyle.textTheme();

    return Scaffold(
      appBar: const CustomAppHeader(
        headerText: "Write Review",
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(
          responsivenessHandler.getResponsiveWidth(
            4,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: responsivenessHandler.getResponsiveHeight(
                    10,
                  ),
                  height: responsivenessHandler.getResponsiveHeight(
                    10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(
                      4,
                    ),
                  ),
                  child: const ImageLayout(
                    imageName: AppImages.emptyProduct,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2005-2015 VIC Air Filter - A1028",
                      style: textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: responsivenessHandler.getResponsiveHeight(
                        3.4,
                      ),
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            isRatedList[index] = !isRatedList[index];

                            setState(() {});
                          },
                          child: Image.asset(
                            AppImages.addRating,
                            color: isRatedList[index]
                                ? AppColors.orange
                                : AppColors.lightGreyShade,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            verticalSpacer(
              height: 20,
            ),
            CommonTextFormField(
              controller: TextEditingController(),
              hintText: "Heading of your review",
              isOutlineInputBorder: true,
            ),
            verticalSpacer(
              height: 14,
            ),
            CommonTextFormField(
              controller: TextEditingController(),
              hintText: "Write Your Review",
              isOutlineInputBorder: true,
              maxLines: 6,
            ),
            verticalSpacer(
              height: 20,
            ),
            Container(
              width: responsivenessHandler.getResponsiveHeight(
                10,
              ),
              height: responsivenessHandler.getResponsiveHeight(
                10,
              ),
              padding: EdgeInsets.all(
                responsivenessHandler.getResponsiveWidth(
                  6,
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: const ImageLayout(
                imageName: AppImages.galleryAdd,
              ),
            ),
            verticalSpacer(),
            Text(
              "Add Photo",
              style: textTheme.labelSmall?.copyWith(
                color: AppColors.grey,
              ),
            ),
            verticalSpacer(height: 40),
            AppButton(
              buttonText: "Submit Review",
              onPressed: () {},
              isEnabled: false,
            )
          ],
        ),
      ),
    );
  }
}
