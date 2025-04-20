import 'package:get/get.dart';
import 'package:sensometer_environment_monitoring/Screens/NotificationListScreen.dart';

import '../Screens/BuildingDetailsScreen.dart';
import '../Screens/ChamberDetailsScreen.dart';
import '../Screens/DashboardScreen.dart';
import '../Screens/DomainScreen.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/SplashScreen.dart';

class AppRoutes{

  static AppRoutes instance = AppRoutes();

  /// All pages
   List<GetPage> routeList = [
    GetPage(name: "/splashPage", page: () => const SplashPage(),transition: Transition.native),
    GetPage(name: "/domainPage", page: () => const DomainPage(),transition: Transition.native),
    GetPage(name: "/loginPage", page: () => const LoginPage(),transition: Transition.native),
    GetPage(name: "/dashboardPage", page: () => const DashboardPage(),transition: Transition.native),
    GetPage(name: "/roomListPage", page: () => const BuildingDetailsPage(),transition: Transition.native),
    GetPage(name: "/roomDetailsPage", page: () => const ChamberDetailsPage(),transition: Transition.native),
    GetPage(name: "/notifications", page: () => const NotificationListScreen(),transition: Transition.native),
  ];


}