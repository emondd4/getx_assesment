import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_assesment/utils/AppColors.dart';
import 'package:getx_assesment/utils/AppRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.appPrimarySwatch,
      ),
      getPages: AppRoutes.instance.routeList,
      initialRoute: "/splashPage",
    );
  }
}
