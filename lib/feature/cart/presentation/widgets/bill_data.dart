import 'package:flutter/material.dart';

class BillData extends StatelessWidget {
  final String products;
  final String totalProce;
  const BillData({super.key, required this.products, required this.totalProce});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            products,
            style: const TextStyle(color: Color(0xff797780), fontSize: 18),
          ),
          Text(
            totalProce,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
