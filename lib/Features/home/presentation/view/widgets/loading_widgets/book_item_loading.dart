import 'package:flutter/material.dart';

class BookItemLoading extends StatelessWidget {
  const BookItemLoading({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.8 / 4.3,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              height: MediaQuery.of(context).size.height * .2,
            )));
  }
}
