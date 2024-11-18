import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platza_store/core/gen/assets.gen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = ['All', 'Men', 'Women', 'Kids', 'Other'];
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar with flexible space
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          sliver: SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 130,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
            surfaceTintColor: Get.theme.scaffoldBackgroundColor,
            flexibleSpace: const FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Best trendy collection!",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            leading: IconButton(
              onPressed: () {},
              icon: Assets.icons.menu.svg(
                width: 30,
                height: 30,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Assets.icons.profile.svg(
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),

        // Persistent header for the custom category selector
        SliverPersistentHeader(
          pinned: true,
          delegate: _CategoryHeader(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
        ),

        // Grid content based on selected category
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 8,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return SizedBox(
                  height: 250,
                  child: Stack(
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Assets.images.authPoster.provider(),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        right: 15,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff0D0D0E),
                              border: Border.all(color: Colors.white, width: 7),
                            ),
                            child: Center(
                              child: Assets.icons.bag.svg(
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$200",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Leather Coart",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// Persistent header delegate for the category selector
class _CategoryHeader extends SliverPersistentHeaderDelegate {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  _CategoryHeader({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Get.theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          String category = categories[index];
          bool isSelected = category == selectedCategory;

          return GestureDetector(
            onTap: () => onCategorySelected(category),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              margin: EdgeInsets.only(
                left: index == 0 ? 25 : 3,
                right: index == categories.length - 1 ? 25 : 3,
              ),
              decoration: BoxDecoration(
                color: isSelected ? Get.theme.primaryColor : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 50; // Height of the container
  @override
  double get minExtent => 50; // Height of the container
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
