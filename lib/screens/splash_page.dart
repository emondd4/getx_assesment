import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_assesment/controller/splash_controller.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          child: Lottie.asset("assets/json/splash.json"),
        ),
      ),
    );
  }
}
