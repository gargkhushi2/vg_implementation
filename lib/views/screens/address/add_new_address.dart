import 'package:after_market_mobile_application/helper/responsiveness_handler.dart';
import 'package:after_market_mobile_application/views/shared_widgets/app_button.dart';
import 'package:after_market_mobile_application/views/shared_widgets/common_text_form_field.dart';
import 'package:after_market_mobile_application/views/shared_widgets/custom_app_header.dart';
import 'package:flutter/material.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  List<Map<String, dynamic>> addressFormList = [
    {
      "controller": TextEditingController(),
      "hintText": "Full Name",
      "keyboardType": TextInputType.name,
      "labelText": "Full Name*",
    },
    {
      "controller": TextEditingController(),
      "hintText": "333444555",
      "keyboardType": TextInputType.phone,
      "labelText": "Phone*",
    },
    {
      "controller": TextEditingController(),
      "hintText": "Address",
      "keyboardType": TextInputType.streetAddress,
      "labelText": "Address*",
    },
    {
      "controller": TextEditingController(),
      "hintText": "Landmark",
      "keyboardType": TextInputType.streetAddress,
      "labelText": "Landmark*",
    },
    {
      "controller": TextEditingController(),
      "hintText": "Pin code",
      "keyboardType": TextInputType.number,
      "labelText": "Pin code*",
    },
    {
      "controller": TextEditingController(),
      "hintText": "Please Select",
      "keyboardType": TextInputType.text,
      "labelText": "State/Province*",
    },
    {
      "controller": TextEditingController(),
      "hintText": "City",
      "keyboardType": TextInputType.text,
      "labelText": "City*",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final responsivenessHandler = ResponsivenessHandler(context);
    return Scaffold(
      appBar: const CustomAppHeader(
        headerText: "Add New Address",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsivenessHandler.getResponsiveWidth(
            4,
          ),
          vertical: responsivenessHandler.getResponsiveHeight(
            3,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: addressFormList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommonTextFormField(
                    verticalPadding: responsivenessHandler.getResponsiveHeight(
                      0.16,
                    ),
                    controller: addressFormList[index]['controller'],
                    hintText: addressFormList[index]['hintText'],
                    isOutlineInputBorder: true,
                    labelText: addressFormList[index]['labelText'],
                    keyBoardType: addressFormList[index]['keyboardType'],
                  );
                },
              ),
              AppButton(
                buttonText: "Save Address",
                onPressed: () {
                  // save address functionality
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
