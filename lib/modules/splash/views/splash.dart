import 'package:bakwan/common/style/ui.dart';
import 'package:bakwan/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () => Get.offNamed(Routes.journal),
    );

    return Scaffold(
      backgroundColor: UIConst.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/bakwan.png",
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
