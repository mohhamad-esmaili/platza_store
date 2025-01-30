import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platza_store/app/routes/app_pages.dart';
import 'package:platza_store/app/theme/app_theme.dart';
import 'package:platza_store/app/widgets/main_wrapper.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.homeUrl,
      getPages: AppPages.pages,
      home: MainWrapper(),
    ),
  );
}
