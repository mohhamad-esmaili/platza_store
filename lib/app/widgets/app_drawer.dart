import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:platza_store/app/gen/assets.gen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Platza",
                          style: TextStyle(
                            fontSize: 36,
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Store",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Assets.icons.info.svg(width: 25, height: 25))
                ],
              ),
            ),
            Gap(10),
            drawerButton(
              "Add Product",
              Icons.add_shopping_cart_rounded,
              () {},
            ),
            drawerButton(
              "Edit Products",
              Icons.edit,
              () {},
            ),
            drawerButton(
              "Categories",
              Icons.category_rounded,
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerButton(String title, IconData icon, VoidCallback ontap) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: OutlinedButton.icon(
          icon: Icon(icon),
          onPressed: ontap,
          label: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
}
