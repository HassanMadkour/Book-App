import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.borderRadius, this.color});
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        height: 40,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10)),
        color: color ?? Colors.white,
        onPressed: () {},
        child: Text(
          color != null ? "Download" : "read",
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
