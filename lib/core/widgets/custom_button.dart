import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.borderRadius, this.color});
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        height: 45,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10)),
        color: color ?? Colors.white,
        onPressed: () {},
        child: const Text(
          "19.99\$",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
