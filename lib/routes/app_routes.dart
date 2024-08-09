// This class contains all route names used in the app for navigation purposes and
// manages navigation.

import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/views/screens/address/add_new_address.dart';
import 'package:after_market_mobile_application/views/screens/authentication/login.dart';
import 'package:after_market_mobile_application/views/screens/authentication/signup.dart';
import 'package:after_market_mobile_application/views/screens/authentication/welcome_back.dart';
import 'package:after_market_mobile_application/views/screens/order/order_details.dart';
import 'package:after_market_mobile_application/views/screens/order/order_placed.dart';
import 'package:after_market_mobile_application/views/screens/order/orders_list_screen.dart';
import 'package:after_market_mobile_application/views/screens/order/return_order.dart';
import 'package:after_market_mobile_application/views/screens/password/code_verification.dart';
import 'package:after_market_mobile_application/views/screens/password/forgot_password.dart';
import 'package:after_market_mobile_application/views/screens/password/password_change_success.dart';
import 'package:after_market_mobile_application/views/screens/password/update_password.dart';
import 'package:after_market_mobile_application/views/screens/product/product_detail.dart';
import 'package:after_market_mobile_application/views/screens/product/products_list_screen.dart';
import 'package:after_market_mobile_application/views/screens/product/review_form.dart';
import 'package:after_market_mobile_application/views/shared_widgets/empty_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const login = '/login';
  static const signUp = '/signUp';
  static const forgetPassword = '/forgetPassword';
  static const codeVerification = '/codeVerification';
  static const updatePassword = '/updatePassword';
  static const passwordChangeSuccess = '/passwordChangeSuccess';
  static const welcomeBack = '/welcomeBack';
  static const productListScreen = '/productListScreen';
  static const productDetail = '/productDetail';
  static const orderListScreen = '/orderListScreen';
  static const orderDetail = '/orderDetail';
  static const returnOrder = '/returnOrder';
  static const reviewForm = '/reviewForm';
  static const orderPlaced = '/orderPlaced';
  static const addNewAddress = "/addNewAddress";

  static Route getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Login(),
        );
      case signUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignUp(),
        );
      case forgetPassword:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPassword(),
        );
      case codeVerification:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CodeVerification(),
        );
      case updatePassword:
        return MaterialPageRoute(
          builder: (BuildContext context) => const UpdatePassword(),
        );
      case passwordChangeSuccess:
        return MaterialPageRoute(
          builder: (BuildContext context) => const PasswordChangeSuccess(),
        );
      case welcomeBack:
        return MaterialPageRoute(
          builder: (BuildContext context) => const WelcomeBack(),
        );
      case productListScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProductsListScreen(
            productName: 'Engine Filters',
            isFavouriteScreen: true,
          ),
        );
      case productDetail:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductDetail());
      case orderListScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OrdersListScreen());
      case orderDetail:
        final orderStatus = settings.arguments as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => OrderDetails(
                  orderStatus: orderStatus,
                ));
      case returnOrder:
        return MaterialPageRoute(
            builder: (BuildContext context) => ReturnOrder());
      case reviewForm:
        return MaterialPageRoute(
            builder: (BuildContext context) => ReviewForm());
      case orderPlaced:
        return MaterialPageRoute(
            builder: (BuildContext context) => OrderPlaced());
      case addNewAddress:
        return MaterialPageRoute(
            builder: (BuildContext context) => AddNewAddress());

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const EmptyScreen(
            emptyDataMessage: AppStrings.noPageFound,
          ),
        );
    }
  }
}
