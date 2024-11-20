import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platza_store/core/config/app_router.dart';
import 'package:platza_store/core/config/app_theme.dart';
import 'package:platza_store/core/widgets/main_wrapper.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRouter.homeUrl,
      getPages: AppRouter.appRoutes,
      home: MainWrapper(),
    );
  }
}
