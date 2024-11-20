import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:platza_store/core/config/app_router.dart';
import 'package:platza_store/core/gen/assets.gen.dart';
import 'package:platza_store/core/widgets/custom_button.dart';
import 'package:platza_store/feature/cart/presentation/widgets/bill_data.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(15),
                Center(
                  child: Text(
                    "Cart",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "My Orders",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(10),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        key: ValueKey(index),
                        endActionPane: ActionPane(
                          motion: DrawerMotion(),
                          extentRatio: 0.2,
                          dragDismissible: true,
                          children: [
                            CustomSlidableAction(
                              padding: EdgeInsets.only(bottom: 130),
                              backgroundColor: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              onPressed: (context) {
                                print("deleted");
                              },
                              flex: 2,
                              child: Container(
                                height: Get.size.width / 7,
                                decoration: BoxDecoration(
                                  color: Get.theme.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Assets.icons.trash.svg(width: 20),
                              ),
                            )
                          ],
                        ),
                        child: Container(
                          height: 190,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: Assets.images.authPoster.provider(),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              MaxGap(20),
                              Flexible(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      child: SizedBox(
                                        width: 118,
                                        child: Text(
                                          "Premium Tagerine Shirt",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // MaxGap(20),
                                    Flexible(
                                      child: Text(
                                        "Size: L",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$257.85",
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '1',
                                                style: TextStyle(
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'X',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    // MaxGap(20),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // DraggableScrollableSheet(
            //   controller: sheetController,
            //   builder: (context, scrollController) => Container(
            //     color: Get.theme.scaffoldBackgroundColor.withOpacity(0.5),
            //     height: Get.size.height / 4.5,
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 40,
            //       vertical: 10,
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Divider(
            //           color: Color(0xffE3E3E3),
            //           height: 15,
            //           thickness: 1,
            //         ),
            //         Expanded(
            //           child: ListView.builder(
            //             itemCount: 10,
            //             shrinkWrap: true,
            //             itemBuilder: (BuildContext context, int index) {
            //               return billData("Total Items (3)", "\$116.00");
            //             },
            //           ),
            //         ),
            //         CustomButton(title: "Checkout Now", onTap: () {})
            //       ],
            //     ),
            //   ),
            // ),
            DraggableScrollableSheet(
              controller: sheetController,
              initialChildSize: 0.3,
              builder: (BuildContext context, scrollController) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).hintColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 4,
                            width: 40,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 30),
                        sliver: SliverList.list(children: [
                          ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return BillData(
                                  products: "Total Items (3)",
                                  totalProce: "\$116.00");
                            },
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.size.width / 5, vertical: 10),
                            child: CustomButton(
                              title: "Checkout Now",
                              onTap: () => Get.toNamed(AppRouter.checkoutUrl),
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
