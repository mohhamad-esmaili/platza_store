import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:platza_store/core/gen/assets.gen.dart';
import 'package:platza_store/core/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductView extends StatefulWidget {
  ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final List<String> shirtSizes = ['S', 'M', 'L', 'XL', 'XXL'];
  final PageController pageController = PageController(initialPage: 0);
  String selectedSize = 'L';

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Assets.icons.bookmark.svg(),
                  ),
                ],
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Hero(
                tag: ValueKey(index),
                child: Container(
                  height: Get.size.height / 2,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        controller: pageController,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Assets.images.authPoster.provider(),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 20,
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 5,
                          effect: ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: Colors.white,
                            dotColor: Colors.grey.shade500,
                          ),
                          onDotClicked: (index) {
                            pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 5),
              child: Text(
                "Premium Tangerine Shirt",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Andy shoes are designed to keeping in...",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Size",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: shirtSizes.map((category) {
                    bool isSelected = category == selectedSize;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = category;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: 45,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: isSelected ? Color(0xff0D0D0E) : null,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "\$257.85",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                        width: Get.size.width / 2.5,
                        child:
                            CustomButton(title: "Add To Cart", onTap: () {})),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
