import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    Timer(Duration(seconds: 3), () {
      print("Hello");
      Get.offNamed("homePage");
    });
    super.onInit();
  }

}