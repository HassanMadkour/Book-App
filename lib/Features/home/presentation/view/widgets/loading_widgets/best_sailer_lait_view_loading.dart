import 'package:flutter/material.dart';
import 'package:project/Features/home/presentation/view/widgets/loading_widgets/best_sailer_item_loading.dart';
import 'package:project/core/utils/styles.dart';
import 'package:project/core/widgets/fading_widget.dart';

class BestSailerLastViewLoading extends StatelessWidget {
  const BestSailerLastViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Best Sailer", style: TextStyles.textStyle20),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  const FadingWidget(child: BestSailerItemLoading()),
              itemCount: 5),
        ],
      ),
    );
  }
}
