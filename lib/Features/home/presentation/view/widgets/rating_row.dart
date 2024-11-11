import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            FontAwesomeIcons.solidStar,
            color: Colors.amber,
            size: 20,
          ),
        ),
        Text("4.6"),
        Text("(2742)"),
      ],
    );
  }
}
