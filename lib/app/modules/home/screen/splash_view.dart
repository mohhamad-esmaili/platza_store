import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:platza_store/app/gen/assets.gen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Assets.images.logos.platzaLogo
                  .svg(
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  )
                  .animate()
                  .fade(duration: Duration(milliseconds: 300)),
            ),
            Gap(100),
            CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 5,
            )
                .animate(delay: Duration(seconds: 1))
                .fade(duration: Duration(milliseconds: 300)),
          ],
        ),
      ),
    );
  }
}
