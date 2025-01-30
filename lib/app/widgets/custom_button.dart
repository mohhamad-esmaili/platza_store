import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool outlineMode;
  const CustomButton(
      {super.key,
      required this.title,
      required,
      required this.onTap,
      this.outlineMode = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: outlineMode ? Colors.transparent : Color(0xffFF7A00),
          overlayColor: Color(0xffFF7A00),
          shape: outlineMode
              ? RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(30))
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: outlineMode ? Colors.black : Color(0xffFFFFFF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
