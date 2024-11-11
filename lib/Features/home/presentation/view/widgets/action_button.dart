import 'package:flutter/material.dart';
import 'package:project/core/widgets/custom_button.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomButton(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
        ),
        CustomButton(
          color: Colors.redAccent,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
        ),
      ],
    );
  }
}
