import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:platza_store/app/routes/app_pages.dart';

import 'package:platza_store/app/gen/assets.gen.dart';
import 'package:platza_store/app/widgets/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: Get.size.height / 1.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
                border: Border.all(
                  color: Color(0xff000000),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Assets.images.authPoster.provider(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find The",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Best Collections",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Get your dream item easily with Platza and get other intersting offer",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      title: "Sign Up",
                      onTap: () => Get.toNamed(AppRoutes.signUpUrl),
                      outlineMode: true,
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: CustomButton(
                      title: "Sign In",
                      onTap: () => Get.toNamed(AppRoutes.signInUrl),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
