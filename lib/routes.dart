import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/middel_ware.dart';
import 'package:deliveryapp/view/screens/auth/forgetPassword/forgetPassword.dart';
import 'package:deliveryapp/view/screens/auth/forgetPassword/resetPassword.dart';
import 'package:deliveryapp/view/screens/auth/forgetPassword/success_resetPassword.dart';
import 'package:deliveryapp/view/screens/auth/forgetPassword/verifyCode.dart';
import 'package:deliveryapp/view/screens/auth/language.dart';
import 'package:deliveryapp/view/screens/auth/login.dart';
import 'package:deliveryapp/view/screens/auth/signUp.dart';
import 'package:deliveryapp/view/screens/auth/success_signUp.dart';
import 'package:deliveryapp/view/screens/auth/verification_email.dart';
import 'package:deliveryapp/view/screens/homePage.dart';
import 'package:deliveryapp/view/screens/home_screen.dart';
import 'package:deliveryapp/view/screens/onboarding.dart';
import 'package:deliveryapp/view/screens/orders/archives_orders.dart';
import 'package:deliveryapp/view/screens/orders/order_tracking.dart';
import 'package:deliveryapp/view/screens/orders/orders_details.dart';
import 'package:deliveryapp/view/screens/orders/pending_orders.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? myPages = [
  //onboarding
  GetPage(
    name: "/",
    page: () => const LanguageScreen(),
    middlewares: [MyMiddleWare(), AuthMiddleWare()],
  ),
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
  //auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.verifyEmail, page: () => const VerifyEmail()),
  //orders
  GetPage(name: AppRoutes.orders, page: () => const OrdersScreen()),
  GetPage(name: AppRoutes.archiveOrders, page: () => const OrdersArchive()),
  GetPage(name: AppRoutes.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoutes.orderTracking, page: () => const OrderTracking()),
  //
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),
  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
];
