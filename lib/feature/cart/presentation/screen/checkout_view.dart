import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:platza_store/core/gen/assets.gen.dart';
import 'package:platza_store/core/widgets/custom_button.dart';
import 'package:platza_store/feature/cart/presentation/widgets/bill_data.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              // Header Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 50),
                  ],
                ),
              ),
              Gap(10),
              // Delivery Address Section
              sectionTitle("Delivery Address"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Assets.images.mapPreview.provider(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "25/3 Housing Estate, Sylhet",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
              // Delivery Info
              ListTile(
                leading: Icon(
                  Icons.access_time_rounded,
                  color: Color(0xff7B7B8D),
                ),
                title: Text(
                  "Delivered in next 7 days",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Payment Method Section
              sectionTitle("Payment Method"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Assets.images.logos.visa.image(),
                    Assets.images.logos.americanExpress.image(),
                    Assets.images.logos.mastercard.image(),
                    Assets.images.logos.paypal.image(),
                    Assets.images.logos.applePay.image(),
                  ],
                ),
              ),
              // Add Voucher
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Colors.grey,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xffFCFCFC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Add Voucher",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Note Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Note: ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.redAccent[700],
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: "Use your order id at the payment. Your Id ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff797780),
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: "#154619 ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff161626),
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text:
                            "if you forget to put your order id we can’t confirm the payment.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff797780),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Billing Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return BillData(
                      products: "Total Items (3)",
                      totalProce: "\$116.00",
                    );
                  },
                ),
              ),
              Gap(70),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(vertical: 8),
        height: Get.size.height / 10,
        width: Get.size.width / 2,
        child: CustomButton(
          title: "Pay Now",
          onTap: () {},
        ),
      ),
    );
  }

  Widget sectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      );
}
