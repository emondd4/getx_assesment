import 'package:get/get.dart';
import 'package:getx_assesment/screens/home_page.dart';
import 'package:getx_assesment/screens/product_details.dart';
import '../screens/splash_page.dart';

class AppRoutes{

  static AppRoutes instance = AppRoutes();

  /// All pages
   List<GetPage> routeList = [
    GetPage(name: "/splashPage", page: () => const SplashPage(),transition: Transition.native),
    GetPage(name: "/homePage", page: () => const HomePage(),transition: Transition.native),
    GetPage(name: "/productDetailsPage", page: () => const ProductDetails(),transition: Transition.native),
  ];


}