import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_images.dart';
import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A search field widget with autocomplete functionality.
///
/// [itemsList] is the list of items for the autocomplete suggestions.
/// [controller] is the controller for the text field.

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.itemsList,
    required this.controller,
  });

  final List<String> itemsList;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppStyle.textTheme();

    return Autocomplete(
      optionsBuilder: (searchFieldController) {
        if (searchFieldController.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return itemsList.where((String option) {
          return option
              .toLowerCase()
              .startsWith(searchFieldController.text.toLowerCase());
        });
      },
      onSelected: (String selectedOption) {
        controller.text = selectedOption;
        if (kDebugMode) {
          print("Selected searched option is : ${controller.text}");
        }
        // Navigate to the list screen using the selected option as search query
      },
      fieldViewBuilder:
          (context, searchFieldController, focusNode, onFieldSubmitted) {
        searchFieldController.text = controller.text;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                offset: const Offset(0, 3),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              14,
            ),
            child: TextField(
              controller: searchFieldController,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: AppStrings.searchAnything,
                hintStyle: textTheme.labelSmall?.copyWith(
                  color: AppColors.grey,
                ),
                prefixIcon: Image.asset(
                  AppImages.back,
                  scale: 4,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    // clear the textfield
                    searchFieldController.clear();
                  },
                  child: Image.asset(
                    AppImages.close,
                    scale: 4,
                  ),
                ),
                border: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
              ),
              onChanged: (value) {
                controller.text = value;
              },
            ),
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) => ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          final String option = options.elementAt(index); // fetching option
          final String enteredText = controller.text; // fetching entered text
          final int matchIndex = option
              .toLowerCase()
              .indexOf(enteredText.toLowerCase()); // fetching first match index

          if (matchIndex == -1) {
            // if no option matched return empty container
            return Container();
          }

          // Displaying option where matched option characters will be displayed in grey and
          // rest in black color
          final TextSpan textSpan = TextSpan(
            children: [
              TextSpan(
                text: option.substring(
                    matchIndex, matchIndex + enteredText.length),
                style: textTheme.headlineSmall?.copyWith(color: AppColors.grey),
              ),
              TextSpan(
                text: option.substring(matchIndex + enteredText.length),
                style:
                    textTheme.headlineSmall?.copyWith(color: AppColors.black),
              )
            ],
          );
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 28,
            ),
            child: GestureDetector(
              onTap: () => onSelected(option),
              child: RichText(
                text: textSpan,
              ),
            ),
          );
        },
      ),
    );
  }
}
